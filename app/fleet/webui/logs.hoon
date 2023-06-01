/-  *fleet
/+  rudder, fleet-style
::
^-  (page:rudder records command)
|_  [=bowl:gall =order:rudder records]
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder command)
  ~
::
++  final  (alert:rudder (cat 3 '/' dap.bowl) build)
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
        ==
        
        ;+  ?~  msg  ;p:""
            ?:  o.u.msg
              ;p.green:"{(trip t.u.msg)}"
            ;p.red:"{(trip t.u.msg)}"
        ;table
          ::  table header
          ;tr(style "font-weight: bold")
            ;td(align "center"):"date"
            ;td(align "center"):"sponsee"
            ;td(align "left"):"message"
            ;td(align "left"):"recipients"
          ==
          ;*  work
        ==
      ==  ::  body
    ==    ::  html
  ++  work
    ^-  (list manx)
    =/  logs-per-page=@ud  128
    =/  slice  (scag logs-per-page (tap:log-orm logs))
    %+  turn  slice
    |=  [key=@da l=log-entry]
    ;tr
      ;td:"{<date.l>}"
      ;td(align "right"):"{<kid.l>}"
      ;td:"{<msg.l>}"
      ;td:"{<~(tap in recipients.l)>}"
    ==
  ::
  ++  log-orm  ((on @da log-entry) gth)
  --  ::  |^
--    ::  |_
