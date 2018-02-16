From: Juri Lelli <juri.lelli@gmail.com>
Date: Fri, 16 Feb 2018 09:44:32 +0000
Subject: Re: [PATCH-next] sched/headers: Clean up <linux/sched.h>
Message-Id: <20180216094432.GG8032@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215154318.15894-1-chrisadr@gentoo.org>
 <20180215165212.GB25181@hirez.programming.kicks-ass.net>
In-Reply-To: <20180215165212.GB25181@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christopher Diaz Riveros <chrisadr@gentoo.org>, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15/02/18 17:52, Peter Zijlstra wrote:
> On Thu, Feb 15, 2018 at 10:43:18AM -0500, Christopher Diaz Riveros wrote:

[...]

> > @@ -437,20 +437,28 @@ struct sched_dl_entity {
> >  	 * during sched_setattr(), they will remain the same until
> >  	 * the next sched_setattr().
> >  	 */
> > -	u64				dl_runtime;	/* Maximum runtime for each instance	*/
> > -	u64				dl_deadline;	/* Relative deadline of each instance	*/
> > -	u64				dl_period;	/* Separation of two instances (period) */
> > -	u64				dl_bw;		/* dl_runtime / dl_period		*/
> > -	u64				dl_density;	/* dl_runtime / dl_deadline		*/
> > +	/* Maximum runtime for each instance	*/
> > +	u64				dl_runtime;
> > +	/* Relative deadline of each instance	*/
> > +	u64				dl_deadline;
> > +	/* Separation of two instances (period) */
> > +	u64				dl_period;
> > +	/* dl_runtime / dl_period		*/
> > +	u64				dl_bw;
> > +	/* dl_runtime / dl_deadline		*/
> > +	u64				dl_density;
> 
> That's a whole lot less readable :/

Yep. :(
