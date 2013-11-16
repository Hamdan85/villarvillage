class InicialController < ApplicationController
  def index
    @artists = Artist.paginate(:page => params[:page], :per_page => 6)

    #get the latest 5 news with more recent above

    @newlatests = Newlatest.order('created_at DESC').limit(5)

    #Show only the first 30 words of each post.

    @newlatests.each do |content|
      content.content = content.content.split(" ").first(30).join(" ")
    end

    puts @newlatests.to_s
  end

  def contato

  end

  def quemsomos

  end

  def search

  end
end
