#ExStart:
require 'aspose_slides_cloud'

class DocumentProperties

  include AsposeSlidesCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("", "")
    @slides_api = SlidesApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../../../data/" << file_name,"r") { |io| io.read } )
  end

  # Clean document properties.
  def clean_document_properties
  	file_name = "sample-input.pptx"
  	upload_file(file_name)
  
  	response = @slides_api.delete_slides_document_properties(file_name)
  end

end

documentProperties = DocumentProperties.new()
puts documentProperties.clean_document_properties
#ExEnd: