% dir=etc/users/`{basename $req_path}

<h1>%(`{basename $req_path}%)'s Profile</h1>

%{
if(test -f $dir/school) {
    echo '<h4>Student at '
    cat $dir/school
    echo '</h4>'
}

if(test -f $dir/courses) {
    echo '<h5>Taking '
    cat $dir/courses | tr -d '
'
    echo '</h5>'
}

if(test -f $dir/bio) {
    echo '<p>'
    cat $dir/bio
    echo '</p>'
}

if(test -s $dir/work) {
    echo '<h2>Shared Work</h2>'
    echo '<ul>'
    cat $dir/work
    echo '</ul>'
}
%}
