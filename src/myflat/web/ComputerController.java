
package myflat.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import myflat.dao.UserDao;
import myflat.model.Computer;

@Controller
@RequestMapping("/computer")
public class ComputerController {

	@Autowired
	private UserDao userDao;
	
    @RequestMapping(value="{name}",method = RequestMethod.GET)
    public @ResponseBody List<Computer> getComputers(@PathVariable("name") String name,
                                               HttpServletRequest httpRequest,HttpServletResponse httpResponse) {
        List<Computer> CList = new ArrayList<Computer>(0);
        System.out.println("Response Type "+httpResponse.getContentType());
        httpResponse.setContentType("application/json");
        Computer c = new Computer(1L, "DeLL", "Inspiron 1510L", "Arjun", "Fan not working");
        System.out.println(c.getBrand());
        System.out.println(name);
        
//        userDao.findAllUsers();
        
        CList.add(c);
        return CList;
//        return CList;
    }
    

}
