DSET anal001.ocean_velocity.res.nc
*DTYPE netcdf
TITLE Ocean U/V Velocity restart
OPTIONS template
*UNDEF 0

XDEF xaxis_1
YDEF yaxis_1
ZDEF zaxis_1

TDEF Time 1000 linear 0z2jan1980 1dy

@ xaxis_1 String units degree_east 
@ xaxis_1 String long_name Nominal Longitude of T-cell center
@ yaxis_1 String units degree_north
@ yaxis_1 String long_name Nominal Latitude of T-cell center
@ zaxis_1 String units meters
@ zaxis_1 String long_name tz
@ Time String units days since 0001-01-01 00:00:00
@ Time String long_name Time

@ u String long_name initial u
@ u String units m/s
@ v String long_name initial v
@ v String units m/s
