From: Domen Puncer <domen@coderock.org>
Date: Tue, 25 May 2004 11:28:14 +0000
Subject: [Kernel-janitors] Re: Replaces yield() with nicedelay() on
Message-Id: <20040525112814.GA26362@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45239855228649062=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524132440.GA23599@nd47>
In-Reply-To: <20040524132440.GA23599@nd47>
To: kernel-janitors@vger.kernel.org

--===============45239855228649062==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24/05/04 21:49 -0300, Gustavo Franco wrote:
> Domen Puncer wrote:
> >On 02/05/04 22:24 -0300, Gustavo Franco wrote:
> >
> >>Hi,
> >>
> >>It's the last REDIFF, but i'm not replacing yield() with 
> >>schedule_timeout() because there's a nicedelay() (maybe the
> >>usecs need to be tuned below) there:
> >>
> >>
> >>static inline void nicedelay(unsigned long usecs)
> >>{
> >>       current->state = TASK_INTERRUPTIBLE;
> >>       schedule_timeout(HZ);
> >>       return;
> >>}
> >
> >
> >And usecs stands for??
> >Funny thing is that there are actualy uses of this function.
> 
> What do you think about msleep() as greg said?

msleep is definitely the way to go, it includes set_current_state, and
is more readable.

> >Also, please make -p1 applyable patches.
> 
> I'm preparing my travel to debconf4, i'll be back on 30 May.In
> early June i'll send rediffied patches.As i said in a previous
> post it was my error.I was still considering the "old" SubmittingPatches.
> 
> 
> Thanks,
> Gustavo Franco

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============45239855228649062==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45239855228649062==--
