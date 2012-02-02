module LetsFreckle
  class Project < DelegateClass(Hashie::Mash)
    extend ClientResource

    def self.all
      get('projects')
    end

    def self.create(options = {})
      post('projects', options.merge(:root => :project))
    end


    def entries
      Entry.find(:projects => [id])
    end
  end
end
