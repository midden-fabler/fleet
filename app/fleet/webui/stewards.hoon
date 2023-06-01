/-  *fleet
/+  rudder, fleet-style
::
^-  (page:rudder records command)
|_  [=bowl:gall =order:rudder records]
++  final  (alert:rudder (cat 3 '/' dap.bowl) build)
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder command)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?~  who=(slaw %p (~(gut by args) 'who' ''))  ~
  ?~  cmd=(~(get by args) 'cmd')  ~
  ?+  u.cmd  ~
    %add-steward  [%add-steward u.who]
    %del-steward  [%del-steward u.who]
  ==
::
++  build
  |=  $:  arg=(list [k=@t v=@t])
          msg=(unit [o=? =@t])
      ==
  ^-  reply:rudder
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"%fleet"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
        ;style:"{(trip style:fleet-style)}"
      ==
      ;body
        ::  links
        ;a/"/fleet"
          ;h2:"%fleet"
        ==
        ;a/"/fleet/stewards"
          ;h2:"stewards"
        ==
        ;a/"/fleet/logs"
          ;h2:"logs"
        ==
        ;a/"/fleet/settings"
          ;h2:"settings"
        ==

        ;h4:"fleet monitoring"
        
        ;+  ?~  msg  ;p:""
            ?:  o.u.msg
              ;p.green:"{(trip t.u.msg)}"
            ;p.red:"{(trip t.u.msg)}"
        ;table
          ;form(method "post")
            ::  table header
            ;tr(style "font-weight: bold")
              ;td(align "center"):"~"
              ;td(align "center"):"steward"
            ==
            ::  first row for adding new ships
            ;tr
              ;td
                ;button(type "submit", name "cmd", value "add-steward"):"+"
              ==
              ;td
                ;input(type "text", name "who", placeholder "~sampel");
              ==
            ==
          ==  ::  form
          ;*  work
        ==
      ==  ::  body
    ==    ::  html
  ++  work
    ^-  (list manx)
    %+  turn  (sort ~(tap in stewards) por)
    |=  =ship
    ;tr
      ;td
        ;form(method "post")
          ;button(type "submit", name "cmd", value "del-steward"):"-"
          ;input(type "hidden", name "who", value "{(scow %p ship)}");
        ==
      ==
      ;td:"{(scow %p ship)}"
    ==
  ::
  ++  por
    |=  [a=* b=*]
    ?:  ?=(@ a)
      ?>  ?=(@ b)
      (aor (scot %p a) (scot %p b))
    ?>  ?=(@ -.a)
    ?>  ?=([@ *] b)
    (aor (scot %p -.a) (scot %p -.b))
  --  ::  |^
--    ::  |_
