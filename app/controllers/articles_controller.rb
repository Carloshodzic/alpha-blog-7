class ArticlesController <ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @article = Article.all
    end

    def new
        @article = Article.new

    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "El Articulo se ha creado correctamente."
            redirect_to @article  
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "El Articulo se ha actualizado correctamente."
            redirect_to @article  
        else
            render 'edit', status: :unprocessable_entity
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, status: :see_other
    end
end