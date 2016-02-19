class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :author, :review, :genre_id, :amazon_id
end

# To integrate with Ember frontend, will use ActiveModel::Serializers
# It responds back with the format that is expected by Ember
# Serialisers allows to specify the format of the response in json / xml that you want to send back to the client
# gem 'active_model_serializers'
