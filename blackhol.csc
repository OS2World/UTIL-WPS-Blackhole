/*
 *   DMan.CSC - Workplace Shell test
 */
/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³  Greg's Black Hole - anything you put in will disappear forever...  ³
³                                                                     ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   Gregory Czaja, CONT00 @ LEXVMK, November 1992  ³
                   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
include <wpabs.sc>

class: BlackHole,
       external stem   = BlackHol,
       local,
       external prefix = BlackHolX_,
       classprefix     = BlackHolC_,
       major version   = 1,
       minor version   = 1,
       file stem       = BlackHol;


parent: WPAbstract;

#release order:

passthru: C.ph;
 /* private defs for BlackHole */
endpassthru;

passthru: C.ih;
 /* implementation defs for BlackHole */

 /* PM definitions */
   #define INCL_WIN
   #define INCL_DOS
   #define INCL_GPIBITMAPS
   #include <os2.h>

   #define INCL_WPCLASS
   #define INCL_WPFOLDER
   #include <pmwp.h>

 /* internal definitions */
   #define MYSTR_CLASSNAME      "BlackHole"
endpassthru;

passthru: C.h, after;
 /* public defs for BlackHole */
endpassthru;

/* need to define some data to force (dummy) GetData */
data:
   PSZ   mytext;

methods:
#/*====================================================================*/
#/*                                                                    */
#/* Override drag&drop methods                                         */
#/*                                                                    */
#/*====================================================================*/
    override wpDragOver;

    override wpDrop;

#/*====================================================================*/
#/*                                                                    */
#/* Override class methods                                             */
#/*                                                                    */
#/*====================================================================*/
    override wpclsInitData, class;

    override wpclsUnInitData, class;

