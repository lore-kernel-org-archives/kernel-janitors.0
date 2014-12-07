From: Grant Grundler <grantgrundler@gmail.com>
Date: Sun, 07 Dec 2014 20:34:55 +0000
Subject: Re: [PATCH 4/20] dmfe: fix misspelling of current function in string
Message-Id: <CAP6odjj817U+etx-BLCOT9DFQDKS8Mhu=e3hmqR4-N-XHatXvw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
	<1417980062-25151-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Grant Grundler <grundler@parisc-linux.org>, kernel-janitors@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com, "open list:TULIP NETWORK DRI..." <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sun, Dec 7, 2014 at 11:20 AM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> The function name contains cleanup, not clean.
>
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks - seems like a obvious mistake.

Acked-by: Grant Grundler <grundler@parisc-linux.org>

>
> ---
> The semantic patch is difficult to summarize, but is available in the cover
> letter of this patch series.
>
>  drivers/net/ethernet/dec/tulip/dmfe.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
> index c820560..50a0077 100644
> --- a/drivers/net/ethernet/dec/tulip/dmfe.c
> +++ b/drivers/net/ethernet/dec/tulip/dmfe.c
> @@ -2265,7 +2265,7 @@ static int __init dmfe_init_module(void)
>
>  static void __exit dmfe_cleanup_module(void)
>  {
> -       DMFE_DBUG(0, "dmfe_clean_module() ", debug);
> +       DMFE_DBUG(0, "dmfe_cleanup_module() ", debug);
>         pci_unregister_driver(&dmfe_driver);
>  }
>
>
