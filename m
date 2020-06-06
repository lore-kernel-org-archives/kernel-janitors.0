From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 06 Jun 2020 14:39:13 +0000
Subject: Re: [PATCH] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.21.2006061634130.19534@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1629768455-1591454354=:19534"
List-Id: <kernel-janitors.vger.kernel.org>
References: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
In-Reply-To: <119d91fd-1ad0-8842-10eb-ee8fa16da1b0@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1629768455-1591454354=:19534
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 6 Jun 2020, Markus Elfring wrote:

> > +@choice@
> > +expression E, E1;
> > +position kok, vok;
> > +@@
> > +
> > +(
> > +  if (...) {
> > +    ...
> > +    E = \(kmalloc@kok\|…\)(...)
>
> Further implementation details from this SmPL script caught my software
> development attention.
>
> * Is there a need to add the specification “when any” to the SmPL ellipses
>   before such assignment statements?

Having multiple assignments to kmalloc in one if seems unlikely, and
perhaps one would want to think about such a case differently, so it seems
ok as is.

>
> * A limited search approach was expressed. Will additional source code variations
>   become relevant?
>   + switch statement
>   + if branches with single statements
>   + conditional operator

The point is that there is a kmalloc in one branch and a vmalloc in
another branch, so a if with a single branch doesn't seem relevant.

The other cases sem highly improbable.

>
> > +@opportunity depends on !patch …@
> …
> > +  E = \(kmalloc\|…\)(..., size, ...)
> > +  ... when != E = E1
> > +      when != size = E1
>
> I wonder that two assignments should be excluded here according to
> the same expression metavariable.

Doesn't matter.  The metavariables are considered separately in the
different whens.

>
> +@pkfree depends on patch exists@
> …
> +- \(kfree\|kvfree\)(E)
> ++ vfree(E)
>
> Would you like to use a SmPL code variant like the following
> at any more places?
> (Is it occasionally helpful to increase the change precision?)
>
> +-\(kfree\|kvfree\)
> ++vfree
> +      (E)

"increase the change precision" seems to be an obscure way to say "improve
the formatting".  Indeed, leaving (E) as is would have the effect of not
changing the formatting.  But the problem seems unlikely for a functoin
with such a short name.  And this presentation will likely run afoul of
the fact that you can't attach + code to a disjunction.  So the original
presentation was more concise, and should be fine in practice.

julia
--8323329-1629768455-1591454354=:19534--
