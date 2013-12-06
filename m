From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 06 Dec 2013 13:08:08 +0000
Subject: Re: [patch] spi: bcm63xx-hsspi: checking for ERR_PTR instead of NULL
Message-Id: <CAOiHx=k87c_bFqFtJ7zJc9HxnjOEr2oMofNUsLkQbfQPrC04hQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131206125823.GA32369@elgon.mountain>
In-Reply-To: <20131206125823.GA32369-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Dec 6, 2013 at 1:58 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> devm_request_and_ioremap() returns NULL on error, it doesn't return an
> ERR_PTR().
>
> Fixes: 142168eba9dc ('spi: bcm63xx-hsspi: add bcm63xx HSSPI driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
> index bc8d848d33b7..da9f85d55c81 100644
> --- a/drivers/spi/spi-bcm63xx-hsspi.c
> +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> @@ -339,8 +339,8 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
>
>         res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         regs = devm_request_and_ioremap(dev, res_mem);
> -       if (IS_ERR(regs))
> -               return PTR_ERR(regs);
> +       if (!regs)
> +               return -EADDRNOTAVAIL;

Instead of fixing the wrong handling of the return value, let's change
it to use devm_ioremap_resource() which actually returns the expected
ERR_PTR() and is preferred over request_and_ioremap().


Regards
Jonas
