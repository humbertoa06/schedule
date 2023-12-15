class ShiftsController < ApplicationController
  DEFAULT_SORT_COLUMN = 'first_name'
  DEFAULT_SORT_ORDER = 'asc'

  def index
    render json: sorted_employees, each_serializer: EmployeeSerializer
  end

  private

  def sorted_employees
    Employee.order(sort_column => sort_order).all
  end

  def sort_column
    valid_sort_columns.include?(params[:order_by]) ? params[:order_by] : DEFAULT_SORT_COLUMN
  end

  def sort_order
    %w[asc desc].include?(params[:sort_order]) ? params[:sort_order] : DEFAULT_SORT_ORDER
  end

  def valid_sort_columns
    %w[first_name last_name]
  end
end
