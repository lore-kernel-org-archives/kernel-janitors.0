From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 24 Sep 2020 14:32:30 +0000
Subject: Re: [Cocci] [PATCH] coccinelle: iterators: Add for_each_child.cocci script
Message-Id: <alpine.DEB.2.22.394.2009241631310.2615@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <67ad40bd-c0c0-8c5c-54b2-c750cfeefd44@web.de>
In-Reply-To: <67ad40bd-c0c0-8c5c-54b2-c750cfeefd44@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Thu, 24 Sep 2020, Markus Elfring wrote:

> > +@ruletwo depends on patch && !context && !org && !report@
>
> How do you think about to combine code from two SmPL rules
> by using another SmPL disjunction like the following?

What is the goal of doing this?

It seems substantially harder to understand than three rules that each
take care of a specific case.

julia


>
> @addition_rule depends on patch && !context && !org && !report@
> local idexpression r.n;
> expression e,e1;
> expression list [r.n1] es;
> iterator r.i,i1,i2;
> statement S,S2;
> @@
> (
>  i(es,n,...) {
>  ...
> (of_node_put(n);
> |e = n
> |return n;
> |i1(...,n,...) S
> |
> +of_node_put(n);
> ?return ...;
> )
>  ... when any
>  }
> |
>  i(es,n,...) {
>  ...
> (of_node_put(n);
> |e = n
> |i1(...,n,...) S
> |
> +of_node_put(n);
> ?break;
> )
>  ... when any
>  }
>  ... when != n
>      when strict
> (n = e1;
> |
> ?i2(...,n,...) S2
> )
> )
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
