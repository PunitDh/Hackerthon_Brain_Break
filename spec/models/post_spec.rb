require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with valid attributes" do
    expect(Post.new).to be_valid
  end
end
