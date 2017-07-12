# require_relative "../daily_show.rb"
require_relative "sql_runner"
require_relative '../lib/querying'


@db = SQLITE3::Database.new('../daily_show.db')
@sql_runner = SQLRunner.new(@db)
@sql_runner.execute_schema_migration_sql


