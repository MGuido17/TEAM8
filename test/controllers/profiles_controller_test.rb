require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference("Profile.count") do
      post profiles_url, params: { profile: { allergies: @profile.allergies, blood_type: @profile.blood_type, contact_address: @profile.contact_address, contact_phone_number: @profile.contact_phone_number, emergency_contact_name: @profile.emergency_contact_name, emergency_contact_phone: @profile.emergency_contact_phone, emergency_contact_relationship: @profile.emergency_contact_relationship, gender: @profile.gender, medical_conditions: @profile.medical_conditions, preferred_comunication_language: @profile.preferred_comunication_language, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { allergies: @profile.allergies, blood_type: @profile.blood_type, contact_address: @profile.contact_address, contact_phone_number: @profile.contact_phone_number, emergency_contact_name: @profile.emergency_contact_name, emergency_contact_phone: @profile.emergency_contact_phone, emergency_contact_relationship: @profile.emergency_contact_relationship, gender: @profile.gender, medical_conditions: @profile.medical_conditions, preferred_comunication_language: @profile.preferred_comunication_language, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference("Profile.count", -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
