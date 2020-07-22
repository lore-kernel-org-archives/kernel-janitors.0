From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 22 Jul 2020 06:02:37 +0000
Subject: Re: [PATCH v3 2/3] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <alpine.DEB.2.22.394.2007220801590.2918@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-416411769-1595397758=:2918"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
 <alpine.DEB.2.22.394.2007211158310.2487@hadrien>
 <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
In-Reply-To: <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-416411769-1595397758=:2918
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Wed, 22 Jul 2020, Markus Elfring wrote:

> >>> +@depends on patch@
> >>> +expression from,to,size;
> >>> +identifier l1,l2;
> >>> +@@
> >>> +
> >>> +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> >>> ++  to = vmemdup_user(from,size);
> >>
> >> I propose to combine the desired adjustment with the previous SmPL rule
> >> by using another disjunction.
>
> How do you think about to check run time characteristics for
> the following SmPL script sketches?
>
> A)
> @R1@
> @@
> // Change something
>
> @R2@
> @@
> // Change another thing
>
>
> B)
> @Replacement_with_disjunction@
> @@
> (
> // R1: Change something
> |
> // R2: Change another thing
> )

Markus, you are welcome to try this since you are concerned about it.
But it doesn't matter.

julia

>
>
> >>> +@rv depends on !patch@
> >>> +expression from,to,size;
> >>> +position p;
> >>> +statement S1,S2;
> >>> +@@
> >>> +
> >>> +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> >>> +   if (to==NULL || ...) S1
> >>> +   if (copy_from_user(to, from, size) != 0)
> >>> +   S2
> >>
> >> * Can it be helpful to omit the SmPL asterisk functionality from
> >>   the operation modes “org” and “report”?
> >>
> >> * Should the operation mode “context” work without an extra position metavariable?
> >
> > This is fine as is in all three aspects.
>
> Is every technique from the Coccinelle software required for
> each operation mode in such data processing approaches?
>
> Regards,
> Markus
>
--8323329-416411769-1595397758=:2918--
