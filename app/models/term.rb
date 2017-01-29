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

  # get rus text from rdfs:comment
  def self.upload_rus(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{eng_title.capitalize}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get rus text from dbo:abstract
  def self.upload_rus_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{eng_title.capitalize}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get eng text from rdfs:comment
  def self.upload_eng(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{eng_title.capitalize}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  # get eng text from dbo:abstract
  def self.upload_eng_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{eng_title.capitalize}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  def self.load_descriptions
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    solutions = []
    solutions << upload_rus(sparql)
    solutions << upload_rus_mod(sparql)
    solutions << upload_eng(sparql)
    solutions << upload_eng_mod(sparql)
    solutions
  end
end
