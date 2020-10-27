<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="HVAC Template">
    <meta name="keywords" content="HVAC, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HTML | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="./css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="./css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="./css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="./css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="./css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="./css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="./css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="./css/style.css" type="text/css">


    <link rel="stylesheet" href="./layui/css/layui.css" media="all">




</head>

<body>

<div id="preloder">
    <div class="loader"></div>
</div>

<div class="offcanvas-menu-overlay"></div>

<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <ul class="header__top__widget">
                        <li><i class="fa fa-clock-o"></i>工作日: 08:00 am to 18:00 pm</li>
                        <li><i class="fa fa-envelope-o"></i> 联系我们 BMW中国@gmail.com</li>
                    </ul>
                </div>
                <div class="col-lg-5">
                    <div class="header__top__right">
                        <div class="header__top__phone">
                            <i class="fa fa-phone"></i>
                            <span>(+12) 345 678 910</span>
                        </div>
                        <div class="header__top__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="./index.jsp"><img src="./img/bmw.png" width="40%" height="40%" alt=""></a>
                </div>
            </div>
            <div class="col-lg-10">
                <div class="header__nav">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="./car.html">车辆分类</a></li>
                            <li><a href="./blog.html">官方微博</a></li>
                            <li><a href="#">车辆保养</a>
                                <ul class="dropdown">
                                    <li><a href="./car-details.html">添加保养信息</a></li>
                                    <li><a href="./blog-details.html">查看保养信息</a></li>
                                    <li><a href="./blog-details.html">修改保养信息</a></li>
                                    <li><a href="./blog-details.html">预约保养</a></li>
                                </ul>
                            </li><li><a href="#">已购</a>
                            <ul class="dropdown">
                                <li><a href="./blog-details.html">查看我的车辆信息</a></li>
                            </ul>
                        </li>

                            <li><a href="./about.html">关于我们</a></li>
                        </ul>
                    </nav>
                    <div class="header__nav__widget">
                        <div class="header__nav__widget__btn">
                            <a href="#"><i class="fa fa-cart-plus"></i></a>
                            <a href="#" class="search-switch"><i class="fa fa-search"></i></a>
                        </div>
                        <a href="http://localhost:8080/Welcome/UserLogin.jsp" class="primary-btn">登 录</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="canvas__open">
            <span class="fa fa-bars"></span>
        </div>
    </div>
</header>

<section class="hero spad set-bg" data-setbg="img/hero-bg.jpg"width="110%"height="110%">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="hero__text">
                    <div class="hero__text__title">
                        <span>现已上市</span>
                        <h2> BMW1系M运动耀夜版</h2>
                    </div>
                    <div class="hero__text__price">
                        <div class="car-model">Model 2019</div>
                        <h2>$399<span>/Month</span></h2>
                    </div>
                    <a href="#" class="primary-btn"><img src="./img/wheel.png" alt=""> Test Drive</a>
                    <a href="#" class="primary-btn more-btn">Learn More</a>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="hero__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Car Rental</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Buy Car</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="hero__tab__form">
                                <h2>Find Your Dream Car</h2>
                                <form>
                                    <div class="select-list">
                                        <div class="select-list-item">
                                            <p>Select Year</p>
                                            <select>
                                                <option data-display=" ">Select Year</option>
                                                <option value="">2020</option>
                                                <option value="">2019</option>
                                                <option value="">2018</option>
                                                <option value="">2017</option>
                                                <option value="">2016</option>
                                                <option value="">2015</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Brand</p>
                                            <select>
                                                <option data-display=" ">Select Brand</option>
                                                <option value="">Acura</option>
                                                <option value="">Audi</option>
                                                <option value="">Bentley</option>
                                                <option value="">BMW</option>
                                                <option value="">Bugatti</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Model</p>
                                            <select>
                                                <option data-display=" ">Select Model</option>
                                                <option value="">Q3</option>
                                                <option value="">A4 </option>
                                                <option value="">AVENTADOR</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Mileage</p>
                                            <select>
                                                <option data-display=" ">Select Mileage</option>
                                                <option value="">27</option>
                                                <option value="">25</option>
                                                <option value="">15</option>
                                                <option value="">10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="car-price">
                                        <p>Price Range:</p>
                                        <div class="price-range-wrap">
                                            <div class="price-range"></div>
                                            <div class="range-slider">
                                                <div class="price-input">
                                                    <input type="text" id="amount">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="site-btn">Searching</button>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="hero__tab__form">
                                <h2>Buy Your Dream Car</h2>
                                <form>
                                    <div class="select-list">
                                        <div class="select-list-item">
                                            <p>Select Year</p>
                                            <select>
                                                <option data-display=" ">Select Year</option>
                                                <option value="">2020</option>
                                                <option value="">2019</option>
                                                <option value="">2018</option>
                                                <option value="">2017</option>
                                                <option value="">2016</option>
                                                <option value="">2015</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Brand</p>
                                            <select>
                                                <option data-display=" ">Select Brand</option>
                                                <option value="">Acura</option>
                                                <option value="">Audi</option>
                                                <option value="">Bentley</option>
                                                <option value="">BMW</option>
                                                <option value="">Bugatti</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Model</p>
                                            <select>
                                                <option data-display=" ">Select Model</option>
                                                <option value="">Q3</option>
                                                <option value="">A4 </option>
                                                <option value="">AVENTADOR</option>
                                            </select>
                                        </div>
                                        <div class="select-list-item">
                                            <p>Select Mileage</p>
                                            <select>
                                                <option data-display=" ">Select Mileage</option>
                                                <option value="">27</option>
                                                <option value="">25</option>
                                                <option value="">15</option>
                                                <option value="">10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="car-price">
                                        <p>Price Range:</p>
                                        <div class="price-range-wrap">
                                            <div class="price-range"></div>
                                            <div class="range-slider">
                                                <div class="price-input">
                                                    <input type="text" id="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="site-btn">Searching</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<script src="./layui/layui.js"></script>
