require 'test_helper'

class JournalpaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journalpayment = journalpayments(:one)
  end

  test "should get index" do
    get journalpayments_url
    assert_response :success
  end

  test "should get new" do
    get new_journalpayment_url
    assert_response :success
  end

  test "should create journalpayment" do
    assert_difference('Journalpayment.count') do
      post journalpayments_url, params: { journalpayment: { amount: @journalpayment.amount, isPaid: @journalpayment.isPaid, journal: @journalpayment.journal } }
    end

    assert_redirected_to journalpayment_url(Journalpayment.last)
  end

  test "should show journalpayment" do
    get journalpayment_url(@journalpayment)
    assert_response :success
  end

  test "should get edit" do
    get edit_journalpayment_url(@journalpayment)
    assert_response :success
  end

  test "should update journalpayment" do
    patch journalpayment_url(@journalpayment), params: { journalpayment: { amount: @journalpayment.amount, isPaid: @journalpayment.isPaid, journal: @journalpayment.journal } }
    assert_redirected_to journalpayment_url(@journalpayment)
  end

  test "should destroy journalpayment" do
    assert_difference('Journalpayment.count', -1) do
      delete journalpayment_url(@journalpayment)
    end

    assert_redirected_to journalpayments_url
  end
end
