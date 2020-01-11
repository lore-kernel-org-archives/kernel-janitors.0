From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 11 Jan 2020 07:44:36 +0000
Subject: Re: [v3] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001110841140.2965@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110131526.60180-1-wenyang@linux.alibaba.com>
 <91abb141-57b8-7659-25ec-8080e290d846@web.de>
 <c4ada2f2-19b0-91ef-ddf3-a1999f4209ea@linux.alibaba.com>
 <5a9f1ad1-3881-2004-2a7b-d61f1d201cf9@web.de>
In-Reply-To: <5a9f1ad1-3881-2004-2a7b-d61f1d201cf9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

> > +*do_div(f, \( l \| ul \| ul64 \| sl64 \) );
> >
> > We agree with Julia:
> > I don't se any point to this.
>
> Can the avoidance of duplicate source code (according to SmPL disjunctions)
> trigger positive effects on run time characteristics and software maintenance?

Markus.  Please stop asking this question.  You are bothering people with
this advice, why don't _you_ figure out once and for all whether the change
that you suggest has any "positive effects on the run time
characteristics"?  Hint: it will not. You don't even have to run Coccinelle
to see that.  Just use spatch --parse-cocci on your two suggestions and you
will see that they expand to the same thing.  Coccinelle has a pass that
propagates disjunctions at the sub-statement level to the statement level.

julia
