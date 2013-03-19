require 'csv'

CSV.foreach("words.csv", "r") do |row|
  work = row[0]
  meaning = row[1]

  puts work + "," + meaning
end
