class Portfolio < ApplicationRecord
    has_many :technologies
    # the base implementation, there are some data validations that we want as well
    # Portfolio.create!(title: "Web app", subtitle: "aoeu", body: "aoeuaoeuaoeu", technologies_attributes: [{ name: "Ruby" }, { name: "Angular"}, { name: "Rails" }, { name: "Ionic" }])
    accepts_nested_attributes_for :technologies, 
                                   reject_if: lambda { |attrs| attrs['name'].blank? }


    include Placeholder
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
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
end
