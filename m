From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 22 Jan 2005 18:49:48 +0000
Subject: Re: [KJ] Re: [PATCH 18/21] ppc64/rtasd: replace schedule_timeout()
Message-Id: <29495f1d05012210497ee384b3@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46352436421392218=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <16881.58305.424934.884018@cargo.ozlabs.ibm.com>
In-Reply-To: <16881.58305.424934.884018@cargo.ozlabs.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============46352436421392218==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Jan 2005 16:25:21 +1100, Paul Mackerras <paulus@samba.org> wrote:
> Nishanth Aravamudan writes:
> 
> > Description: Replace schedule_timeout() with msleep()/ssleep(). In both cases,
> > the current code sleeps in TASK_INTERRUPTIBLE but does not account for early
> > wakeups due to signals being caught; therefore I have used TASK_UNINTERRUPTIBLE
> > sleeps in both cases. The second sleep is slightly more difficult to convert as
> > rtas_event_scan_rate is variable. I have left it as a msleep() call, although
> > ssleep() may be more appropriate.
> 
> You have a good point about signals, but I don't like the way that
> this will elevate the load average by 1 the whole time.  We need to
> fix this properly instead.

Ideally, we should fix the load average calculation :) It just seems
counterintuitive to me that people would use a less correct
sleep-state just to prevent the load average from going up. But I
understand your motivation, so it's ok. Just an FYI/FWIW, it seems
most other driver authors/maintainers have been somewhat ok with use
TASK_UNINTERRUPTIBLE via msleep()/ssleep(), just because of the time
units difference (which is just so much easier to understand).
Admittedly, it's going to be a long time before HZ is completely out
of the kernel (at least the way it is used today to calculate
delays/timeouts -- there are a total of ~4000 lines of HZ throughout
the kernel), but these patches *are* the first step.

How exactly do you mean fix it properly? Do you want to deal with
signals? It doesn't seem like the code should fail if a signal hits,
but you could save the signal state, block all signals, sleep
interruptibly (to prevent load average) and then restore all signals
on wake-up. I would also add a comment to the effect that
TASK_UNINTERRUPTIBLE would be acceptable, if the loadavg calculation
changes; just so another Janitor (once the calc. does change) could go
through and change it to msleep() / ssleep() then.

Thanks,
Nish

--===============46352436421392218==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46352436421392218==--
