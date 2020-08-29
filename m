From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 29 Aug 2020 13:09:57 +0000
Subject: Re: [Cocci] [RFC PATCH] coccinelle: api: add flex_array_size.cocci script
Message-Id: <alpine.DEB.2.22.394.2008291507400.3629@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b131add2-f494-d129-f83f-ef2c6de7a849@web.de>
In-Reply-To: <b131add2-f494-d129-f83f-ef2c6de7a849@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Sat, 29 Aug 2020, Markus Elfring wrote:

> > Suggest flex_array_size() wrapper to compute the size of a
> > flexible array member in a structure. The macro additionally
> > checks for integer overflows.
>
> Can the following script variant for the semantic patch language help
> to clarify any software development ideas and remaining open issues?

A patch proposal needs to say what it is doing and why.  You haven't
provided either information.

What changes have you made as compared to the original proposal, and why
have you made them?  Removing newlines and adding spaces, as done in
decl_flex, is not something I am interested in.

julia

>
>
> virtual context, patch, report, org
>
> @decl_flex@
> identifier name, array, size;
> type TA, TS;
> @@
>  struct name {
>  ...
>  TS size;
>  ...
> (TA array[];
> |TA array[ \( 0 \| 1 \) ];
> )
>  };
>
> @ptr_flex@
> identifier decl_flex.name, instance;
> @@
>  struct name *instance;
>
> @struct_flex@
> identifier decl_flex.name, instance;
> @@
>  struct name instance;
>
> @ptr_flex_size depends on !patch@
> identifier decl_flex.array, decl_flex.size, ptr_flex.instance;
> type decl_flex.TA;
> position p;
> @@
> *instance->size *@p \( sizeof(TA) \| sizeof(*instance->array) \)
>
> @depends on patch exists@
> identifier decl_flex.array, decl_flex.size, ptr_flex.instance;
> type decl_flex.TA;
> @@
> (
> -sizeof(TA)
> |
> -sizeof(*instance->array)
> )
> - *
> +flex_array_size(instance, array,
>  instance->size
> +)
>
> @struct_flex_size depends on !patch@
> identifier decl_flex.array, decl_flex.size, struct_flex.instance;
> type decl_flex.TA;
> position p;
> @@
> *instance->size *@p \( sizeof(TA) \| sizeof(*instance->array) \)
>
> @depends on patch exists@
> identifier decl_flex.array, decl_flex.size, struct_flex.instance;
> type decl_flex.TA;
> @@
> (
> -sizeof(TA)
> |
> -sizeof(*instance->array)
> )
> - *
> +flex_array_size(instance, array,
>  instance->size
> +)
>
> @func_arg_flex_size depends on !patch@
> identifier decl_flex.name, decl_flex.array, decl_flex.size, func, instance;
> type decl_flex.TA;
> position p;
> @@
>  func(..., struct name *instance, ...) {
>  ... when any
> *instance->size *@p \( sizeof(TA) \| sizeof(*instance->array) \)
>  ...
>  }
>
> @depends on patch exists@
> identifier decl_flex.name, decl_flex.array, decl_flex.size, func, instance;
> type decl_flex.TA;
> @@
>  func(..., struct name *instance, ...) {
>  ... when any
> (
> -sizeof(TA)
> |
> -sizeof(*instance->array)
> )
> - *
> +flex_array_size(instance, array,
>  instance->size
> +)
>  ...
>  }
>
> @script:python depends on report@
> p << ptr_flex_size.p;
> @@
> coccilib.report.print_report(p[0], "WARNING opportunity for flex_array_size")
>
> @script:python depends on org@
> p << ptr_flex_size.p;
> @@
> coccilib.org.print_todo(p[0], "WARNING opportunity for flex_array_size")
>
> @script:python depends on report@
> p << struct_flex_size.p;
> @@
> coccilib.report.print_report(p[0], "WARNING opportunity for flex_array_size")
>
> @script:python depends on org@
> p << struct_flex_size.p;
> @@
> coccilib.org.print_todo(p[0], "WARNING opportunity for flex_array_size")
>
> @script:python depends on report@
> p << func_arg_flex_size.p;
> @@
> coccilib.report.print_report(p[0], "WARNING opportunity for flex_array_size")
>
> @script:python depends on org@
> p << func_arg_flex_size.p;
> @@
> coccilib.org.print_todo(p[0], "WARNING opportunity for flex_array_size")
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
