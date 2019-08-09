class Review < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
 
  accepts_nested_attributes_for :tags, :reject_if => proc { |att| att[:name].blank?}

  before_save :find_or_create_tag
    
  private
    def find_or_create_tag
      tag_array = [] 
      self.tags.map{ |tag| 
        tag.name.strip.split(",").each do |name|
          tag_array << name
        end
      }
      self.tags.destroy_all
      tag_array.each do |tag|
        self.tags << Tag.find_or_create_by(name: tag)
      end            
    end
end
