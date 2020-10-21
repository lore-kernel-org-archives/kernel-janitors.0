From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 21 Oct 2020 13:48:59 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <alpine.DEB.2.22.394.2010211547190.57356@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-484522562-1603288140=:57356"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book> <20201021124700.GE32041@suse.de> <alpine.DEB.2.22.394.2010211452100.8475@hadrien> <20201021131827.GF32041@suse.de>
In-Reply-To: <20201021131827.GF32041@suse.de>
To: Mel Gorman <mgorman@suse.de>
Cc: Julia Lawall <julia.lawall@inria.fr>, Vincent Guittot <vincent.guittot@linaro.org>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles.Muller@inria.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-484522562-1603288140=:57356
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable



On Wed, 21 Oct 2020, Mel Gorman wrote:

> On Wed, Oct 21, 2020 at 02:56:06PM +0200, Julia Lawall wrote:
> >
> >
> > On Wed, 21 Oct 2020, Mel Gorman wrote:
> >
> > > On Wed, Oct 21, 2020 at 02:25:32PM +0200, Vincent Guittot wrote:
> > > > > I see Vincent already agreed with the patch so I could be wrong. =
 Vincent,
> > > > > did I miss something stupid?
> > > >
> > > > This patch fixes the problem that we don't favor anymore the prev_c=
pu when it is idle since
> > > > commit 11f10e5420f6ce because load is not null when cpu is idle whe=
reas runnable_load was
> > > > And this is important because this will=A0then decide in which LLC =
we will looks for a cpu
> > > >
> > >
> > > Ok, that is understandable but I'm still concerned that the fix simply
> > > trades one problem for another by leaving related tasks remote to each
> > > other and increasing cache misses and remote data accesses.
> > >
> > > wake_affine_weight is a giant pain because really we don't care about=
 the
> > > load on the waker CPU or its available, we care about whether it has =
idle
> > > siblings that can be found quickly. As tempting as ripping it out is,
> > > it never happened because sometimes it makes the right decision.
> >
> > My goal was to restore the previous behavior, when runnable load was us=
ed.
> > The patch removing the use of runnable load (11f10e5420f6) presented it
> > basically as that load balancing was using it, so wakeup should use it
> > too, and any way it didn't matter because idle CPUS were checked for
> > anyway.
> >
>
> Which is fair.
>
> > Is your point of view that the proposed change is overkill?  Or is it t=
hat
> > the original behavior was not desirable?
> >
>
> I worry it's overkill because prev is always used if it is idle even
> if it is on a node remote to the waker. It cuts off the option of a
> wakee moving to a CPU local to the waker which is not equivalent to the
> original behaviour.

Could it be possible to check p->recent_used_cpu?  If that is prev (or on
the same socket?), then prev could be a good choice.  If that is on the
same socket as the waker, then maybe the waker would be better.

julia
--8323329-484522562-1603288140=:57356--
