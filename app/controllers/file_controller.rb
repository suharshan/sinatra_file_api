class FileController < APIController
  
  # Retrieve files
  get '/files/:name' do
    if(File.file?("#{settings.public_folder}/files/#{params['name']}")) 
      send_file File.expand_path("files/#{params['name']}", settings.public_folder)
    else
      file_not_found
    end
  end

  # Upload files
  post '/files' do
    tempfile = params['file'][:tempfile]
    filename = params['file'][:filename]

    if(File.file?("#{settings.public_folder}/files/#{filename}")) 
      file_already_exists
    else

      begin
        FileUtils.copy(tempfile.path, "#{settings.public_folder}/files/#{filename}")
      rescue => error
	error.message
      end

      success("uploaded")
    end
  end

  # Delete files
  delete '/files/:name' do
    if(File.file?("#{settings.public_folder}/files/#{params['name']}")) 
      begin
        FileUtils.remove("#{settings.public_folder}/files/#{params['name']}")
      rescue => error
	error.message
      end
      success("deleted")
    else
      file_not_found
    end
  end
end
