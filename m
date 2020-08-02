From: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 02 Aug 2020 07:09:04 +0000
Subject: Re: [PATCH v6] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.22.394.2008020907220.2531@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-429177205-1596352144=:2531"
List-Id: <kernel-janitors.vger.kernel.org>
References: <3aea12cf-68dc-e140-936f-cfefb2adbc8f@web.de>
In-Reply-To: <3aea12cf-68dc-e140-936f-cfefb2adbc8f@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-429177205-1596352144=:2531
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sun, 2 Aug 2020, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/api/kvfree.cocci
> …
> > +@choice@
> > +expression E, E1;
> > +position kok, vok;
> > +@@
> > +
> > +(
> …
> > +|
> > +  E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|kmalloc_node\|kzalloc_node\|
> > +        kmalloc_array\|kmalloc_array_node\|kcalloc_node\)(...)@kok
> > +  ... when != E = E1
> > +      when any
> > +  if (\(!E\|E == NULL\)) {
> …
>
> Can the SmPL code exclusion specification be incomplete here?
>
> How do you think about to check also if the memory is passed to any function
> (or macro) calls before the shown detection of a null pointer?

It seems both extremely unlikely and not relevant to the question at hand.
Passing E to another function will not change the value of E itself.
Passing &E to another function could change E, but it would be very
unusual to do that, and doesn't seem worth checking for.

julia
--8323329-429177205-1596352144=:2531--
