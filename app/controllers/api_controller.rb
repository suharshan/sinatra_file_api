class APIController < Sinatra::Base

  # Disabling static file direct serving
  configure do
    set :public_folder, 'static'
    disable :static
  end

  # Display help
  ['/', '/help'].each do |route|
    get route do
      output =<<-EOS.gsub(/^[ \t]+(?=\S)/, '')
        Upload file
        -----------
        curl -X POST -F \"file=@sample.png\" http://<server ip>:8080/files

        Retirieve file
        --------------
        curl http://<server ip>:8080/files/sample.png

        Delete file
        -----------
        curl -X DELETE http://<server ip>:8080/files/sample.png
      EOS
      output
    end
  end

  # Helper methods
  helpers do
    def file_not_found
      status 404
      body "File not found :( \n"
    end

    def file_already_exists
      status 409
      body "File already exists\n"
    end

    def success (message)
      status 200
      body "File #{message} successfully! :D \n"
    end
  end
end
