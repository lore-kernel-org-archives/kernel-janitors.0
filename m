From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 08 Jun 2020 18:36:31 +0000
Subject: Re: [PATCH v2 2/4] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <alpine.DEB.2.21.2006082035580.3136@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1412814973-1591641392=:3136"
List-Id: <kernel-janitors.vger.kernel.org>
References: <6c9c6a4c-c305-ddab-8a1b-e4dc448d643f@web.de>
In-Reply-To: <6c9c6a4c-c305-ddab-8a1b-e4dc448d643f@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1412814973-1591641392=:3136
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 8 Jun 2020, Markus Elfring wrote:

> …
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -39,6 +39,28 @@ …
> …
> > +@depends on patch@
> > +expression from,to,size;
> > +identifier l1,l2;
> > +@@
> > +
> > +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> > ++  to = vmemdup_user(from,size);
>
> I suggest to combine the desired adjustment with the previous SmPL rule
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
> How does the SmPL asterisk functionality fit to the operation
> modes “org” and “report”?

Make coccicheck uses --no-show-diff for org and report modes, so the * has
no effect in those cases.

julia
--8323329-1412814973-1591641392=:3136--
