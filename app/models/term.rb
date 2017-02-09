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
    }
  end

  # get rus text from rdfs:comment
  def upload_rus(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{eng_title}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get rus text from dbo:abstract
  def upload_rus_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{eng_title}"@en .
          FILTER ( lang(?description) = "ru" )
        }
      SPARQL
    )
  end

  # get eng text from rdfs:comment
  def upload_eng(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept rdfs:comment ?description .
          ?concept rdfs:label "#{eng_title}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  # get eng text from dbo:abstract
  def upload_eng_mod(sparql)
    sparql.query(
      <<-SPARQL
        SELECT DISTINCT ?concept ?description
        WHERE {
          ?concept dbo:abstract ?description .
          ?concept rdfs:label "#{eng_title}"@en .
          FILTER ( lang(?description) = "en" )
        }
      SPARQL
    )
  end

  def load_descriptions
    sparql = SPARQL::Client.new("http://dbpedia.org/sparql")
    solutions = []
    solutions << upload_rus(sparql).first[:description].value
    solutions << upload_rus_mod(sparql).first[:description].value
    solutions << upload_eng(sparql).first[:description].value
    solutions << upload_eng_mod(sparql).first[:description].value
    solutions
  end
end
