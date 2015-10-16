% dir=etc/users/`{basename $req_path}

% check_user
% if(~ $logged_user `{basename $req_path}) {
<p><form method="POST" action=""><button name="logout" value="yes" class="btn-large waves-effect waves-light black">Logout</button></form></p>
% }

<h1>%(`{basename $req_path}%)'s Profile</h1>

%{
echo '<h4>'
cat $dir/school
echo '</h4>'

echo '<h5>'
cat $dir/courses | tr -d '
'
echo '</h5>'

echo '<p>'
cat $dir/bio
echo '</p>'

echo '<ul>'
cat $dir/work
echo '</ul>'
%}