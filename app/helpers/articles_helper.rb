module ArticlesHelper
    
    def article_params
        params.require(:article).permit(:title, :body, :tag_list, :image)
    end
    
    def tag_links(tags)
      tags.split(",").map{|tag| link_to tag.strip, search_path(tag.strip) }.join(" ")
    end
end
