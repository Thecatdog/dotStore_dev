<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/newOrder.css?ver=2"/>

<c:set var="targetUrl"><c:url value="/shop/newOrderSubmitted.do" /></c:set>

<div class="container newOrder-container" align="center">
<form:form commandName="orderForm" action="${targetUrl}" method="post">
  <form:errors cssClass="error" /> <br><br>
  
  <table class="table table-hover n13">
    <tr>
      <td colspan="2">
        <font color="white" size="4"><b>Payment Details</b></font></td>
    </tr>
    <tr>
      <td>Card Type:</td>
      <td><form:select path="order.cardType" items="${creditCardTypes}" />
        <form:errors path="order.cardType" /></td>
    </tr>
    <tr>
      <td>Card Number:</td>
      <td><form:input path="order.creditCard" /> 
       <br/> <font color="red" size="2">* Use a fake number!</font>
        <form:errors path="order.creditCard" /></td>
    </tr>
    <tr>
      <td>Expiry Date (MM/YYYY):</td>
      <td><form:input path="order.expiryDate" /> 
        <form:errors path="order.expiryDate" /></td>
    </tr>
    <tr>
      <td colspan="2">
        <font color="white" size="4"><b>Billing Address</b></font></td>
    </tr>
    <tr>
    	<td>Username</td>
    	<td><form:input path="order.username" value="${username}" readonly="true" /></td>
    </tr>
    <tr>
      <td>First name:</td>
      <td><form:input path="order.billToFirstName" /> 
        <form:errors path="order.billToFirstName" /></td>
    </tr>
    <tr>
      <td>Last name:</td>
      <td><form:input path="order.billToLastName" />
        <form:errors path="order.billToLastName" /></td>
    </tr>
    <tr>
      <td>Address 1:</td>
      <td><form:input path="order.billAddress1" />
        <form:errors path="order.billAddress1" /></td>
    </tr>
    <tr>
      <td>Address 2:</td>
      <td><form:input path="order.billAddress2" />
        <form:errors path="order.billAddress2" /></td>
    </tr>
    <tr>
      <td>City:</td>
      <td><form:input path="order.billCity" /> 
        <form:errors path="order.billCity" /></td>
    </tr>
    <tr>
      <td>State:</td>
      <td><form:input path="order.billState" />
        <form:errors path="order.billState" /></td>
    </tr>
    <tr>
      <td>Zip:</td>
      <td><form:input path="order.billZip" /> 
        <form:errors path="order.billZip" /></td>
    </tr>
    <tr>
      <td>Country:</td>
      <td><form:input path="order.billCountry" /> 
        <form:errors path="order.billCountry" /></td>
    </tr>
    <tr>
      <td colspan="2">
        <form:checkbox path="shippingAddressRequired"
          label="Ship to different address..." /></td>
    </tr>
  </table>
  <p>
    <input class="btn btn-gradient" type="submit" value="Continue">
  </p>
</form:form>
</div>