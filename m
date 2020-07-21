From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 21 Jul 2020 09:58:55 +0000
Subject: Re: [PATCH v3 2/3] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <alpine.DEB.2.22.394.2007211158310.2487@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-577759684-1595325535=:2487"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
In-Reply-To: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-577759684-1595325535=:2487
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 21 Jul 2020, Markus Elfring wrote:

> …
> > +++ b/scripts/coccinelle/api/memdup_user.cocci
> > @@ -39,6 +39,28 @@ …
> …
> > +@depends on patch@
> > +expression from,to,size;
> > +identifier l1,l2;
> > +@@
> > +
> > +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> > ++  to = vmemdup_user(from,size);
>
> I propose to combine the desired adjustment with the previous SmPL rule
> by using another disjunction.
>
>
> > +@rv depends on !patch@
> > +expression from,to,size;
> > +position p;
> > +statement S1,S2;
> > +@@
> > +
> > +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> > +   if (to==NULL || ...) S1
> > +   if (copy_from_user(to, from, size) != 0)
> > +   S2
>
> * Can it be helpful to omit the SmPL asterisk functionality from
>   the operation modes “org” and “report”?
>
> * Should the operation mode “context” work without an extra position metavariable?

This is fine as is in all three aspects.

julia
--8323329-577759684-1595325535=:2487--
