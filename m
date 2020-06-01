From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 05:47:52 +0000
Subject: Re: [2/2] Coccinelle: memdup_user: Extending data processing for special tokens
Message-Id: <6cd81cb9-7fb6-bddc-65df-c3d50677ae7d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <02c75f13-ec79-f4c0-f28a-8a354ea1f6f0@web.de>
In-Reply-To: <02c75f13-ec79-f4c0-f28a-8a354ea1f6f0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Unfortunately, the Coccinelle software does not like the following
> SmPL code variant so far.
>
>  to =
> (
> -     \( kmalloc \| kzalloc \)
> +     memdup_user
> |
> -     \( kvmalloc \| kvzalloc \)
> +     vmemdup_user
> )
>                  (
> -                 size, \( GFP_KERNEL \| GFP_USER \)
> +                 from, size
>                  );
>
>
> Message:
> 25: no available token to attach to

I have adjusted a bit of OCaml source code.
Thus I could see where such information was provided.
https://github.com/coccinelle/coccinelle/blob/7cf2c23e64066d5249a64a316cc5347831f7a63f/parsing_cocci/insert_plus.ml#L1041

…
  | (((infop,count,pcode) as p) :: ps) as all ->
      (* …
	 modifications.  for the moment, we thus give an error, asking the
	 user to rewrite the semantic patch. *)
      if greater_than_end infop infom1 || is_minus m1 || !empty_isos
…


Will the referenced comment get any more software development attention?

Regards,
Markus
