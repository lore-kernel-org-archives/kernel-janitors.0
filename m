From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 09 Jun 2020 14:16:10 +0000
Subject: Re: [PATCH v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de>
In-Reply-To: <c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

…
> +++ b/scripts/coccinelle/api/memdup_user.cocci
> @@ -20,7 +20,9 @@ expression from,to,size;
…
> +-  to = \(kmalloc\|kzalloc\)
> +		(size,\(GFP_KERNEL\|GFP_USER\|
> +		      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));

I got the impression that this SmPL code needs another correction also
according to the proposed SmPL disjunction.

+-to = \( kmalloc \| kzalloc \) (size, \( GFP_KERNEL \| GFP_USER \) \( | __GFP_NOWARN \| \) );


Would you like to express by any other approach that a specific flag
is an optional source code transformation parameter?

Regards,
Markus
