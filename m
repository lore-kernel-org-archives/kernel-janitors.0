From: Ian Rogers <irogers@google.com>
Date: Sat, 21 Mar 2020 02:24:41 +0000
Subject: Re: [PATCH] perf/core: Fix reversed NULL check in perf_event_groups_less()
Message-Id: <CAP-5=fU060AZxi6gC7Z4exUqy8VBT08AuE1AZV6F2qDmTKLPwg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312105637.GA8960@mwanda> <20200313122725.GZ12561@hirez.programming.kicks-ass.net>
In-Reply-To: <20200313122725.GZ12561@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Mar 13, 2020 at 5:27 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Mar 12, 2020 at 01:56:37PM +0300, Dan Carpenter wrote:
> > This NULL check is reversed so it leads to a Smatch warning and
> > presumably a NULL dereference.
> >
> >     kernel/events/core.c:1598 perf_event_groups_less()
> >     error: we previously assumed 'right->cgrp->css.cgroup' could be null
> >       (see line 1590)
> >
> > Fixes: 95ed6c707f26 ("perf/cgroup: Order events in RB tree by cgroup id")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  kernel/events/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 6a47c3e54fe9..607c04ec7cfa 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -1587,7 +1587,7 @@ perf_event_groups_less(struct perf_event *left, struct perf_event *right)
> >                        */
> >                       return true;
> >               }
> > -             if (!right->cgrp || right->cgrp->css.cgroup) {
> > +             if (!right->cgrp || !right->cgrp->css.cgroup) {
> >                       /*
> >                        * Right has no cgroup but left does, no cgroups come
> >                        * first.
>
> Thanks!

Also much thanks!

Ian
