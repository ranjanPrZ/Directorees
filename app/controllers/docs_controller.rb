class DocsController < ApplicationController
	def index
		@docs = Doc.all
	end

	def new
		@doc = Doc.new()
	end

	def create
		@doc = Doc.new(doc_params)

		if @doc.save
			redirect_to @doc
		else
			render 'new'
		end
	end

	def show
		@doc = find_doc
	end

private
	def find_doc
		@doc = Doc.find(params[:id])
	end

	def doc_params
		params.require(:doc).permit(:title, :content)
	end

end
