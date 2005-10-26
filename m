From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Oct 2005 19:48:27 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/cdrom/mcdx.c: replace
Message-Id: <20051026194827.GD27205@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49293263779643304=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051026191842.GA9416@mipter.zuzino.mipt.ru>
In-Reply-To: <20051026191842.GA9416@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============49293263779643304==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 26.10.2005 [23:18:42 +0400], Alexey Dobriyan wrote:
> On Sat, Oct 22, 2005 at 09:59:18PM -0500, irwan.djajadi@iname.com wrote:
> > drivers/cdrom/mcdx.c: replace interruptible_sleep_on() with
> > wait_event_interruptible() and schedule_timeout_interruptible(). Removed
> > sleepq wait_queue, since it's no longer needed. Reordered some conditional
> > prints because wait_event_interruptible_timeout() returns -ERESTARTSYS when
> > interrupted by a signal.
> 
> > --- 2.6.14-rc5/drivers/cdrom/mcdx.c
> > +++ mod/drivers/cdrom/mcdx.c
> > @@ -909,7 +908,7 @@ static int mcdx_talk(struct s_drive_stuf
> >
> >  	while (stuffp->lock) {
> >  		xtrace(SLEEP, "*** talk: lockq\n");
> > -		interruptible_sleep_on(&stuffp->lockq);
> > +		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
> >  		xtrace(SLEEP, "talk: awoken\n");
> >  	}
> 
> > @@ -1335,7 +1333,7 @@ static int mcdx_xfer(struct s_drive_stuf
> >  	}
> >  
> >  	while (stuffp->lock) {
> > -		interruptible_sleep_on(&stuffp->lockq);
> > +		wait_event_interruptible(stuffp->lockq, !stuffp->lock);
> >  	}
> 
> Looks like the whole loops should be replaced.
> wait_event_interruptible() does it's own looping.

That seems fine for the second replacement, but the first will lose
per-iteration tracing. Depends on whether the maintainer cares.

Thanks,
Nish

--===============49293263779643304==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49293263779643304==--
