require 'rails_helper'

***REMOVED*** Specs in this file have access to a helper object that includes
***REMOVED*** the CommentsHelper. For example:
***REMOVED***
***REMOVED*** describe CommentsHelper do
***REMOVED***   describe "string concat" do
***REMOVED***     it "concats two strings with spaces" do
***REMOVED***       expect(helper.concat_strings("this","that")).to eq("this that")
***REMOVED***     end
***REMOVED***   end
***REMOVED*** end
RSpec.describe CommentsHelper, :type => :helper do
  pending "add some examples to (or delete) ***REMOVED***{__FILE__}"
end
