From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 06 Jun 2020 11:11:46 +0000
Subject: Re: coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.21.2006061307020.2578@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <99ed463c-b7ba-0400-7cf7-5bcc1992baef@web.de>
 <alpine.DEB.2.21.2006060944320.2578@hadrien>
 <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
In-Reply-To: <51a176d4-8c59-5da1-b4d2-c97b17b691a7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Sat, 6 Jun 2020, Markus Elfring wrote:

> >>> +    E = \(kmalloc@kok\|kzalloc@kok\|krealloc@kok\|kcalloc@kok\|kmalloc_node@kok\|kzalloc_node@kok\|kmalloc_array@kok\|kmalloc_array_node@kok\|kcalloc_node@kok\)(...)
> >>
> >> I would prefer an other coding style here.
> >>
> >> * Items for such SmPL disjunctions can be specified also on multiple lines.
> >>
> >> * The semantic patch language supports further means to handle function name lists
> >>   in more convenient ways.
> >>   Would you like to work with customised constraints?
> >
> > Please don't follow this advice.
>
> I have got recurring understanding difficulties with such a response.
> Will quoted patch review issues clarified in any other ways?
>
>
> > Coccinelle is not able to optimize its search process according to
> > the information in constraints.  It will needlessly parse many files.
>
> The software supports also SmPL constraints for some reasons.
> Why should such functionality be used at all if the immediate reminder is
> there seem to be more important optimisation aspects to consider before?

If the number of functions is really large, constraints may be a better
idea.

If the names of the functions are not actually known, constraints may be a
better idea.

If it is desired to collect some statistics about the matching process,
constraints allow that.

If it is desired to reason about values, for example that a constant is
greater or less than some value, then constraints allow that.

If it is desired to avoid changing code in a particular function, then
constraints allow that.

So there are a lot of reasons why constraints are useful.  There are
likely even more.  But hiding information that could be apparent to the
SmPL compiler and could be used to improve the performance of the matching
process is not one of them.

julia
