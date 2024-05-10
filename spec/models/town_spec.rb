require 'rails_helper'

RSpec.describe Town do
  it {should have_many :trails}
end

