From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 16:13:57 +0000
Subject: [Kernel-janitors] Re: [PATCH] saa7146_i2c: replace
Message-Id: <20040727161357.GD2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65409511463656145=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41066A54.8080701@convergence.de>
In-Reply-To: <41066A54.8080701@convergence.de>
To: kernel-janitors@vger.kernel.org

--===============65409511463656145==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 04:44:36PM +0200, Michael Hunold wrote:
> Hello Nishanth,
> 
> I'm sorry for the long delay. As I already explained in the mail I sent 
> to linux-dvb-maintainer (yes, I'm working on both projects) some mails 
> were "caught" by my spam filter and then we had a power failure in our 
> company which resulted in a huge mail overload.
> 
> >Another fix thanks to Mark Hollomon. The call
> >
> >msleep(ms/10);
> >
> >will result in rounding errors due to the integer evaluation of ms/10
> >before the msleep() call. This leads to 0ms timeouts. Therefore, I have
> >reinserted the 1msec offset. Please find the correction below and sorry
> >for the repeated repeated patches.
> 
> >--- linux-vanilla/drivers/media/common/saa7146_i2c.c	2004-06-15 
> >22:20:04.000000000 -0700
> >+++ linux-dev/drivers/media/common/saa7146_i2c.c	2004-07-26 
> >10:27:26.000000000 -0700
> >@@ -1,11 +1,11 @@
> > #include <linux/version.h>
> > #include <media/saa7146_vv.h>
> > 
> >-/* helper function */
> >+/* helper function
> >+   Note: ms is in terms of tenths of a msec */
> > static void my_wait(struct saa7146_dev *dev, long ms)
> > {
> >-	set_current_state(TASK_INTERRUPTIBLE);
> >-	schedule_timeout((((ms+10)/10)*HZ)/1000);
> >+	msleep((ms+10)/10);
> > }

<snip> 

> Is msleep() already available in 2.6.x?

I am not sure when it was added, but it definitely is in 2.6.7, as this
is what the patch is applied against.

> How will these patches be included in 2.6?
> Who is going to post patches to whom?
> Do you need me to sign-off the saa7146 patches or should I prepare and 
> send them instead?

I will have to defer to Randy Dunlap, who posted about this a bit ago:

The module/subsystem maintainer can elect to merge it on his/her own
(is that you?) or the KJ maintainer (Max Attems) will forward them
if they "pass".

If ther are better answer(er)s out there, hopefully they will post soon.

-Nish

--===============65409511463656145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65409511463656145==--
