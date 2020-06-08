From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 08 Jun 2020 19:07:24 +0000
Subject: Re: [PATCH v2 4/4] coccinelle: api: add selfcheck for memdup_user rule
Message-Id: <d1034b7b-12f9-a4c7-868e-1579668eb73e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> Check that the rule matches vmemdup_user implementation.
> memdup_user is out of scope because we are not matching
> kmalloc_track_caller() function.

I find this change description improvable.
Will it become helpful (for example) to mention that you would like to
add another operation mode?


> +@finalize:python depends on selfcheck@
> +filtered << merge.filtered;
> +checked_files << merge.checked_files;
> +@@

Are we looking for better software documentation for such functionality?

Regards,
Markus
