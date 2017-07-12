require 'csv'
require 'sqlite3'
require 'pry'


years = []
occupation = []
shows = []
groups = []
guests = []

CSV.foreach('daily_show_guests.csv') do |row|
    years << row[0]
    occupation << row[1]
    shows << row[2]
    groups << row[3]
    guests << row[4]
end


db = SQLite3::Database.new('../daily_show.db')
sql = "CREATE TABLE IF NOT EXISTS shows (
        id INTEGER PRIMARY KEY,
        year INTEGER,
        show TEXT
        );"
db.execute(sql)

sql = "CREATE TABLE IF NOT EXISTS guests (
        id INTEGER PRIMARY KEY,
        name TEXT,
        groups TEXT,
        occupation TEXT);"
db.execute(sql)

sql = "CREATE TABLE IF NOT EXISTS show_guests (
        id INTEGER PRIMARY KEY,
        guests_id INTEGER,
        shows_id INTEGER
        );"
db.execute(sql)


years.each_with_index do |year,ind|
    sql = "INSERT INTO shows (year, show) VALUES (?, ?)"

    db.execute(sql, year, shows[ind])
end

guests.uniq.each do |guest|
    sql_guests = "INSERT INTO guests (name, groups, occupation) VALUES (?,?,?)"
    
    
    ind = CSV.foreach('daily_show_guests.csv').find_index do |row|
        row[4] == guest
    end

    db.execute(sql_guests, guest, groups[ind], occupation[ind])
    
    
end

guests.uniq.each do |guest|
    sql = "INSERT INTO show_guests (guests_id, shows_id) VALUES (?,?)"
    index_counter = 0
    ind = 0
    CSV.foreach('daily_show_guests.csv') do |row|
        if guest == row[4]
            ind = index_counter + 1
            
            get_guest = "SELECT id FROM guests WHERE guests.name = ?"
            guest_table_id = db.execute(get_guest, guest)
            
            db.execute(sql, guest_table_id, ind)
        end
        index_counter += 1
    end
end