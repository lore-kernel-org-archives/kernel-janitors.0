From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 03 Aug 2020 13:21:15 +0000
Subject: Re: [PATCH] coccinelle: api: add kvmalloc script
Message-Id: <alpine.DEB.2.22.394.2008031519520.27678@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-183462625-1596460875=:27678"
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd186837-3753-436a-b1f6-7e1dfe5ff5e0@web.de>
In-Reply-To: <cd186837-3753-436a-b1f6-7e1dfe5ff5e0@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-183462625-1596460875=:27678
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 3 Aug 2020, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/api/kvmalloc.cocci
> …
> > +@opportunity depends on !patch@
> > +expression E, E1, size;
> > +position p;
> > +@@
> > +
> > +(
> …
> > +|
> > +* E = \(kmalloc\|kzalloc\|kcalloc\|kmalloc_node\|kzalloc_node\|
> > +*       kmalloc_array\|kmalloc_array_node\|kcalloc_node\)(..., size, ...)
> > +  ... when != E = E1
> > +      when != size = E1
> > +      when any
> > +* if (\(!E\|E == NULL\))@p {

Actually, you shouldn't need both E == NULL and !E.  E == NULL should be
sufficient.

julia

> …
>
> I suggest to extend the SmPL code exclusion specification so that
> pointer dereferences will be filtered out before the shown null pointer detection.
>
>
> > +@depends on patch@
> > +expression E, E1, flags, size, node;
> > +identifier x;
> > +type T;
> > +@@
> > +
> > +(
> > +- if (\(size <= E1\|size < E1\|size == E1\|size > E1\))
>
> This condition check is repeated a few times.
> Thus I imagine that the usage of another metavariable with a SmPL constraint
> can eventually be helpful.
>
> +binary operator bo = {<=, <, ==, >};
> …
> +-if (size bo E1)
>
>
>
> > +-    E = kmalloc(size, flags);
> > +- else
> > +-    E = vmalloc(size);
>
> Will it be interesting to support also the use of conditional operators
> by another part of a SmPL disjunction?
>
> -E = (…) ? kmalloc(size, flags) : vmalloc(size);
>
>
> > ++ E = kvmalloc(size, flags);
> > +|
> > +- E = kmalloc(size, flags | __GFP_NOWARN);
> > +- if (\(!E\|E == NULL\))
> > +-   E = vmalloc(size);
> > ++ E = kvmalloc(size, flags);
>
> This source code replacement line is repeated. Thus I imagine
> that it would be nice if such SmPL code duplication could be avoided
> by the application of another SmPL disjunction.
> Unfortunately, the software “Coccinelle 1.0.8-00146-g04f36d53” presents
> the error message “15: no available token to attach to” then.
> Would you like to adjust anything in this area?
>
> Regards,
> Markus
>
--8323329-183462625-1596460875=:27678--
