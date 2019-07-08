From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 08 Jul 2019 10:23:12 +0000
Subject: Re: [PATCH] sched/topology: One function call less in build_group_from_child_sched_domain()
Message-Id: <20190708102312.GF3402@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ad2e7dfb-3323-b214-716e-a6cae41b8bcc@web.de>
 <20190706172223.GA12680@linux.vnet.ibm.com>
In-Reply-To: <20190706172223.GA12680@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Sat, Jul 06, 2019 at 10:52:23PM +0530, Srikar Dronamraju wrote:
> * Markus Elfring <Markus.Elfring@web.de> [2019-07-06 16:05:17]:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sat, 6 Jul 2019 16:00:13 +0200
> > 
> > Avoid an extra function call by using a ternary operator instead of
> > a conditional statement.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  kernel/sched/topology.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index f751ce0b783e..6190eb52c30a 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -886,11 +886,7 @@ build_group_from_child_sched_domain(struct sched_domain *sd, int cpu)
> >  		return NULL;
> > 
> >  	sg_span = sched_group_span(sg);
> > -	if (sd->child)
> > -		cpumask_copy(sg_span, sched_domain_span(sd->child));
> > -	else
> > -		cpumask_copy(sg_span, sched_domain_span(sd));
> > -
> > +	cpumask_copy(sg_span, sched_domain_span(sd->child ? sd->child : sd));
> 
> At runtime, Are we avoiding a function call?
> However I think we are avoiding a branch instead of a conditional, which may
> be beneficial.

It all depends on what the compiler does; also this is super slow path
stuff and the patch makes code less readable (IMO).
