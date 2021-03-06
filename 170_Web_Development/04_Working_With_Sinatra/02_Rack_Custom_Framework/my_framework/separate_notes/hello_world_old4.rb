require_relative "advice"

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
      when '/'
        ['200', {"Content-Type" => 'text/html'}, [erb(:index)]]
      when '/advice'
	piece_of_advice = Advice.new.generate
	[
	  '200',
	  {"Content-Type" => 'text/html'},
	  [erb(:advice, message: piece_of_advice)]
	]
      else
	[
	  '404',
	  {"Content-Type" => 'text/html', "Content-Length" => '48'},
	  [erb(:not_found)]
	]
    end
  end

  private

  def erb(filename, local = {})
    b = binding
    message = local[:message]
    path = File.expand_path("../views/#{filename}.erb", __FILE__)
    content = File.read(path)
    ERB.new(content).result(b)
  end
end
