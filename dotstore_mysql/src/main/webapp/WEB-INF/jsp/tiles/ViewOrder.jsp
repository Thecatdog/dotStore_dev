<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/newOrder.css?ver=6"/>


<div class="container viewOrder-container" align="center">
	<table id="main-menu">
	  <tr><td>
	    <a href='<c:url value="/shop/index.do"/>'>
	      <b><font color="white" size="5"><i class="fas fa-arrow-circle-left"></i></font></b></a>
	  </td></tr>
	</table>

  <c:if test="${!empty message}">
    <b style="color:#fff"><c:out value="${message}" /></b>
  </c:if>
  
  <p></p>
  <table class="table table-hover">
    <tr>
      <td align="center" colspan="2"><font size="4">
        <b>Order</b></font> <br />
        <font size="3"><b>
          <fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" /></b>
        </font></td>
    </tr>
    <tr>
      <td colspan="2"><font color="white" size="4"><b>Payment Details</b></font></td>
    </tr>
    <tr>
      <td>Card Type:</td>
      <td><c:out value="${order.cardType}" /></td>
    </tr>
    <tr>
      <td>Card Number:</td>
      <td><c:out value="${order.creditCard}" /> 
        <font color="red" size="2">* Fake number!</font></td>
    </tr>
    <tr>
      <td>Expiry Date (MM/YYYY):</td>
      <td><c:out value="${order.expiryDate}" /></td>
    </tr>
    <tr>
      <td colspan="2"><font color="white" size="4"><b>Billing Address</b></font></td>
    </tr>
    <tr>
      <td>First name:</td>
      <td><c:out value="${order.billToFirstName}" /></td>
    </tr>
    <tr>
      <td>Last name:</td>
      <td><c:out value="${order.billToLastName}" /></td>
    </tr>
    <tr>
      <td>Address 1:</td>
      <td><c:out value="${order.billAddress1}" /></td>
    </tr>
    <tr>
      <td>Address 2:</td>
      <td><c:out value="${order.billAddress2}" /></td>
    </tr>
    <tr>
      <td>City:</td>
      <td><c:out value="${order.billCity}" /></td>
    </tr>
    <tr>
      <td>State:</td>
      <td><c:out value="${order.billState}" /></td>
    </tr>
    <tr>
      <td>Zip:</td>
      <td><c:out value="${order.billZip}" /></td>
    </tr>
    <tr>
      <td>Country:</td>
      <td><c:out value="${order.billCountry}" /></td>
    </tr>
    <tr>
      <td colspan="2"><font color="white" size="4"><b>Shipping Address</b></font></td>
    </tr>
    <tr>
      <td>First name:</td>
      <td><c:out value="${order.shipToFirstName}" /></td>
    </tr>
    <tr>
      <td>Last name:</td>
      <td><c:out value="${order.shipToLastName}" /></td>
    </tr>
    <tr>
      <td>Address 1:</td>
      <td><c:out value="${order.shipAddress1}" /></td>
    </tr>
    <tr>
      <td>Address 2:</td>
      <td><c:out value="${order.shipAddress2}" /></td>
    </tr>
    <tr>
      <td>City:</td>
      <td><c:out value="${order.shipCity}" /></td>
    </tr>
    <tr>
      <td>State:</td>
      <td><c:out value="${order.shipState}" /></td>
    </tr>
    <tr>
      <td>Zip:</td>
      <td><c:out value="${order.shipZip}" /></td>
    </tr>
    <tr>
      <td>Country:</td>
      <td><c:out value="${order.shipCountry}" /></td>
    </tr>
    <tr>
      <td>Courier:</td>
      <td><c:out value="${order.courier}" /></td>
    </tr>
    </table>
    
	<table class="table table-hover" style="width:100%">
		<tr>
	       	<td><b>Item ID</b></td>
			<td><b>Product ID</b></td>
			<td><b>Description</b></td>
			<td><b>Price</b></td>
		</tr>
		<c:forEach var="item" items="${order.cartList}">
			<tr>
			  <td>
			    <b><a href='<c:url value="/shop/${item.itemId}/findItem.do" />'>
			<font color="white">${item.itemId}</font>
			           </a></b></td>
			<td>${item.productId}</td>
			<td>${item.description}</td>
			<td><fmt:formatNumber value="${item.listPrice}" pattern="#,###" />원</td>
			</tr>
		</c:forEach>
		<tr>
	  		<td colspan="5" align="right">
	  			<b>Total: <fmt:formatNumber value="${order.totalPrice}" pattern="#,###" /></b>
	  	 	</td>
		</tr>
	</table>
</div>