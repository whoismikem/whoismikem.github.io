
class ConnectionSession
  attr_accessor :url, :header, :http_method
	def initialize(url: nil, endpoint: nil, header: nil, request_body: nil, http_method: nil)
    @url = endpoint.nil? ? url: url + endpoint
    @header = header.nil? ? {} : header
    @request_body = request_body
    @http_method = http_method
    yield(self) if block_given?

    have_everything?
	end

  def have_everything?
    puts 'Checking if we have everything'
    if @url && @header && @http_method
      puts 'We have all we need'
    else
      puts 'We are missing things'
    end
  end

end

URL = 'http://api.com'
HEADER = { 'Content-Type': 'application/json' }
METHOD = :POST

session_a = ConnectionSession.new do |session| 
  session.url = URL 
  session.header = HEADER
  session.http_method = METHOD
end

session_b = ConnectionSession.new { |session| session.url = URL; session.header = HEADER; session.http_method = METHOD; }

session_c = ConnectionSession.new(url: URL, header: HEADER, http_method: METHOD)