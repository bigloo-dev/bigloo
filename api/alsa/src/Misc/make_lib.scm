;*=====================================================================*/
;*    serrano/prgm/project/bigloo/api/alsa/src/Misc/make_lib.scm       */
;*    -------------------------------------------------------------    */
;*    Author      :  Manuel Serrano                                    */
;*    Creation    :  Tue Nov  6 15:09:37 2001                          */
;*    Last change :  Tue Jan 26 13:40:54 2016 (serrano)                */
;*    Copyright   :  2001-16 Manuel Serrano                            */
;*    -------------------------------------------------------------    */
;*    The module used to build the heap file.                          */
;*=====================================================================*/

;*---------------------------------------------------------------------*/
;*    The module                                                       */
;*---------------------------------------------------------------------*/
(module __alsa_makelib

   (library multimedia)
   
   (import  __alsa_alsa
	    __alsa_pcm
	    __alsa_music
	    __alsa_card
	    __alsa_control
	    __alsa_mixer)

   (eval    (export-all)

            (class &alsa-error)
            (class alsa-object)
	    (class alsa-snd-pcm)
	    (class alsa-snd-card)
	    (class alsa-snd-ctl)
	    (class alsa-snd-ctl-card-info)
	    (class alsa-snd-mixer)

	    (class alsamusic)))

