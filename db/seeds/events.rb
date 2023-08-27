require 'csv'
CSV.foreach(File.open(Rails.root.join("db/data/mokumoku.csv")), headers: true) do |row|
  FactoryBot.create(:event, title: row['title'], content: row['content'])
end
