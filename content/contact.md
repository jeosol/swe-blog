+++
title = "Contacts"
date = "2016-04-03"
sidemenu = "true"
description = ""
+++
<br/>

<div class="text-center">
<p>Thedibia Solutions</p>
<p>1600 Eldridge Parkway, St 1600<p>
<p>Houston, Texas, 77077-1663</p>
<!-- <p>Tel: (650)799841</p> -->
<p>email: thedibia@yahoo.com<p>
</div>
<br/>
<br/>
<div class="container-fluid">
  <form id="contact-form" class="form-horizontal"  action ="http://formspree.io/jeronwunalu@gmail.com" method="post" >
      <div class="form-group">
          <input type="hidden" name="\_subject" value="New Contact Message!"/>
          <input type="hidden" name="\_cc" value="jeronwunalu@yahoo.com, thedibia@yahoo.com"/>    
          <label class="control-label col-sm-2" for="email">Email:</label>
          <div class="col-sm-10">
              <input type="email" class="form-control" name="\_replyto" size=55 maxlength="100" placeholder="Your email address"/>
          </div>
      </div>
      <div class="form-group">    
          <label class="control-label col-sm-2" for="message">Message:</label>          
          <div class="col-sm-10">
              <textarea class="form-control" id="message" name="body"
              placeholder="Your text" rows="5" cols="50" maxlength=100>   
               </textarea>
          </div>
      </div>
      <div class="form-group">
          <div class= "col-sm-offset-2 col-sm-8">
              <!-- <input type="submit" value="Send"/> -->
              <button type="submit" class="btn btn-primary">Send</button>
          </div>
      </div>
  </form>
</div>



<!--

<form class="pure-form pure-form-stacked">
  <fieldset>
    <div class="pure-g">
      <div class="pure-u-1 pure-u-md-1-3">
        <label for="first-name">First Name</label>
        <input id="first-name" class="pure-u-23-24" type="text">
      </div>

      <div class="pure-u-1 pure-u-md-1-3">
        <label for="last-name">Last Name</label>
        <input id="last-name" class="pure-u-23-24" type="text">
      </div>

      <div class="pure-u-1 pure-u-md-1-3">
        <label for="email">E-Mail</label>
        <input id="email" class="pure-u-23-24" type="email" required>
      </div>

      <div class="pure-u-1 pure-u-md-1-3">
        <label for="city">City</label>
        <input id="city" class="pure-u-23-24" type="text">
      </div>

      <div class="pure-u-1 pure-u-md-1-3">
        <label for="state">State</label>
        <select id="state" class="pure-input-1-2">
          <option>AL</option>
          <option>CA</option>
          <option>IL</option>
        </select>
      </div>
    </div>
    <fieldset class="pure-group">
      <input type="text" class="pure-input-1-2" placeholder="A title">
      <textarea class="pure-input-1-2" placeholder="Your message"></textarea>
    </fieldset>
    <button type="submit" class="pure-button pure-button-primary">Send</button>
  </fieldset>
</form>
-->
