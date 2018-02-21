From: Juri Lelli <juri.lelli@gmail.com>
Date: Wed, 21 Feb 2018 08:09:44 +0000
Subject: Re: [PATCH-next] sched/headers: Clean up <linux/sched.h>
Message-Id: <20180221080944.GB8032@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215154318.15894-1-chrisadr@gentoo.org>
 <20180215165212.GB25181@hirez.programming.kicks-ass.net>
 <20180216094432.GG8032@localhost.localdomain>
 <1518787521.2464.20.camel@gentoo.org>
In-Reply-To: <1518787521.2464.20.camel@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christopher =?iso-8859-1?Q?D=EDaz?= Riveros <chrisadr@gentoo.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16/02/18 08:25, Christopher D=EDaz Riveros wrote:
> El vie, 16-02-2018 a las 10:44 +0100, Juri Lelli escribi=F3:
> > On 15/02/18 17:52, Peter Zijlstra wrote:
> > > On Thu, Feb 15, 2018 at 10:43:18AM -0500, Christopher Diaz Riveros
> > > wrote:
> >=20
> > [...]
> >=20
> > > > @@ -437,20 +437,28 @@ struct sched_dl_entity {
> > > >  	 * during sched_setattr(), they will remain the same
> > > > until
> > > >  	 * the next sched_setattr().
> > > >  	 */
> > > > -	u64				dl_runtime;	/*
> > > > Maximum runtime for each instance	*/
> > > > -	u64				dl_deadline;	/
> > > > * Relative deadline of each instance	*/
> > > > -	u64				dl_period;	/*
> > > > Separation of two instances (period) */
> > > > -	u64				dl_bw;	=09
> > > > /* dl_runtime / dl_period		*/
> > > > -	u64				dl_density;	/*
> > > > dl_runtime / dl_deadline		*/
> > > > +	/* Maximum runtime for each instance	*/
> > > > +	u64				dl_runtime;
> > > > +	/* Relative deadline of each instance	*/
> > > > +	u64				dl_deadline;
> > > > +	/* Separation of two instances (period) */
> > > > +	u64				dl_period;
> > > > +	/* dl_runtime / dl_period		*/
> > > > +	u64				dl_bw;
> > > > +	/* dl_runtime / dl_deadline		*/
> > > > +	u64				dl_density;
> > >=20
> > > That's a whole lot less readable :/
> >=20
> > Yep. :(
>=20
> Thank you all for the feedback, I'll consider this patch as NACK. Sorry
>  for wasting time in a low quality patch. I'll prepare a better one
> next time :)

No problem, thanks actually to seeing if things can be cleaned up. :)

While going through that struct again I was thinking that we might want
to completely remove inline comments and put them in the above comment
block(s), as we already have for bool flags:

  /*
   * Some bool flags:
   *
   * @dl_throttled tells if we exhausted the runtime. If so, the
   * task has to wait for a replenishment to be performed at the
   * next firing of dl_timer.
   [...]

Would it be OK and any better?

Thanks,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
