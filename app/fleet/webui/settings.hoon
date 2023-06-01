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
  ?+  u.cmd  ~
      %set-default-heartbeat
    ?~  val=(slaw %dr (~(gut by args) 'val' ''))  ~
    [%set-default-heartbeat u.val]
  ::
      %set-run-interval
    ?~  val=(slaw %dr (~(gut by args) 'val' ''))  ~
    [%set-run-interval u.val]
  ::
      %set-kids-update
    ?~  val=(slaw %dr (~(gut by args) 'val' ''))  ~
    [%set-kids-update u.val]
  ::
      %set-max-log-size
    ?~  val=(slaw %ud (~(gut by args) 'val' ''))  ~
    [%set-max-log-size u.val]
  ::
      %enable-alerts
    [%set-send-alerts &]
  ::
      %disable-alerts
    [%set-send-alerts |]
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
          ::  header
          ;tr
            ;td(align "center"):"variable"
            ;td(align "center"):"value"
            ;td(align "center"):"~"
          ==
          ::  row
          ;tr
            ;form(method "post")
              ;td(align "right"):"run interval"
              ;td
                ;input(type "text", name "val", value "{<run-interval>}");
              ==
              ;td
                ;button(type "submit", name "cmd", value "set-run-interval"):"submit"
              ==
            ==
          ==  ::  end row
          ::  row
          ;tr
            ;form(method "post")
              ;td(align "right"):"default heartbeat"
              ;td
                ;input(type "text", name "val", value "{<default-heartbeat>}");
              ==
              ;td
                ;button(type "submit", name "cmd", value "set-default-heartbeat"):"submit"
              ==
            ==
          ==  ::  end row
          ::  row
          ;tr
            ;form(method "post")
              ;td(align "right"):"update sponsees every"
              ;td
                ;input(type "text", name "val", value "{<kids-update>}");
              ==
              ;td
                ;button(type "submit", name "cmd", value "set-kids-update"):"submit"
              ==
            ==
          ==  ::  end row
          ::  row
          ;tr
            ;form(method "post")
              ;td(align "right"):"max log size"
              ;td
                ;input(type "text", name "val", value "{<max-log-size>}");
              ==
              ;td
                ;button(type "submit", name "cmd", value "set-max-log-size"):"submit"
              ==
            ==
          ==  ::  end row
          ::  row
          ;tr
            ;form(method "post")
              ;td(align "right"):"send alerts"
              ;td(align "left"):"{<send-alerts>}"
              ;td
                ;+  ?:(send-alerts disable-button enable-button)
              ==
            ==
          ==  ::  end row
        ==
      ==  ::  body
    ==    ::  html
  ++  disable-button
    ^-  manx
    ;form(method "post")
      ;button(type "submit", name "cmd", value "disable-alerts"):"disable"
    ==
  ++  enable-button
    ^-  manx
    ;form(method "post")
      ;button(type "submit", name "cmd", value "enable-alerts"):"enable"
    ==
  --  ::  |^
--    ::  |_
