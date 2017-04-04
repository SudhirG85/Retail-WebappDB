package Test;

import junit.framework.Assert;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.*;
import org.openqa.selenium.htmlunit.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;

import Page.homePage;
import Page.loginPage;
import Page.orderReportPage;

public class RegressionTestIT {
  @Test
  public void searchTest() {
	  
	  //System.setProperty("webdriver.chrome.driver", "C:\\Javalibs\\chromedriver.exe");
	  //WebDriver	driver = new ChromeDriver();
	  WebDriver	driver = new HtmlUnitDriver();
	  driver.get("http://10.224.86.162:8080/RetailoneDBdev/");
	  Assert.assertEquals("Retail Application Demo", driver.getTitle());
	  
	  loginPage loginpage = new loginPage(driver);
	  loginpage.validLogin().validSearch().validCheckout().proceedToCheckout().fillAddress().confirmOrder().makePayments();
	  orderReportPage reportPage = new orderReportPage(driver);
	  reportPage.orderConfirmation();
	  loginpage =  reportPage.logout();
	  driver.close();
  }
}
