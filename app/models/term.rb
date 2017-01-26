class Term
  include Mongoid::Document
  field :title, type: String
  field :eng_title, type: String
  field :description, type: String
  field :uri, type: String
end
