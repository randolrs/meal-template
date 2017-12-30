require 'test_helper'

class MealTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_template = meal_templates(:one)
  end

  test "should get index" do
    get meal_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_template_url
    assert_response :success
  end

  test "should create meal_template" do
    assert_difference('MealTemplate.count') do
      post meal_templates_url, params: { meal_template: { name: @meal_template.name } }
    end

    assert_redirected_to meal_template_url(MealTemplate.last)
  end

  test "should show meal_template" do
    get meal_template_url(@meal_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_template_url(@meal_template)
    assert_response :success
  end

  test "should update meal_template" do
    patch meal_template_url(@meal_template), params: { meal_template: { name: @meal_template.name } }
    assert_redirected_to meal_template_url(@meal_template)
  end

  test "should destroy meal_template" do
    assert_difference('MealTemplate.count', -1) do
      delete meal_template_url(@meal_template)
    end

    assert_redirected_to meal_templates_url
  end
end
