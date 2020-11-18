From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 18 Nov 2020 13:15:53 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: locks: Add balancedlock.cocci script
Message-Id: <alpine.DEB.2.22.394.2011181413280.2641@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1777813137-1605705354=:2641"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201118080242.t6u6lchj5ww2fac4@adolin>
 <62af4a93-dbc3-8aa0-6924-4dc479001d34@web.de>
In-Reply-To: <62af4a93-dbc3-8aa0-6924-4dc479001d34@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1777813137-1605705354=:2641
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

> > +++ b/scripts/coccinelle/locks/balancedlock.cocci
> …
> > +//# False positives may be generated due to locks released within a nested
> > +//# function call or a goto block.
> > +///
> > +// Confidence: Moderate
>
> How good does such information fit together?
>

What kind of response do you expect?  There are some concerns, so it's not
High confidence.  It works pretty well so it's not low confidence.  So
it's moderate confidence.  What else is there to say?

> …
> >+ (
> > +mutex_lock@p(E);
> > +|
> > +read_lock@p(E);
> > +|
> …
>
> Why did you not reorder the elements of such a SmPL disjunctions according to
> an usage incidence (which can be determined by another SmPL script like
> “report_lock_calls.cocci”)?

I don't recall ever seeing any evidence that it has an impact for function
calls.  Furthermore, the numbers will change over time.  So why change it?

> …
> > +msg = "This code segment might have an unbalanced lock."
> > +coccilib.org.print_todo(j0[0], msg)
>
> Please pass the string literal directly.
>
> +coccilib.org.print_todo(j0[0], "This code segment might have an unbalanced lock.")

The code is fine as it is.

julia
--8323329-1777813137-1605705354=:2641--
