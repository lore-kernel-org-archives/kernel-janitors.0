From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 21 Oct 2020 12:56:06 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <alpine.DEB.2.22.394.2010211452100.8475@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1257254928-1603284967=:8475"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr> <20201021112038.GC32041@suse.de> <20201021122532.GA30733@vingu-book> <20201021124700.GE32041@suse.de>
In-Reply-To: <20201021124700.GE32041@suse.de>
To: Mel Gorman <mgorman@suse.de>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles.Muller@inria.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1257254928-1603284967=:8475
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable



On Wed, 21 Oct 2020, Mel Gorman wrote:

> On Wed, Oct 21, 2020 at 02:25:32PM +0200, Vincent Guittot wrote:
> > > I see Vincent already agreed with the patch so I could be wrong.  Vin=
cent,
> > > did I miss something stupid?
> >
> > This patch fixes the problem that we don't favor anymore the prev_cpu w=
hen it is idle since
> > commit 11f10e5420f6ce because load is not null when cpu is idle whereas=
 runnable_load was
> > And this is important because this will=A0then decide in which LLC we w=
ill looks for a cpu
> >
>
> Ok, that is understandable but I'm still concerned that the fix simply
> trades one problem for another by leaving related tasks remote to each
> other and increasing cache misses and remote data accesses.
>
> wake_affine_weight is a giant pain because really we don't care about the
> load on the waker CPU or its available, we care about whether it has idle
> siblings that can be found quickly. As tempting as ripping it out is,
> it never happened because sometimes it makes the right decision.

My goal was to restore the previous behavior, when runnable load was used.
The patch removing the use of runnable load (11f10e5420f6) presented it
basically as that load balancing was using it, so wakeup should use it
too, and any way it didn't matter because idle CPUS were checked for
anyway.

Is your point of view that the proposed change is overkill?  Or is it that
the original behavior was not desirable?

thanks,
julia
--8323329-1257254928-1603284967=:8475--
