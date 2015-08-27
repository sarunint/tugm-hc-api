class ScoreboardController < ApplicationController
  include ActionController::Live
  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream,)
    scoreboard = make_scoreboard
    sse.write(scoreboard.to_json)
    redis = Redis.new
    redis.subscribe('tugm-hc') do |on|
      on.message do |channel, message|
        sse.write(message)
      end
    end
  ensure
    redis.quit
    _re.quit
    sse.close
  end

  def update
    team = Team.find_by(id: params[:team_id])
    question = Question.find_by(id: params[:question_id])
    Record.create(team: team, question: question, correct: params[:correct])

    redis = Redis.new
    scoreboard = make_scoreboard
    redis.publish('tugm-hc', scoreboard.to_json)
    redis.quit
    render json: scoreboard
  end

  def show
    render json: make_scoreboard
  end
  private
  def make_scoreboard
    questions = []
    Question.all.each do |q|
      questions << { id: q.id, score: q.max_score }
    end
    teams = []
    Team.all.each do |t|
      teams << { id: t.id, name: t.name, score: 0 }
    end
    Record.all.each do |r|
      t = teams.find_index { |i| i[:id] == r.team_id }
      q = questions.find_index { |i| i[:id] == r.question_id }
      if r.correct
        teams[t][:score] += questions[q][:score]
        questions[q][:score] -= 1
      else
        teams[t][:score] -= 5
      end
    end
    scoreboard = { teams: teams, questions: questions }
    return scoreboard
  end
end
