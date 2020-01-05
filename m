From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 05 Jan 2020 10:41:00 +0000
Subject: Re: [PATCH] coccinelle: semantic patch to check for inappropriate do_div() calls
Message-Id: <alpine.DEB.2.21.2001051139010.2579@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-2099431970-1578220860=:2579"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200104064448.24314-1-wenyang@linux.alibaba.com>
 <21e9861a-5afc-fd66-cfd1-a9b5b92b230b@web.de>
In-Reply-To: <21e9861a-5afc-fd66-cfd1-a9b5b92b230b@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Wen Yang <wenyang@linux.alibaba.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Matthias_M=E4nnich?= <maennich@google.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2099431970-1578220860=:2579
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 5 Jan 2020, Markus Elfring wrote:

> > +virtual context
> > +virtual org
> > +virtual report
>
> The operation mode “patch” is not supported here.
> Should the term “semantic code search” be used instead in the subject again?

Doesn't matter,

>
>
> > +@@
> > +(
> > +* do_div(f, l);
> > +|
> > +* do_div(f, ul);
> > +|
> > +* do_div(f, ul64);
> > +|
> > +* do_div(f, sl64);
> > +)
>
> I suggest to avoid the specification of duplicate SmPL code.
>
> +@@
> +*do_div(f, \( l \| ul \| ul64 \| sl64 \) );

I don't se any point to this.  The code matched will be the same in both
cases.  The original code is quite readable, without the ugly \( etc.

>
> Will any more case distinctions become helpful?
>
>
> > +@script:python depends on report@
> > +p << r.p;
> > +@@
> > +
> > +msg="WARNING: WARNING: do_div() does a 64-by-32 division, which may truncation the divisor to 32-bit"
> > +coccilib.report.print_report(p[0], msg)
>
> Please improve the message construction.

Please make more precise comments (I already made some suggestions, so it
doesn't matter much here, but "please improve" does not provide any
concrete guidance).

julia
--8323329-2099431970-1578220860=:2579--
