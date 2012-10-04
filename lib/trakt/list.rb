module Trakt
  class List
    include Connection
    # TODO options should be the various options at some point
    attr_accessor :slug
    def add(name)
      result = post 'lists/add/', :description => 'test', :name => name, :privacy => 'private'
      @slug = result['slug']
      return self
    end
    def get(slug)
      @slug = slug
      return self
    end
    def add_item(data)
      add_items([data])
    end
    def add_items(data)
      post("lists/items/add/", 'slug' => slug, 'items' => data)
    end
    def delete_item(data)
      delete_items([data])
    end
    def delete_items(data)
      post("lists/items/delete/", 'slug' => slug, 'items' => data)
    end
    def delete
      post "lists/delete/", 'slug' => slug
    end
  end
end
