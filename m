From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:15:02 +0000
Subject: [Kernel-janitors] Re: [PATCH] irda/irtty-sir: replace
Message-Id: <20040727181502.GL2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97319735864934132=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727175004.GA18782@bougret.hpl.hp.com>
In-Reply-To: <20040727175004.GA18782@bougret.hpl.hp.com>
To: kernel-janitors@vger.kernel.org

--===============97319735864934132==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 10:50:04AM -0700, Jean Tourrilhes wrote:
> On Tue, Jul 27, 2004 at 10:11:20AM -0700, Nishanth Aravamudan wrote:
> > I would appreciate any comments from the janitors list. 
> > 
> > Applys-to: 2.6.7
> > 
> > Description: Replace schedule_timeout() with msleep() to guarantee the
> > task delays for the desired time.
> 
> 	I'm forwarding that the Martin, which is the maintainer of
> that piece of code.
> 	I personally find the name of the msleep() function dangerous
> and confusing, and I would prefer not to use it as it is. Despite its
> very generic name, the msleep() function apply only when we are within
> a real process/task context. If you attempt to use it in interrupt, BH
> or timer context, you will get some very interesting results.

<snip>

> 	I would suggest renaming "msleep()" to "task_msleep()" or
> "schedule_msleep()" before applying this patch, so that things are
> clear. Or just make "task_msleep()" or "schedule_msleep()" a wrapper
> around "msleep()".

You make a valid point, but this is the way I see it:

Anything which has the word "sleep" in it should be suspicious and not
be called from interrupt context, unless one is certain this is a
misnaming. In this case, it is not, as the task *will* sleep. A "delay"
on the other hand, implies busy-waiting. Thus there is no problem with
using mdelay/udelay in any context, as the process does not sleep. Thus,
I don't really think the naming is all that confusing.

If anyone else has any input, I'd appreciate it.

-Nish

--===============97319735864934132==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97319735864934132==--
