% if(~ $post_arg_tag '') {
<br /><h5 style="display: inline">Refine:</h5>
%     for(i in `{ls $sitedir/_werc/search/tag | sed $dirfilter}) {
%         i=`{basename $i}
<div class="chip" style="margin-bottom: 0.5em">
  <form action="/search" method="post">
    <input type="hidden" name="type" value="%($post_arg_type%)"></input>
    <input type="hidden" name="value" value="%($post_arg_value%)"></input>
    <input type="hidden" name="tag" value="%($i%)"></input>
    <input type="submit" value="%(`{echo $i | sed 's/_/ /g'}%)" class="fakelink"></input>
  </form>
</div>
%     }
% }

%{
// $post_arg_type is one of (type year0 year1 school teacher tag)
// includes courses with $post_arg_type value matching $post_arg_value
// if $post_arg_tag is included, refines those results to those including $post_arg_tag
for(i in `{cat $sitedir/_werc/search/$post_arg_type/$post_arg_value}) {
    if(~ $post_arg_tag '' || ~ 1 `{grep -c '^'$i'$' < $sitedir/_werc/search/tag/$post_arg_tag})
        courses=($courses /courses/$i.html)
}

nav_tree_ext_custom $courses
%}
