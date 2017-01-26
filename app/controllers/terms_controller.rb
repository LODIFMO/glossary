class TermsController < ApplicationController
  def index
    @terms = Term.all
  end

  def new
  end

  def create
    @term = Term.create! term_params
  rescue => _e
  end

  private

  def term_params
    params.require(:term).permit(:title, :eng_title)
  end
end
