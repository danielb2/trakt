module Trakt
  class List
    include Connection
    # TODO options should be the various options at some point
    attr_accessor :slug, :add_info
    def add(name,options={})
      result = post 'lists/add/', options.merge(:name => name)
      @slug = result['slug']
      @add_info = result
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
    def item_delete(data)
      items_delete([data])
    end
    def items_delete(data)
      post("lists/items/delete/", 'slug' => slug, 'items' => data)
    end
    def delete
      post "lists/delete/", 'slug' => slug
    end
    def update(options)
      post "lists/update/", options.merge('slug' => slug)
    end
  end
end
