require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should have_attribute(:title) }
  it { should have_attribute(:content) }
  it { should have_attribute(:todo_date) }
end
