module Fog
  module Compute
    class RackspaceV2
      class Real
        
        # Retrieves single metadatum item by key.
        # @param [String<images, servers>] collection type of metadata
        # @param [String] obj_id id of the object where the metadata is attached
        # @param [String] key the key of the metadata to retrieve
        # @return [Excon::Response] response:
        #   * body [Hash]:
        #     * meta [Hash]:
        # @raise [Fog::Rackspace::Errors::NotFound] - HTTP 404
        # @raise [Fog::Rackspace::Errors::BadRequest] - HTTP 400
        # @raise [Fog::Rackspace::Errors::InternalServerError] - HTTP 500
        # @raise [Fog::Rackspace::Errors::ServiceError]
        # @see http://docs.rackspace.com/servers/api/v2/cs-devguide/content/Get_Metadata_Item-d1e5507.html
        def get_metadata_item(collection, obj_id, key)
          request(
            :expects => 200,
            :method => 'GET',
            :path => "/#{collection}/#{obj_id}/metadata/#{key}"
          )
        end
      end
      
      class Mock
        def get_metadata_item(collection, obj_id, key)
          raise Fog::Compute::RackspaceV2::NotFound if obj_id == 0
          
          response = Excon::Response.new
          response.status = 202
          response.body = {"meta" => {"environment" => "dev"}}
          response            
        end
      end
    end
  end
end
