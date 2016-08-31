package myflat.dao;

import java.math.BigInteger;
import java.util.List;

import myflat.model.Customer;

public interface AnalysisKeeper {

	Customer saveCustomerDetail(Customer cust) ;

	BigInteger getTotalCustomers();

	BigInteger getNewCustomers();

	List<Customer> getRecent5Customers();
	
}
