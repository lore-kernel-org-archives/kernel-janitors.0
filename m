From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 28 Aug 2016 10:25:53 +0000
Subject: Re: [PATCH 8/8] cris-cryptocop: Apply another recommendation from "checkpatch.pl"
Message-Id: <alpine.DEB.2.10.1608281225010.3321@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <bfc23090-e05d-f491-2a28-1803ceb31a31@users.sourceforge.net> <0e29d372-ef5f-afa7-50b1-70ddc089ef00@users.sourceforge.net> <alpine.DEB.2.10.1608272105110.3363@hadrien>
 <130cda68-feed-8b48-e928-7e915888c7c9@users.sourceforge.net>
In-Reply-To: <130cda68-feed-8b48-e928-7e915888c7c9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-cris-kernel@axis.com, Adam Buchbinder <adam.buchbinder@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Jiri Kosina <jkosina@suse.cz>, Mikael Starvik <starvik@axis.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>



On Sun, 28 Aug 2016, SF Markus Elfring wrote:

> >> @@ -2276,7 +2277,10 @@ static int cryptocop_job_setup(struct cryptocop_prio_job **pj, struct cryptocop_
> >>  		(*pj)->iop->ctx_in.saved_data = operation->list_op.inlist;
> >>  		(*pj)->iop->ctx_in.saved_data_buf = operation->list_op.in_data_buf;
> >>  	} else {
> >> -		if ((err = cryptocop_setup_dma_list(operation, &(*pj)->iop, alloc_flag))) {
> >> +		err = cryptocop_setup_dma_list(operation,
> >> +					       &(*pj)->iop,
> >> +					       alloc_flag);
> >
> > Checkpatch didn't say to put every argument on a different line,
>
> I agree to this information.
>
>
> > and that wasn't done before, so why do it now?
>
> I tend to give each function parameter its own text line in such an use case
> (for the known length limitation).
>
>
> > There is plenty of room for at least &(*pj)->iop on the line before.
>
> This is true. - Do you prefer an other indentation approach here?

Very much.  Most of the kernel code puts as much information on a line as
possible, unless there is a reason to do otherwise.  Then more of the code
will fit on the screen at one time.

julia
