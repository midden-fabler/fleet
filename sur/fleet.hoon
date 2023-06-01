|%
+$  records
  $:  =fleet
      =heartbeats
      =downed
      =stewards
      =default-heartbeat
      =run-interval
      =kids-update
      =last-kids-update
      =send-alerts
      =max-log-size
      =logs
  ==
::
+$  fleet       (set ship)             ::  sponsees
+$  heartbeats  (map ship @dr)         ::  custom ship heartbeats
+$  downed      (map ship (unit @da))  ::  last contact > threshold
+$  stewards    (set ship)             ::  who to notify
+$  default-heartbeat  _~m30           ::  heartbeat if not custom
+$  run-interval       _~m5            ::  run %fleet at this interval
+$  kids-update        _~h1            ::  update fleet (sponsees)
+$  last-kids-update   @da             ::  fleet last updated
+$  send-alerts        _&              ::  notifications enabled?
+$  max-log-size       _1.000.000      ::  max log size
+$  logs  ((mop @da log-entry) gth)    ::  log
+$  log-entry  [date=@da recipients=(set ship) kid=ship msg=cord]
::
+$  command
  $%  [%add-steward =ship]             ::  who to notify
      [%del-steward =ship]             ::  who to notify
      [%set-heartbeat =ship t=@dr]     ::  custom last-contact threshold
      [%set-default-heartbeat t=@dr]   ::  default notify threshold
      [%set-run-interval t=@dr]        ::  how often to run %fleet
      [%set-kids-update t=@dr]         ::  how often to update your fleet
      [%set-max-log-size size=@ud]     ::  max log size
      [%set-send-alerts flag=?]        ::  on / off switch for alerts
  ==
--
