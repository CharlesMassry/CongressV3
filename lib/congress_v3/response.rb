class CongressV3::Response
  attr_reader :results, :count, :page
  def initialize(response)
    @results = response['results']
    @count = response['count']
    @page = response['page']
  end
end
