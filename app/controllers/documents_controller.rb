class DocumentsController < ApplicationController
  before_action :set_document, only: [:show]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])
  end

  # GET /documents/new
  def new
    @document = Document.new
  end


  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Documento criado com sucesso.' }
        format.json { render :show, status: :created, location: @document }
        format.pdf { params[:document][:file].each do |file|
          @document.file.create!(:document => file)
        end}
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # def render
  #   pdf = Dir[@document.file]
  #   Docsplit.extract_text(pdf, :ocr => false, :output => 'storage/text')
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :content, :file)
    end
end
