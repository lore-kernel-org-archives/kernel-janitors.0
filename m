From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:33:43 +0000
Subject: Re: [KJ] [PATCH] net/ewrk3: replace schedule_timeout() with
Message-Id: <20041022233343.GF18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48479755855373119=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041022232643.GC18906@us.ibm.com>
In-Reply-To: <20041022232643.GC18906@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============48479755855373119==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 23, 2004 at 12:30:03AM +0100, Jon Masters wrote:
> On Fri, 22 Oct 2004 16:26:43 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> 
> > Any comments would be, as always, appreciated.
> 
> >                 /* Wait a little while */
> >                 spin_unlock_irqrestore(&lp->hw_lock, flags);
> > -               set_current_state(TASK_UNINTERRUPTIBLE);
> > -               schedule_timeout(HZ>>2);
> > +               msleep(250);
> >                 spin_lock_irqsave(&lp->hw_lock, flags);
> 
> That delay seems a little long.

Do you mean in the original driver or in my conversion?

-Nish

--===============48479755855373119==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48479755855373119==--
