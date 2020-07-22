From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 22 Jul 2020 06:24:22 +0000
Subject: Re: [v3 2/3] coccinelle: api: extend memdup_user rule with vmemdup_user()
Message-Id: <alpine.DEB.2.22.394.2007220823050.2918@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
 <alpine.DEB.2.22.394.2007211158310.2487@hadrien>
 <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
 <alpine.DEB.2.22.394.2007220801590.2918@hadrien>
 <07a06754-94dd-60b1-1ad1-9e602c86b1f8@web.de>
In-Reply-To: <07a06754-94dd-60b1-1ad1-9e602c86b1f8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Wed, 22 Jul 2020, Markus Elfring wrote:

> > Markus, you are welcome to try this since you are concerned about it.
>
> I dare to point software design variations for some reasons.
>
>
> > But it doesn't matter.
>
> Under which circumstances would you begin to care more for involved differences
> in corresponding run time characteristics?

When the difference is hours vs seconds.  In this case, there are
tradeoffs between the two options, andI don't know which would be faster,
but I think it is extremely unlikely that the difference is noticible.
But if you are concerned about it, you are welcome to try.

julia
