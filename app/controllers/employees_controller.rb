require "memoist"

class EmployeesController < ApplicationController
  extend(
    ::Memoist,
  )

  # GET /employees
  # GET /employees.json
  def index

    query_department_id = params[:query] && params[:query][:department].presence
    query_tag_id = params[:query] && params[:query][:tag].presence

    employees = Employee.all
    if query_department_id
      employees = employees.where(department_id: query_department_id)
    end
    if query_tag_id
      employees = employees.where(id: EmployeeTag.where(tag_id: query_tag_id).select(:employee_id))
    end

    render 'index',
      locals: {
        employees: employees,
        query_department_id: query_department_id,
        query_tag_id: query_tag_id,
      }
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    render 'show',
      locals: locals_for_member
  end

  # GET /employees/new
  def new
    employee = Employee.new
    render 'new',
      locals: {
        employee: employee,
      }
  end

  # GET /employees/1/edit
  def edit
    render 'edit',
      locals: locals_for_member
  end

  # POST /employees
  # POST /employees.json
  def create
    employee = Employee.new(employee_params)

    respond_to do |format|
      if employee.save
        format.html { redirect_to employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: employee }
      else
        format.html {
          render 'new',
            locals: {
              employee: employee,
            }
        }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if employee.update(employee_params)
        format.html { redirect_to employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: employee }
      else
        format.html {
          render 'edit',
            locals: {
              employee: employee,
            }
        }
        format.json { render json: employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def locals_for_member
    {
      employee: employee,
    }
  end

  def employee
    Employee.find(params[:id])
  end
  memoize :employee

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit!
  end
end
