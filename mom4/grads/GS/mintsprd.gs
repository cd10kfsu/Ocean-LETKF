'reinit'
'openall.gs'
'set grid off'
'set grads off'
*'set xsize 360 480'
'set parea  0.9 10.5 0.05 8.0'
'set xlopts 1 5 0.18'
'set ylopts 1 5 0.18'
'set cthick 5'
'set clopts -1 -1 0.12'
'set clskip 3 5.0'
'set display color white'

'set lev 5'
'tmin5 = min(t.3,t=1,t=586)'
'c'
'scl 0 .75 .05'
'd tmin5'
'print tmin5m.eps'

'set lev 50'
'tmin50 = min(t.3,t=1,t=586)'
'c'
'scl 0 1 .05'
'd tmin50'
'print tmin50m.eps'

'set lev 100'
'tmin100 = min(t.3,t=1,t=586)'
'c'
'scl 0 .9 .05'
'd tmin100'
'print tmin100m.eps'

'set lev 200'
'tmin200 = min(t.3,t=1,t=586)'
'c'
'scl 0 .7 .05'
'd tmin200'
'print tmin200m.eps'

'set lev 300'
'tmin300 = min(t.3,t=1,t=586)'
'c'
'scl 0 .32 .02'
'd tmin300'
'print tmin300m.eps'

'set lev 400'
'tmin400 = min(t.3,t=1,t=586)'
'c'
'scl 0 .23 .01'
'd tmin400'
'print tmin400m.eps'

'set lev 500'
'tmin500 = min(t.3,t=1,t=586)'
'c'
'scl 0 .16 .01'
'd tmin500'
'print tmin500m.eps'

'set lev 750'
'tmin750 = min(t.3,t=1,t=586)'
'c'
'scl 0 0.08 0.005'
'd tmin750'
'print tmin750m.eps'

'set lev 1000'
'tmin1000 = min(t.3,t=1,t=586)'
'c'
'scl 0 0.08 0.005'
'd tmin1000'
'print tmin1000m.eps'

'set lev 2000'
'tmin2000 = min(t.3,t=1,t=586)'
'c'
'scl 0 0.04 0.004'
'd tmin2000'
'print tmin2000m.eps'