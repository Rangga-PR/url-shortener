class Url
    include Mongoid::Document
    include Mongoid::Timestamps

    field :short_url, type: String
    field :original_url, type: String
end