% masterSiteTitle=`{cat sites/*/_werc/config | grep siteTitle | cut -d'''' -f 2}

<nav class="white" role="navigation">
  <div class="nav-wrapper container">
    <a id="logo-container" href="/" class="brand-logo orange-text">%($siteTitle%)</a>
    <ul class="right hide-on-med-and-down">
        <li><a href="/about" class="black-text">ABOUT</a></li>
        <li style="margin-right: 2em"><a href="/courses/" class="black-text">COURSES</a></li>
% #        <li><a onclick="navigator.id.request()" class="black-text">LOGIN</a></li>
        <li><a href="/login" class="black-text">LOGIN</a></li>
        <li><a href="/register" class="black-text">REGISTER</a></li>
    </ul>

    <ul id="nav-mobile" class="side-nav">
        <li><a href="/about">ABOUT</a></li>
        <li style="margin-bottom: 2em"><a href="/courses/">COURSES</a></li>
% #        <li><a onclick="navigator.id.request()">LOG IN</a></li>
        <li><a href="/login">LOGIN</a></li>
        <li><a href="/register">REGISTER</a></li>
    </ul>
    <a href="#" data-activates="nav-mobile" class="button-collapse black-text"><i class="mdi-navigation-menu"></i></a>
  </div>
</nav>

% if(~ $siteTitle $masterSiteTitle) {
%   handlers_bar_left=0
<style>
  #side-bar div {
    border-bottom: none;
  }

  #main-copy {
    margin: 0 auto;
    border-left: none;
  }
</style>
% }

<div id="main-copy" class="container">

% run_handlers $handlers_body_head

% run_handler $handler_body_main

% run_handlers $handlers_body_foot

</div>

<footer class="page-footer white">
  <div class="footer-copyright">
    <div class="container">
      <div class="left black-text">SCHOLARLY.ME</div>
      <div class="right">
        <a id="scroll-top" class="btn-flat black-text" href="#top">
          <i class="large mdi-navigation-expand-less"></i>
        </a>
      </div>
    </div>
  </div>
</footer>

<script type="text/javascript" src="/_werc/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/_werc/js/materialize.min.js"></script>

<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55f0aa6cd240bcc1" async="async"></script>

% # <script type="text/javascript" src="https://login.persona.org/include.js"></script>

<script>
% #  // wip: mozilla persona support
% #  navigator.id.watch({
% #    loggedInUser: null,
% #    onlogin: function(assertion) {
% #      $.ajax({
% #        type: 'POST',
% #        url: '/login',
% #        data: {assertion: assertion},
% #        success: function(res, status, xhr) { window.location.reload(); },
% #        error: function(xhr, status, err) {
% #          navigator.id.logout();
% #          alert("Login failure: " + arr);
% #        }
% #      });
% #    },
% #    onlogout: function() {
% #      $.ajax({
% #        type: 'POST',
% #        url: '/login',
% #        success: function(res, status, xhr) { window.location.reload(); },
% #        error: function(xhr, status, err) { alert("Logout failure: " + err); }
% #      });
% #    }
% #  });

  $( document ).ready(function() {
    $(".button-collapse").sideNav();

    $(".materialboxed").materialbox();

    $("select").material_select();

    $(".scroll-top").on("click", function(e) {
      e.preventDefault();
      $("body, html").animate({
        scrollTop: 0
      }, "fast");
    });
    $(".scroll-bot").on("click", function(e) {
      e.preventDefault();
      $("body, html").animate({
        scrollBottom: $(document).height()
      }, "fast");
    });

    $(".thingiview").height($(".thingiview").width());
  });

  window.addEventListener("resize", function(e) {
    $(".thingiview").height($(".thingiview").width());
    $(".thingiview").attr("src", function(i, val) { return val; });
  });
</script>
