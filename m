From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 29 Sep 2004 18:00:07 +0000
Subject: [Kernel-janitors] Re: usb/auerswald: reorder set_current_state()
Message-Id: <20040929180007.GC1652@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86580336829007787=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040929163014.GB3599@masina.coderock.org>
In-Reply-To: <20040929163014.GB3599@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============86580336829007787==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2004 at 07:42:35PM +0200, Domen Puncer wrote:
> On 29/09/04 10:22 -0700, Nishanth Aravamudan wrote:
> > On Wed, Sep 29, 2004 at 06:30:14PM +0200, Domen Puncer wrote:
> > > On 27/09/04 14:46 -0700, Nishanth Aravamudan wrote:
> > > > +++ 2.6.9-rc2/drivers/usb/misc/auerswald.c	2004-09-27 14:42:24.000000000 -0700
> > > > @@ -626,8 +626,8 @@ static int auerchain_start_wait_urb (pau
> > > >  
> > > >  	while (timeout && !chs.done)
> > > >  	{
> > > > -		timeout = schedule_timeout (timeout);
> > > >  		set_current_state(TASK_UNINTERRUPTIBLE);
> > > > +		timeout = schedule_timeout (timeout);
> > > >  		rmb();
> > > >  	}
> > > >
> > > Now "set_current_state (TASK_RUNNING);" a line under this isn't
> > > needed anymore, right?
> > 
> > I think it is still needed, because the state is initially set just before
> > add_wait_queue() [before the if] to TASK_UNINTERRUPTIBLE. So, in the off
> > chance that the while-loop's condition is false on the first iteration,
> > the state needs to be set back to TASK_RUNNING, since schedule_timeout()
> > won't be run at all.
> 
> You're right, missed that.
> So... in the first iteration, schedule won't return instantly =>
> patch isn't needed?

You're right, actually. The one thing I'm not sure about is if the state
is meant to be set before the add_wait_queue(). I'm not sure if this
driver needs to be in TASK_UNINTERRUPTIBLE for the assignment and
auerchain_submit_urb(). If anyone has any input on that, it would be
great.

-Nish

--===============86580336829007787==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86580336829007787==--
