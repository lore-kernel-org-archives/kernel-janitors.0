From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Wed, 28 Jul 2004 15:44:32 +0000
Subject: Re: Re: [Kernel-janitors] [PATCH] parport/parport_pc: replace
Message-Id: <29495f1d0407280844f1e1396@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92038784684662889=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727211211.GN3471@us.ibm.com>
In-Reply-To: <20040727211211.GN3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============92038784684662889==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

You are very right, Mark. I had tried to catch these misses on my part
as I was submitting but must have looked right past this one. This
patch should not be applied.

-Nish

On Wed, 28 Jul 2004 10:51:05 -0400, Mark Hollomon
<markhollomon@comcast.net> wrote:
> 
> 
> Nishanth Aravamudan wrote:
> > I would appreciate any comments from the janitors list. This is one (of
> > many) cases where I made a decision about replacing
> >
> > set_current_state(TASK_INTERRUPTIBLE);
> > schedule_timeout(some_time);
> >
> > with
> >
> > msleep(jiffies_to_msecs(some_time));
> >
> > msleep() is not exactly the same as the previous code, but I only did
> > this replacement where I thought long delays were *desired*. If this is
> > not the case here, then just disregard this patch.
> >
> > Thanks,
> > Nish
> >
> >
> >
> > Applys-to: 2.6.7
> >
> > Description: Uses msleep() instead of schedule_timeout() to guarantee
> > the task delays the desired time.
> >
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> >
> > --- linux-vanilla/drivers/parport/parport_pc.c        2004-06-16 05:20:04.000000000 +0000
> > +++ linux-dev/drivers/parport/parport_pc.c    2004-07-12 22:09:32.000000000 +0000
> > @@ -168,8 +168,7 @@ static int change_mode(struct parport *p
> >                               if (time_after_eq (jiffies, expire))
> >                                       /* The FIFO is stuck. */
> >                                       return -EBUSY;
> > -                             __set_current_state (TASK_INTERRUPTIBLE);
> > -                             schedule_timeout ((HZ + 99) / 100);
> > +                             msleep(10);
> >                               if (signal_pending (current))
> >                                       break;
> >                       }
> 
> Wouldn't the check of signal_pending indicate that the interruptability
> was intentional?
> 
> --
> --------------------------
> Mark Hollomon
> 
> 
>

--===============92038784684662889==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92038784684662889==--
