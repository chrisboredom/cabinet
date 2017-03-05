class DocsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_doc
  end

  def doc_params
    params.require(:doc).require(:title, :content)
  end
end
