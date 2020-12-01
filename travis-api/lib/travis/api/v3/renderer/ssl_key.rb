module Travis::API::V3
  class Renderer::SslKey < ModelRenderer
    type :key_pair
    representation :standard, :description, :public_key, :fingerprint
    representation :minimal, *representations[:standard]

    def href
      Renderer.href(:ssl_key,
        :"repository.id" => model.repository_id,
        :"script_name" => script_name
      )
    end

    def description
      'This key pair was generated by Travis CI'
    end
  end
end
