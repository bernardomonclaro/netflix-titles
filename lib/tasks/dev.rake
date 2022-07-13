require 'csv'

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    `rails db:drop db:create db:migrate`
    path = Rails.root.join('lib', 'tasks', 'netflix_titles.csv') # /Users/bernardomonclaro/netflix-titles/lib/tasks/netflix_titles.csv
    CSV.foreach(path, headers: true, encoding: 'UTF-8') do |row|
      Netflix.create(row.to_h)
    end
  end
end
