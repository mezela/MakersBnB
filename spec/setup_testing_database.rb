require 'pg'

def setup_testing_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE properties, users, requests")
  connection.exec("ALTER SEQUENCE users_id_seq RESTART WITH #{1};")
  connection.exec("ALTER SEQUENCE properties_id_seq RESTART WITH #{1};")
  connection.exec("ALTER SEQUENCE requests_id_seq RESTART WITH #{1};")
end
