package Test;

import junit.framework.Assert;

import org.testng.annotations.Test;
//import org.openqa.selenium.*;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.firefox.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.*; 

public class BasicTestIT {
  @Test
  public void f() {
	 // System.setProperty("webdriver.chrome.driver", "/bin/chromedriver");
	 // WebDriver	driver = new ChromeDriver();
	 //WebDriver	driver = new FirefoxDriver();
	 WebDriver	driver = new HtmlUnitDriver();
	  driver.get("http://10.224.86.162:8080/RetailoneDBdev/");
	  Assert.assertEquals("Retail Application Demo", driver.getTitle());
	  driver.close();
  }
}