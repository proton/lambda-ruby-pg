require 'aws-sdk-lambda'
require 'pg'

def lambda_handler(event:, context:)
  #cloudwatch_client = Aws::CloudWatch::Client.new(region: 'eu-central-1')

  #pg_conn = PG.connect(pg_string)
  # pg_conn.exec( "SELECT * FROM pg_stat_activity" ) do |result|
  #   puts "     PID | User             | Query"
  #   result.each do |row|
  #     puts " %7d | %-16s | %s " %
  #       row.values_at('procpid', 'usename', 'current_query')
  #   end
  # end

  # TODO implement
  { statusCode: 200, body: JSON.generate('Hello from Lambda!') }
end
