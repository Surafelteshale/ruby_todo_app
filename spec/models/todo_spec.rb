require
require 'rails_helper'

RSpec.describe Todo, type: :model do

  subject { create(:todo) }

  attributes = [
    { title: %i[presence uniqueness] },
    { status: %i[presence] }
  ]
  include_examples('model_shared_spec', :todo)
  include_examples('model_shared_spec', :is_completed)






# RSpec.describe Todo, type: :model do
#   subject {create(:todo) }
#   it{ is_expected.to(validate_presence_of(:task)) }
#   it{ is_expected.to(validate_presence_of(:is_completed)) }
# end

end