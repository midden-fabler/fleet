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
  ?~  cmd=(~(get by args) 'cmd')  ~
  ?+    u.cmd  ~
      %set-heartbeat
    ?~  who=(slaw %p (~(gut by args) 'who' ''))     ~
    ?~  when=(slaw %dr (~(gut by args) 'when' ''))  ~
    [%set-heartbeat u.who u.when]
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

        ;table
          ;tr
            ;td(align "right"):"now: {<now.bowl>}"
          ==
          ;tr
            ;td(align "right"):"last fleet update: {<last-kids-update>}"
          ==
        ==
        
        ;+  ?~  msg  ;p:""
            ?:  o.u.msg
              ;p.green:"{(trip t.u.msg)}"
            ;p.red:"{(trip t.u.msg)}"
        ;table
          ::  table header
          ;tr(style "font-weight: bold")
            ;td(align "center"):"ship"
            ;td(align "center"):"notify after @dr"
          ==
          ;*  work
        ==
      ==  ::  body
    ==    ::  html
  ++  work
    ^-  (list manx)
    %+  turn  (sort ~(tap in fleet) por)
    |=  =ship
    =/  threshold=@dr  (~(gut by heartbeats) ship default-heartbeat)
    ;tr
      ;td(align "right"):"{(scow %p ship)}"
      ::  when to notify
      ;form(method "post")
        ;td
          ;input(type "hidden", name "cmd", value "set-heartbeat");
          ;input(type "hidden", name "who", value "{(scow %p ship)}");
          ;input(type "text", name "when", value "{(scow %dr threshold)}");
        ==
      ==
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
