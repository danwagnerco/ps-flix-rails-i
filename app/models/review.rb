class Review < ActiveRecord::Base

  validates :name, :stars, :comment, :city, :presence => true
  validates :stars, :numericality => { 
    :only_integer             => true,
    :greater_than_or_equal_to => 1,
    :less_than_or_equal_to    => 5,
    :message                  => "must be between 1 and 5"
  }
  validates :comment, :length => {:minimum => 4}
  validates :state, :length => {:is => 2}

  belongs_to :movie
end
