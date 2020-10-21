From: Mel Gorman <mgorman@suse.de>
Date: Wed, 21 Oct 2020 12:47:00 +0000
Subject: Re: [PATCH] sched/fair: check for idle core
Message-Id: <20201021124700.GE32041@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1603211879-1064-1-git-send-email-Julia.Lawall@inria.fr>
 <20201021112038.GC32041@suse.de>
 <20201021122532.GA30733@vingu-book>
In-Reply-To: <20201021122532.GA30733@vingu-book>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, Gilles.Muller@inria.fr

On Wed, Oct 21, 2020 at 02:25:32PM +0200, Vincent Guittot wrote:
> > I see Vincent already agreed with the patch so I could be wrong.  Vince=
nt,
> > did I miss something stupid?
>=20
> This patch fixes the problem that we don't favor anymore the prev_cpu whe=
n it is idle since
> commit 11f10e5420f6ce because load is not null when cpu is idle whereas r=
unnable_load was
> And this is important because this will=A0then decide in which LLC we wil=
l looks for a cpu
>=20

Ok, that is understandable but I'm still concerned that the fix simply
trades one problem for another by leaving related tasks remote to each
other and increasing cache misses and remote data accesses.

wake_affine_weight is a giant pain because really we don't care about the
load on the waker CPU or its available, we care about whether it has idle
siblings that can be found quickly. As tempting as ripping it out is,
it never happened because sometimes it makes the right decision.

--=20
Mel Gorman
SUSE Labs
