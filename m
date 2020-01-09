From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 09 Jan 2020 10:41:27 +0000
Subject: Re: [PATCH v2] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001091140380.10786@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107170240.47207-1-wenyang@linux.alibaba.com>
 <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
In-Reply-To: <9a2b7d00-442e-0c1b-73cc-aed2bbecd13a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr



On Thu, 9 Jan 2020, Markus Elfring wrote:

> > +@script:python depends on org@
> > +p << r.p;
> > +ul << r.ul;
>
> I interpret this variable assignment in the way that it will work only
> if the corresponding branch of the SmPL disjunction was actually matched
> by the referenced SmPL rule.
> Thus I suggest now to split the source code search pattern into
> four separate rules.

Why?

julia
