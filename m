From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 21 Oct 2020 12:25:32 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <20201021122532.GA30733@vingu-book>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de>
In-Reply-To: <20201021112038.GC32041@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mel Gorman <mgorman@suse.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles.Muller@inria.fr

Le mercredi 21 oct. 2020 =E0 12:20:38 (+0100), Mel Gorman a =E9crit :
> On Tue, Oct 20, 2020 at 06:37:59PM +0200, Julia Lawall wrote:
> > On a thread wakeup, the change [1] from runnable load average to load
> > average for comparing candidate cores means that recent short-running
> > daemons on the core where a thread ran previously can be considered to
> > have a higher load than the core performing the wakeup, even when the
> > core where the thread ran previously is currently idle.  This can
> > cause a thread to migrate, taking the place of some other thread that
> > is about to wake up, and so on.  To avoid unnecessary migrations,
> > extend wake_affine_idle to check whether the core where the thread
> > previously ran is currently idle, and if so return that core as the
> > target.
> >=20
> > [1] commit 11f10e5420f6ce ("sched/fair: Use load instead of runnable
> > load in wakeup path")
> >=20
> > This particularly has an impact when using passive (intel_cpufreq)
> > power management, where kworkers run every 0.004 seconds on all cores,
> > increasing the likelihood that an idle core will be considered to have
> > a load.
> >=20
> > The following numbers were obtained with the benchmarking tool
> > hyperfine (https://github.com/sharkdp/hyperfine) on the NAS parallel
> > benchmarks (https://www.nas.nasa.gov/publications/npb.html).  The
> > tests were run on an 80-core Intel(R) Xeon(R) CPU E7-8870 v4 @
> > 2.10GHz.  Active (intel_pstate) and passive (intel_cpufreq) power
> > management were used.  Times are in seconds.  All experiments use all
> > 160 hardware threads.
> >=20
> > 	v5.9/active		v5.9+patch/active
> > bt.C.c	24.725724+-0.962340	23.349608+-1.607214
> > lu.C.x	29.105952+-4.804203	25.249052+-5.561617
> > sp.C.x	31.220696+-1.831335	30.227760+-2.429792
> > ua.C.x	26.606118+-1.767384	25.778367+-1.263850
> >=20
> > 	v5.9/passive		v5.9+patch/passive
> > bt.C.c	25.330360+-1.028316	23.544036+-1.020189
> > lu.C.x	35.872659+-4.872090	23.719295+-3.883848
> > sp.C.x	32.141310+-2.289541	29.125363+-0.872300
> > ua.C.x	29.024597+-1.667049	25.728888+-1.539772
> >=20
> > On the smaller data sets (A and B) and on the other NAS benchmarks
> > there is no impact on performance.
> >=20
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> I suspect that the benefit of this patch is due to avoiding the overhead
> of wake_affine_weight() check because the following check exists in
> select_idle_sibling
>=20
>         /*
>          * If the previous CPU is cache affine and idle, don't be stupid:
>          */
>         if (prev !=3D target && cpus_share_cache(prev, target) &&
>             (available_idle_cpu(prev) || sched_idle_cpu(prev)))
>                 return prev;
>=20
> Still, the concept makes some sense to avoid wake_affine_weight but look
> at the earlier part of wake_affine_idle()
>=20
>         if (available_idle_cpu(this_cpu) && cpus_share_cache(this_cpu, pr=
ev_cpu))
>                 return available_idle_cpu(prev_cpu) ? prev_cpu : this_cpu;
>=20
> This thing is almost completely useless because this_cpu is only going to
> be idle if it's a wakeup from interrupt context when the CPU was otherwise
> idle *but* it takes care to only use the CPU if this and prev share LLC.
>=20
> The patch as it stands may leave a task on a remote node when it should
> have been pulled local to the waker because prev happened to be idle. This
> is not guaranteed because a node could have multiple LLCs and prev is
> still appropriate but that's a different problem entirely and requires
> much deeper surgery. Still, not pulling a task from a remote node is
> a change in expected behaviour. While it's possible that NUMA domains
> will not even reach this path, it depends on the NUMA distance as can
> be seen in sd_init() for the setting of SD_WAKE_AFFINE so I think the
> cpus_share_cache check is necessary.
>=20
> I think it would be more appropriate to rework that block that checks
> this_cpu to instead check if the CPUs share cache first and then return o=
ne
> of them (preference to prev based on the comment above it about avoiding
> a migration) if either one is idle.
>=20
> I see Vincent already agreed with the patch so I could be wrong.  Vincent,
> did I miss something stupid?

This patch fixes the problem that we don't favor anymore the prev_cpu when =
it is idle since
commit 11f10e5420f6ce because load is not null when cpu is idle whereas run=
nable_load was
And this is important because this will=A0then decide in which LLC we will =
looks for a cpu

>=20
> --=20
> Mel Gorman
> SUSE Labs
