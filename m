From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:31:06 +0000
Subject: [Kernel-janitors] Re: [PATCH] md: replace schedule_timeout() with
Message-Id: <20040726173106.GC1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20891340439184458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0407240731440.16034@devserv.devel.redhat.com>
In-Reply-To: <Pine.LNX.4.58.0407240731440.16034@devserv.devel.redhat.com>
To: kernel-janitors@vger.kernel.org

--===============20891340439184458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 24, 2004 at 07:33:31AM -0400, Ingo Molnar wrote:
> 
> On Fri, 23 Jul 2004, Nishanth Aravamudan wrote:
> 
> > --- linux-vanilla/drivers/md/md.c	2004-06-16 05:19:03.000000000 +0000
> > +++ linux-dev/drivers/md/md.c	2004-07-12 18:47:53.000000000 +0000
> > @@ -3438,8 +3438,7 @@ static void md_do_sync(mddev_t *mddev)
> >  		if (currspeed > sysctl_speed_limit_min) {
> >  			if ((currspeed > sysctl_speed_limit_max) ||
> >  					!is_mddev_idle(mddev)) {
> > -				current->state = TASK_INTERRUPTIBLE;
> > -				schedule_timeout(HZ/4);
> > +				msleep(250);
> 
> well, it's not 100% equivalent because msleep() is uninterruptible so
> stoppage of the md thread (upon shutdown) will occur with only a 250 msec
> delay. Someone should add a msleep_interruptible() function to
> kernel/timer.c.

You are exactly right. That's what I tried to indicated in my posts.
There isn't any msleep_interruptible() unfortunately, so the code can just
be left as is.

Thanks,
Nish

--===============20891340439184458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20891340439184458==--
