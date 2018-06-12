package module;

import junit.framework.TestCase;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;

import com.sun.glass.ui.GestureSupport;

import domain.MyMember;

public class TestadminCheck extends TestCase {
	private adminCheck admincheck = new adminCheck();
	
	public void testadminCheck() {
		Integer check = admincheck.adminCheck("id");
		assertNotNull(admincheck);
	}
}
