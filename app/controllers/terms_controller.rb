class TermsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create update)

  def index
    @terms = Term.all
  end

  def new
  end

  def create
    @term = Term.create! term_params
    @descriptions = @term.load_descriptions
  rescue => _e
  end

  def update
    @term = Term.find params[:id]
    @term.description = params[:term][:description]
    @term.save!
    redirect_to terms_path
  rescue => _e
  end

  private

  def term_params
    params.require(:term).permit(:title, :eng_title)
  end
end
