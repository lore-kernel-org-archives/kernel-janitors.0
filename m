From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sun, 30 Jan 2005 19:02:40 +0000
Subject: Re: [KJ] Re: 12/34: cdrom/cdu31a: replace interruptible_sleep_on()
Message-Id: <29495f1d05013011023236d5b0@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80208071106272638=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050130121027.GC3835@masina.coderock.org>
In-Reply-To: <20050130121027.GC3835@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============80208071106272638==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jan 2005 13:10:27 +0100, Domen Puncer <domen@coderock.org> wrote:
> On 25/01/05 15:14 -0800, Nishanth Aravamudan wrote:
> > Hi,
> >
> > Please consider applying.
> >
> > Description: Use wait_event_interruptible() instead of the deprecated
> > interruptible_sleep_on(). The patch is straight-forward as the macros should
> > result in the same execution. Patch is compile-tested (still throws out warnings
> > regarding {save,restore}_flags()).
> 
> It also indirectly calls schedule() with interrupts disabled... this
> can't be right?
> 
> >       cli();
> > -     while (sony_inuse) {
> > -             interruptible_sleep_on(&sony_wait);
> > -             if (signal_pending(current)) {
> > -                     restore_flags(flags);
> > -                     return -EAGAIN;
> > -             }
> > +     wait_event_interruptible(sony_wait, sony_inuse);
> > +     if (signal_pending(current)) {
> > +             restore_flags(flags);
> > +             return -EAGAIN;

Yes, pretty much any driver that still calls cli()/sti() is broken in
one way or another. I think you are right, though, that the schedule()
with interrupts cleared makes little sense. I'm not sure how to fix it
though.

-Nish

--===============80208071106272638==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80208071106272638==--
