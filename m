From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 24 Jan 2005 14:16:06 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH 26/39] sound/emu8000: replace
Message-Id: <s5hllai29qx.wl@alsa2.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75398166899771102=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75398166899771102==
Content-Type: text/plain; charset=US-ASCII

At Fri, 21 Jan 2005 11:35:00 -0800,
Nishanth Aravamudan wrote:
> 
> Hi,
> 
> Please consider applying.
> 
> Description: Use ssleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not check
> for signals / early return, so ssleep() should be appropriate. I am fairly
> certain the time conversion is ok, as well.

Oh, that's a wrong code ;)  The comment is correct, though.
It should have been:

	schedule_timeout((HZ * 1024 + 44099) / 44100);

So, more simply with msleep(),

	msleep(1024 * 1000 / 44100);


Takashi


> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-rc1-kj-v/sound/isa/sb/emu8000.c	2005-01-15 16:55:45.000000000 -0800
> +++ 2.6.11-rc1-kj/sound/isa/sb/emu8000.c	2005-01-21 11:32:38.000000000 -0800
> @@ -25,6 +25,7 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/ioport.h>
> +#include <linux/delay.h>
>  #include <sound/core.h>
>  #include <sound/emu8000.h>
>  #include <sound/emu8000_reg.h>
> @@ -355,8 +356,7 @@ init_arrays(emu8000_t *emu)
>  {
>  	send_array(emu, init1, ARRAY_SIZE(init1)/4);
>  
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout((HZ * (44099 + 1024)) / 44100); /* wait for 1024 clocks */
> +	ssleep(1);
>  	send_array(emu, init2, ARRAY_SIZE(init2)/4);
>  	send_array(emu, init3, ARRAY_SIZE(init3)/4);
>  
> 
> 
> -------------------------------------------------------
> This SF.Net email is sponsored by: IntelliVIEW -- Interactive Reporting
> Tool for open source databases. Create drag-&-drop reports. Save time
> by over 75%! Publish reports on the web. Export to DOC, XLS, RTF, etc.
> Download a FREE copy at http://www.intelliview.com/go/osdn_nl
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/alsa-devel
> 

--===============75398166899771102==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75398166899771102==--
