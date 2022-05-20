require "pg"

module DatabaseConnection
  def initialize(logger=nil)
    @db = if Sinatra::Base.production?
            PG.connect(ENV['DATABASE_URL'])
          elsif Sinatra::Base.test?
            PG.connect(dbname: "eight_wonders_test")
          else
            PG.connect(dbname: "eight_wonders")
          end
    @logger = logger
  end

  def query(statement, *params)
    @logger&.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end

  def delete_all_data
    @db.exec "DELETE FROM experiences;"
    @db.exec "ALTER SEQUENCE experiences_id_seq RESTART WITH 1;"
    @db.exec "DELETE FROM destinations;"
    @db.exec "ALTER SEQUENCE destinations_id_seq RESTART WITH 1;"
    @db.exec "DELETE FROM itineraries;"
    @db.exec "ALTER SEQUENCE itineraries_id_seq RESTART WITH 1;"
  end

  def disconnect
    @db.close
  end
end
