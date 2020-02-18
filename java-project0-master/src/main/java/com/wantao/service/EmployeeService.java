package com.wantao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wantao.bean.Employee;
import com.wantao.bean.EmployeeExample;
import com.wantao.bean.EmployeeExample.Criteria;
import com.wantao.dao.EmployeeMapper;

@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;

	public List<Employee> findAllEmployee(EmployeeExample example) {
		return employeeMapper.selectByExampleWithDept(example);
	}

	/**
	 * @param
	 * @return void
	 * @description 新增用户
	 */
	public void saveEmployee(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	/**
	 * @param
	 * @return boolean
	 * @description 数据库中是否有empName,有返回false.没有返回true
	 */
	public boolean checkSameEmployee(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 查询员工
	 * @param id
	 * @return
	 */
	public Employee getEmployee(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/* 保存更新员工 */
	public void updateEmployee(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	 /* 单个删除员工 */
	public void deleteEmployee(Integer empId) {
		employeeMapper.deleteByPrimaryKey(empId);
	}

	  //批量删除
	public void deleteBatch(List<Integer> ids) {

		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);

	}
}
