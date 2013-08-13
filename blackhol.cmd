/* rexx - BlackHol: install BlackHole's DLL and create its object */
/* by Greg Czaja January  18, 1993      version 3                 */
/* Attention ! REXX20 fix or Service Pack or OS/2 2.1 are required*/
/*             to run this CMD. SOMFIX or SP or 2.1 are required  */
/*             for BlackHole to work properly !                   */

Parse source . . __rexx_name;
__rexx_dir = Filespec('D',__rexx_name)||Filespec('P',__rexx_name)

Call RxFuncAdd 'SysLoadFuncs', 'REXXUTIL', 'SysLoadFuncs';
Call SysLoadFuncs;           

     system_dll=FileSpec('Drive',Value('SYSTEM_INI',,'OS2ENVIRONMENT'))||'\OS2\DLL';
     rc=SysDeregisterObjectClass('BlackHole');
     Address CMD '@ERASE 'system_dll'\BLACKHOL.DLL 2>NUL';
     Address CMD '@COPY '__rexx_dir'BlackHol.DLL 'system_dll;
     If rc <> 0                 /* registered OK ?                */
        Then Do;
          Say  "BlackHole: could not replace the DLL, rc="rc".";
          Say  "BlackHole: delete the object and the DLL from \OS2\DLL directory.";
          Exit;
          End;
     rc=SysRegisterObjectClass('BlackHole',system_dll||'\BLACKHOL.DLL');
     If rc <> 1                 /* registered OK ?                */
        Then Do;
          Say  "BlackHole: could not register its object class, rc="rc".";
          Exit;
          End;
     rc=SysCreateObject('BlackHole','Black Hole','<WP_DESKTOP>', ,
                        'ICONFILE='__rexx_dir'BLACKHOL.ICO;OBJECTID=<BLACKHOLE>;',,
                        'ReplaceIfExists');
     If rc <> 1                 /* registered OK ?                */
        Then Do;
          Say  "BlackHole: could not create its object, rc="rc".";
          End;
Exit;
