require 'rails_helper'

describe Subgenre do
  it { should validate_presence_of :description }
  it { should have_many :works }
end
