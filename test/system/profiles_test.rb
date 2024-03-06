require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "should create profile" do
    visit profiles_url
    click_on "New profile"

    fill_in "Allergies", with: @profile.allergies
    fill_in "Blood type", with: @profile.blood_type
    fill_in "Contact address", with: @profile.contact_address
    fill_in "Contact phone number", with: @profile.contact_phone_number
    fill_in "Emergency contact name", with: @profile.emergency_contact_name
    fill_in "Emergency contact phone", with: @profile.emergency_contact_phone
    fill_in "Emergency contact relationship", with: @profile.emergency_contact_relationship
    fill_in "Gender", with: @profile.gender
    fill_in "Medical conditions", with: @profile.medical_conditions
    fill_in "Preferred comunication language", with: @profile.preferred_comunication_language
    fill_in "User", with: @profile.user_id
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "should update Profile" do
    visit profile_url(@profile)
    click_on "Edit this profile", match: :first

    fill_in "Allergies", with: @profile.allergies
    fill_in "Blood type", with: @profile.blood_type
    fill_in "Contact address", with: @profile.contact_address
    fill_in "Contact phone number", with: @profile.contact_phone_number
    fill_in "Emergency contact name", with: @profile.emergency_contact_name
    fill_in "Emergency contact phone", with: @profile.emergency_contact_phone
    fill_in "Emergency contact relationship", with: @profile.emergency_contact_relationship
    fill_in "Gender", with: @profile.gender
    fill_in "Medical conditions", with: @profile.medical_conditions
    fill_in "Preferred comunication language", with: @profile.preferred_comunication_language
    fill_in "User", with: @profile.user_id
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Profile" do
    visit profile_url(@profile)
    click_on "Destroy this profile", match: :first

    assert_text "Profile was successfully destroyed"
  end
end
