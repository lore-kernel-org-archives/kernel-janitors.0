From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 Nov 2019 19:39:26 +0000
Subject: Re: [PATCH] Coccinelle: zalloc-simple: Adjust a message construction
Message-Id: <alpine.DEB.2.21.1911032039150.2557@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <042136cf-4e58-02bd-4d49-5d5055f22c65@web.de>
In-Reply-To: <042136cf-4e58-02bd-4d49-5d5055f22c65@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Thomas Gleixner <tglx@linutronix.de>, cocci@systeme.lip6.fr



On Sun, 3 Nov 2019, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 3 Nov 2019 20:00:30 +0100
>
> * Simplify a message construction in a Python script rule
>   for the semantic patch language.

The benefit is what?

julia

>
> * Delete also a duplicate space character then.
>
> Fixes: dfd32cad146e3624970eee9329e99d2c6ef751b3 ("dma-mapping: remove dma_zalloc_coherent()")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  scripts/coccinelle/api/alloc/zalloc-simple.cocci | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/coccinelle/api/alloc/zalloc-simple.cocci b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
> index 26cda3f48f01..c14eae1f3010 100644
> --- a/scripts/coccinelle/api/alloc/zalloc-simple.cocci
> +++ b/scripts/coccinelle/api/alloc/zalloc-simple.cocci
> @@ -217,8 +217,10 @@ p << r2.p;
>  x << r2.x;
>  @@
>
> -msg="WARNING: dma_alloc_coherent use in %s already zeroes out memory,  so memset is not needed" % (x)
> -coccilib.report.print_report(p[0], msg)
> +coccilib.report.print_report(p[0],
> +                             "WARNING: dma_alloc_coherent use in "
> +                             + x
> +                             + " already zeroes out memory. Thus memset is not needed.")
>
>  //-----------------------------------------------------------------
>  @r3 depends on org || report@
> --
> 2.23.0
>
>
