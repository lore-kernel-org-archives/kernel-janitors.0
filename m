From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 06 Jun 2020 07:46:27 +0000
Subject: Re: [PATCH] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.21.2006060944320.2578@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
In-Reply-To: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

> > +    E = \(kmalloc@kok\|kzalloc@kok\|krealloc@kok\|kcalloc@kok\|kmalloc_node@kok\|kzalloc_node@kok\|kmalloc_array@kok\|kmalloc_array_node@kok\|kcalloc_node@kok\)(...)
>
> I would prefer an other coding style here.
>
> * Items for such SmPL disjunctions can be specified also on multiple lines.
>
> * The semantic patch language supports further means to handle function name lists
>   in more convenient ways.
>   Would you like to work with customised constraints?

Please don't follow this advice.  Coccinelle is not able to optimize its
search process according to the information in constraints.  It will
needlessly parse many files.

julia
