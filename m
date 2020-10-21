From: Mel Gorman <mgorman@suse.de>
Date: Wed, 21 Oct 2020 13:18:27 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <20201021131827.GF32041@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de>
 <20201021122532.GA30733@vingu-book>
 <20201021124700.GE32041@suse.de>
 <alpine.DEB.2.22.394.2010211452100.8475@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2010211452100.8475@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles.Muller@inria.fr

On Wed, Oct 21, 2020 at 02:56:06PM +0200, Julia Lawall wrote:
>=20
>=20
> On Wed, 21 Oct 2020, Mel Gorman wrote:
>=20
> > On Wed, Oct 21, 2020 at 02:25:32PM +0200, Vincent Guittot wrote:
> > > > I see Vincent already agreed with the patch so I could be wrong.  V=
incent,
> > > > did I miss something stupid?
> > >
> > > This patch fixes the problem that we don't favor anymore the prev_cpu=
 when it is idle since
> > > commit 11f10e5420f6ce because load is not null when cpu is idle where=
as runnable_load was
> > > And this is important because this will=A0then decide in which LLC we=
 will looks for a cpu
> > >
> >
> > Ok, that is understandable but I'm still concerned that the fix simply
> > trades one problem for another by leaving related tasks remote to each
> > other and increasing cache misses and remote data accesses.
> >
> > wake_affine_weight is a giant pain because really we don't care about t=
he
> > load on the waker CPU or its available, we care about whether it has id=
le
> > siblings that can be found quickly. As tempting as ripping it out is,
> > it never happened because sometimes it makes the right decision.
>=20
> My goal was to restore the previous behavior, when runnable load was used.
> The patch removing the use of runnable load (11f10e5420f6) presented it
> basically as that load balancing was using it, so wakeup should use it
> too, and any way it didn't matter because idle CPUS were checked for
> anyway.
>=20

Which is fair.

> Is your point of view that the proposed change is overkill?  Or is it that
> the original behavior was not desirable?
>=20

I worry it's overkill because prev is always used if it is idle even
if it is on a node remote to the waker. It cuts off the option of a
wakee moving to a CPU local to the waker which is not equivalent to the
original behaviour.

--=20
Mel Gorman
SUSE Labs
