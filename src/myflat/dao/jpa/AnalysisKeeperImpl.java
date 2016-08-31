package myflat.dao.jpa;

import java.math.BigInteger;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myflat.dao.AnalysisKeeper;
import myflat.model.Customer;

@Repository
public class AnalysisKeeperImpl implements AnalysisKeeper{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Customer saveCustomerDetail(Customer cust)  {
		return entityManager.merge(cust);
	}

	@Override
	public BigInteger getTotalCustomers() {
		Query query = entityManager.createNativeQuery("select count(*) from customers");
		return (BigInteger) query.getSingleResult();
	}

	@Override
	public BigInteger getNewCustomers() {
		Query query = entityManager.createNativeQuery(" select count(*) from (select count(phone) from customers group by phone having count(phone) =1) as temp;");
		return (BigInteger) query.getSingleResult();
	}

	@Override
	public List<Customer> getRecent5Customers() {
		return entityManager.createQuery("from Customer order by created desc ", Customer.class).setMaxResults(5).getResultList();
	}
	
}
