class Term
  include Mongoid::Document
  field :title, type: String
  field :eng_title, type: String
  field :description, type: String
  field :uri, type: String

  def to_json
    {
      id: id.to_s,
      description: description,
      title: title,
      eng_title: eng_title,
      uri: uri
    }.to_s
  end
end
