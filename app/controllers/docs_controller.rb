class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all.order('created_at DESC')
  end

  def show

  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      redirect_to @doc, notice: 'Document has been created successfully'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      redirect_to @doc, notice: "Document updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @doc.delete
    redirect_to docs_path, notice: "Your document was deleted successfully"
  end

  private

  def find_doc
    @doc = Doc.find(params[:id])
  end

  def doc_params
    params.require(:doc).permit(:title, :content)
  end
end
