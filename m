From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 23:15:57 +0000
Subject: [Kernel-janitors] Re: sis-agp: replace schedule_timeout() with
Message-Id: <20040720231557.GB1957@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13988532655428787=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720223919.GA2447@masina>
In-Reply-To: <20040720223919.GA2447@masina>
To: kernel-janitors@vger.kernel.org

--===============13988532655428787==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2004 at 12:39:19AM +0200, Domen Puncer wrote:
> On 20/07/04 21:01 +0000, Nishanth Aravamudan wrote:
> ...
> > --- linux-vanilla/drivers/char/agp/sis-agp.c	2004-06-16 05:18:56.000000000 +0000
> ...
> > -			set_current_state(TASK_UNINTERRUPTIBLE);
> > -			schedule_timeout (1+(HZ*10)/1000);
> > +			msleep(HZ);		/* sleep 1s */
> 
> Umm... what?
> I mean... HZ jiffies is one second, but HZ miliseconds is not necessary 1 s.
> And that delay looks wierd, what was the point of HZ*10/1000 in the first
> place? Why not HZ/100?

Thanks again Domen! I totally missed this one - I'm trying to check my
patches as I submit them to the list, but I must not have been paying
close enough attention. You are right, it should be msleep(10). Please
find the corrected patch below. I am not positive as to why the conversion
was originally done the way it was, but I think it prevents rounding
erros. If HZ is very small, then the 1+ guarantees *some* timeout. As to
why they didn't finish their math, well the compiler should take care of
the immediate values (I think) but also, it is a readability thing.
Again, working with msecs directly is clearer. msleep(10) it is.

-Nish


--- linux-vanilla/drivers/char/agp/sis-agp.c	2004-06-16 05:18:56.000000000 +0000
+++ linux-dev/drivers/char/agp/sis-agp.c	2004-07-15 23:11:23.000000000 +0000
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 #include <linux/agp_backend.h>
 #include "agp.h"
 
@@ -102,8 +103,7 @@ static void sis_delayed_enable(u32 mode)
 		 */
 		if (device->device == agp_bridge->dev->device) {
 			printk(KERN_INFO PFX "SiS delay workaround: giving bridge time to recover.\n");
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout (1+(HZ*10)/1000);
+			msleep(10);		/* sleep 10ms */
 		}
 	}
 }

--===============13988532655428787==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13988532655428787==--
