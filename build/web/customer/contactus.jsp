<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <body>
        <%@include file="header.jsp" %>
        
        <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Foodie</h2>
                            <div class="breadcrumb__option">
                                <a href="index.jsp">Home</a>
                                <span>Contact-Us</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="contact spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                        <div class="contact__widget">
                            <span class="icon_phone"></span>
                            <h4>Phone</h4>
                            <p>+91 9999999999</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                        <div class="contact__widget">
                            <span class="icon_pin_alt"></span>
                            <h4>Address</h4>
                            <p>Ambavadi circle, Ahmedabad, Gujarat.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                        <div class="contact__widget">
                            <span class="icon_clock_alt"></span>
                            <h4>Open time</h4>
                            <p>08:00 am to 24:00 pm</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                        <div class="contact__widget">
                            <span class="icon_mail_alt"></span>
                            <h4>Email</h4>
                            <p>foodie@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3672.0800789801706!2d72.55115407509173!3d23.02083177917495!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e84e49acee255%3A0x95331cf8a19a4c4c!2sAmbawadi%20Cir%2C%20Ambawadi%2C%20Ahmedabad%2C%20Gujarat%20380006!5e0!3m2!1sen!2sin!4v1710569309507!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="map-inside">
                <i class="icon_pin"></i>
                <div class="inside-widget">
                    <h4>India</h4>
                    <ul>
                        <li>Phone: +91 9999999999</li>
                        <li>Add: off. no 105, sunshine complex, near ambavadi circle, ahmedabad, gujarat, 380006</li>
                    </ul>
                </div>
            </div>
        </div>
        
        <%@include file="footer.jsp" %>
        
    </body>