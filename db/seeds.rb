# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.destroy_all
Question.destroy_all
Record.destroy_all

Team.create(name: 'GM 3')
Team.create(name: 'GM 6')
Team.create(name: 'GM 8')
Team.create(name: 'GM 10')
Team.create(name: 'GM 12')
Team.create(name: 'GM 13')

Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)
Question.create(max_score: 20)