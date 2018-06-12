<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Timer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String job = request.getParameter("job");
    String status = request.getParameter("status");
    
    Timer timer = (Timer) application.getAttribute("timer");
    if (timer == null) {
    	timer = new Timer(true);
    	application.setAttribute("timer", timer);
    }
    
    if (job.equals("aaa")) {
    	if (status.equals("on")) {
    		// 배치작업
    		TimerTask task1 = new TimerTask() {
                @Override
                public void run() {
                	//System.out.println("aaa : " + new Date());
                	Integer loginCount = (Integer) application.getAttribute("loginCount");
                	//System.out.println("loginCount : " + loginCount);
                	
                	Set<String> set = (Set) application.getAttribute("idsSet");
                	System.out.println("loginCount : " + set.size());
                	Iterator<String> iter = set.iterator();
                	while (iter.hasNext()) {
                		System.out.println("iter: " + iter.next());
                	}
                	System.out.println();
                }
            };
            timer.scheduleAtFixedRate(task1, 1000, 3000);
    		application.setAttribute("task1", task1);
    	} else { // off
    		TimerTask task1 = (TimerTask) application.getAttribute("task1");
    		task1.cancel();
    		timer.purge();
    		application.removeAttribute("task1");
    	}
    }
    
    if (job.equals("bbb")) {
        if (status.equals("on")) {
        	// 배치작업
            TimerTask task2 = new TimerTask() {
                @Override
                public void run() {
                    System.out.println("bbb : " + new Date());
                }
            };
            timer.scheduleAtFixedRate(task2, 2000, 5000);
            application.setAttribute("task2", task2);
        } else { // off
        	TimerTask task2 = (TimerTask) application.getAttribute("task2");
            task2.cancel();
            timer.purge();
            application.removeAttribute("task2");
        }
    }
    
    response.sendRedirect("timer.jsp");
%>