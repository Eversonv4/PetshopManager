require "test_helper"

class PatientAreaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patient_area_index_url
    assert_response :success
  end
end
