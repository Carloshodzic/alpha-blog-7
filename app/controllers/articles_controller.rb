class ArticlesController <ApplicationController
    before_action :set_article, only: [:show, :edit ,:update, :destroy]

    def show
    end

    def index
        @article = Article.all
    end

    def new
        @article = Article.new

    end

    def edit
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "El Articulo se ha creado correctamente."
            redirect_to @article  
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "El Articulo se ha actualizado correctamente."
            redirect_to @article  
        else
            render 'edit', status: :unprocessable_entity
        end
    end
    def destroy
        set_article
        @article.destroy
        redirect_to articles_path, status: :see_other
    end

    private 

    def set_article
    @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end