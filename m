From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 15:35:57 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/e1000_osdep: replace
Message-Id: <20040727153556.GA1937@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69464971845040835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727000001.GK1897@us.ibm.com>
In-Reply-To: <20040727000001.GK1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============69464971845040835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 04:00:52AM +0100, Matthew Wilcox wrote:
> On Mon, Jul 26, 2004 at 05:00:01PM -0700, Nishanth Aravamudan wrote:
> > I would appreciate any comments from the janitors list. 
> > 
> > Applys-to: 2.6.7
> > 
> > Description: Replace schedule_timeout() with msleep() to guarantee the
> > task delays for the desired time.
> >  			} else { \
> > -				set_current_state(TASK_UNINTERRUPTIBLE); \
> > -				schedule_timeout((x * HZ)/1000 + 2); \
> > +				msleep(x); \
> >  			} } while(0)
> 
> Looks much better than the previous code.  It's actually possible to do
> better, though.  Simply change to:
> 
> #define msec_delay(x) msleep(x)
> 
> If msleep() ends up scheduling, the bad attempt to sleep will be caught
> by schedule().  There's no need to do the check in the driver.

Thanks for the tip and here is this change:


--- linux-vanilla/drivers/net/e1000/e1000_osdep.h	2004-06-15 22:19:01.000000000 -0700
+++ linux-dev/drivers/net/e1000/e1000_osdep.h	2004-07-27 08:33:50.000000000 -0700
@@ -42,13 +42,7 @@
 #include <linux/sched.h>
 
 #ifndef msec_delay
-#define msec_delay(x)	do { if(in_interrupt()) { \
-				/* Don't mdelay in interrupt context! */ \
-	                	BUG(); \
-			} else { \
-				set_current_state(TASK_UNINTERRUPTIBLE); \
-				schedule_timeout((x * HZ)/1000 + 2); \
-			} } while(0)
+#define msec_delay(x)	msleep(x)
 #endif
 
 #define PCI_COMMAND_REGISTER   PCI_COMMAND

--===============69464971845040835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69464971845040835==--
