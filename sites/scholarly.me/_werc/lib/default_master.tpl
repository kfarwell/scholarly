% masterSiteTitle=`{cat sites/*/_werc/config | grep siteTitle | cut -d'''' -f 2}

<ul id="dd-types" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/type | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="type"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="dd-years" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/year0 | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="year0"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
  <li class="divider"></li>
% for(i in `{ls $sitedir/_werc/search/year1 | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="year1"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="dd-schools" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/school | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="school"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="dd-teachers" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/teacher | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="teacher"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="ddm-types" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/type | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="type"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="ddm-years" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/year0 | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="year0"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
  <li class="divider"></li>
% for(i in `{ls $sitedir/_werc/search/year1 | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="year1"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="ddm-schools" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/school | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="school"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<ul id="ddm-teachers" class="dropdown-content">
% for(i in `{ls $sitedir/_werc/search/teacher | sed $dirfilter}) {
%   i=`{basename $i}
  <li><a><form action="/search" method="post"><input type="hidden" name="type" value="teacher"></input><input type="hidden" name="value" value="%($i%)"></input><input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelinknav"></input></form></a></li>
% }
</ul>

<nav class="white" role="navigation">
  <div class="nav-wrapper container">
    <a id="logo-container" href="/courses/" class="brand-logo orange-text">%($siteTitle%)</a>
    <ul class="right hide-on-med-and-down">
      <li><a class="dropdown-button black-text" href="#!" data-activates="dd-types">Types</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="dd-years">Years</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="dd-schools">Schools</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="dd-teachers">Teachers</a></li>
% check_user
% if(~ $logged_user '') {
      <li style="margin-left: 2em"><a class="black-text" href="/login">Login</a></li>
% }
% if not {
      <li style="margin-left: 2em"><a class="black-text" href="/user/%($logged_user%)">%($logged_user%)</a></li>
% }
    </ul>

    <ul id="nav-mobile" class="side-nav">
      <li><a class="dropdown-button black-text" href="#!" data-activates="ddm-types">Types</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="ddm-years">Years</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="ddm-schools">Schools</a></li>
      <li><a class="dropdown-button black-text" href="#!" data-activates="ddm-teachers">Teachers</a></li>
% if(~ $logged_user '') {
      <li style="margin-top: 2em"><a class="black-text" href="/login">Login</a></li>
% }
% if not {
      <li style="margin-top: 2em"><a class="black-text" href="/user/%($logged_user%)">%($logged_user%)</a></li>
% }
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
      <span class="black-text">Scholarly</span>
      <span class="right">
        <a href="/about" class="black-text">About</a>
        <a href="/privacy" class="black-text">Privacy</a>
      </span>
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

    $(".dropdown-button").dropdown();

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
