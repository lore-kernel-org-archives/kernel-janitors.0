From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 12 Aug 2020 09:27:45 +0000
Subject: Re: [RFC PATCH] coccinelle: misc: add uninitialized_var.cocci script
Message-Id: <alpine.DEB.2.22.394.2008121127120.2572@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1b8537dd-8bf3-d3b6-4c10-af2fa623f1fe@web.de>
In-Reply-To: <1b8537dd-8bf3-d3b6-4c10-af2fa623f1fe@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Coccinelle <cocci@systeme.lip6.fr>



On Wed, 12 Aug 2020, Markus Elfring wrote:

> > +@r@
> > +identifier var;
> > +type T;
> > +position p;
> > +@@
> > +
> > +(
> > +* T var@p = var;
> > +|
> > +* T var@p = *(&(var));
>
> I suggest to simplify such code for the semantic patch language a bit.
> Can an other variant be more succinct for the application of a SmPL disjunction?
>
> +*T var@p = \( var \| *(&(var)) \);

It's fine as is.

julia