<div style="width: 100%;height: 600px;background-color: #f57f17">
    <div class="layui-carousel" id="test1" style="width: 100%;height: 600px;background-color: #f57f17">
        <div carousel-item>
            <div><img src="./img/2.jpg" /></div>
            <div><img src="./img/hero-bg1.jpg" /></div>
            <div><img src="./img/2.jpg" /></div>
            <div><img src="./img/hero-bg1.jpg" /></div>
            <div><img src="./img/2.jpg" /></div>
        </div>
    </div>
</div>

<div style="width: 100%;height: 800px;background-color: #f57f17">
    <table id="demo" lay-filter="test"></table>
    <script src="./layui/layui.js"></script>
    <script>
        layui.use('table', function(){
            var table = layui.table;
            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 312
                ,url: '/demo/table/user/' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                    {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
                    ,{field: 'username', title: '用户名', width:80}
                    ,{field: 'sex', title: '性别', width:80, sort: true}
                    ,{field: 'city', title: '城市', width:80}
                    ,{field: 'sign', title: '签名', width: 177}
                    ,{field: 'experience', title: '积分', width: 80, sort: true}
                    ,{field: 'score', title: '评分', width: 80, sort: true}
                    ,{field: 'classify', title: '职业', width: 80}
                    ,{field: 'wealth', title: '财富', width: 135, sort: true}
                ]]
            });

        });
    </script>



</div>




<section class="services spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>Our Services</span>
                    <h2>What We Offers</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="services__item">
                    <img src="./img/services/services-1.png" alt="">
                    <h5>Rental A Cars</h5>
                    <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                        viverra maecenas.</p>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="services__item">
                    <img src="./img/services/services-2.png" alt="">
                    <h5>Buying A Cars</h5>
                    <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                        viverra maecenas.</p>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="services__item">
                    <img src="./img/services/services-3.png" alt="">
                    <h5>Car Maintenance</h5>
                    <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                        viverra maecenas.</p>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="services__item">
                    <img src="./img/services/services-4.png" alt="">
                    <h5>Support 24/7</h5>
                    <p>Consectetur adipiscing elit incididunt ut labore et dolore magna aliqua. Risus commodo
                        viverra maecenas.</p>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>



<footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
    <div class="container">
        <div class="footer__contact">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="footer__contact__title">
                        <h2>现在加入我们!</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="footer__contact__option">
                        <div class="option__item"><i class="fa fa-phone"></i> (+12) 345 678 910</div>
                        <div class="option__item email"><i class="fa fa-envelope-o"></i> Colorlib@gmail.com</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="./img/bmw.png"width="10%"height="10%" alt=""></a>
                    </div>
                    <p>有任何我呢提? 请在美国加利福尼亚州格洛里亚联合625号店内联系我们或致电我们
                        接通（+1）96 123 8888</p>
                    <div class="footer__social">
                        <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="#" class="google"><i class="fa fa-google"></i></a>
                        <a href="#" class="skype"><i class="fa fa-skype"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3">
                <div class="footer__widget">
                    <h5>信息</h5>
                    <ul>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 购买</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 付款人</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 航运</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 返回</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3">
                <div class="footer__widget">
                    <h5>更多</h5>
                    <ul>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 掀背式</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> 轿车</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> SUV</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer__brand">
                    <h5>顶级品牌</h5>
                    <ul>
                        <li><a href="#"><i class="fa fa-angle-right"></i> abate</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Acura</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Alfa Romeo</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Audi</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="fa fa-angle-right"></i> BMW</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Chevrolet</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Ferrari</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i> Honda</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        <div class="footer__copyright__text">
            <p>Copyright &copy;<script>document.write(new Date().getFullYear());
            </script> All rights reserved | This power is by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
        </div>
        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
    </div>
</footer>



<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.nice-select.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<script src="./js/jquery.magnific-popup.min.js"></script>
<script src="./js/mixitup.min.js"></script>
<script src="./js/jquery.slicknav.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/main.js"></script>
<script>

    layui.use('carousel', function () {
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , height: '100%' //设置容器高度
            ,autoplay: 'true'
            // , full:'true' //是否全屏轮播,默认false
            // , arrow: 'always' //始终显示箭头和点击按钮
            // ,anim: 'updown' //切换动画方式，可从各个方向滚动
        });
    });
</script>



</body>

</html>