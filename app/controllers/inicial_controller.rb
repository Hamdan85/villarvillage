# -*- encoding : utf-8 -*-
class InicialController < ApplicationController
  def index


    #get the latest 5 news with more recent above

    @newlatests = Newlatest.order('created_at DESC').limit(5)

    #Show only the first 30 words of each post.

    @newlatests.each do |content|
      content.content = content.content.split(" ").first(30).join(" ")
    end

    @latestalbums = Album.order('created_at DESC').limit(2)

  end

  def contato

  end

  def quemsomos

  end

  def search

  end
end
