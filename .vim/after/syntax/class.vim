syntax match classComment /!.*$/
syntax match classNumber /[0-9][0-9]*/
syntax keyword classConditional for if next end continue
syntax keyword classConstant Y N
syntax region classString start=/"/ end=/"/
syntax region classEMBCommand start=/'/ end=/'/
syntax keyword classType int[eger] char[acter] logical double func[tion] real structure table uvtable 
syntax keyword classBasicCommand let def[ine]
syntax keyword classCommand accum[ulate] associate average base box catalog consistency copy drop dump extract file find fits fold get header ignore list load modify multiply new_data plot save set show spectrum spec swap tag title update write comment cube divide draw fft fill greg grid lmv map memorize model noise popup pop print reduce resample retrieve smooth stamp strip display iterate keep lines method minimize residual result visualilze language apodise deconvolve xy_map initialize filter median rms subtract unblank uv_table variable wavelet

highlight link classComment Comment
highlight link classNumber Number
highlight link classConditional Normal
highlight link classConstant Constant
highlight link classString String
highlight link classEMBCommand String
highlight link classType Type
highlight link classBasicCommand Identifier
highlight link classCommand Identifier
