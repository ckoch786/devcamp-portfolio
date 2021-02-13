class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image
    
    # prefered 
    def self.angular
        where(subtitle: 'Angular')
    end
    
    # -> {} is ruby lambda
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

    # for non 'static' defaults do this instead of setting defaults on migration
    # this call back is made after Portfolio.new '#new'
    # after_create happens after #create
    after_initialize :set_defaults
    
    # self => this
    def set_defaults
        # ||= is if null then assign
        # shortcut for 
        # if self.main_image == nil 
        #    self.main_image = "http://place..."
        # end
        # if only used = it would override the existing values
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end
end
