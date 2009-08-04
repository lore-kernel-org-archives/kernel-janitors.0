From: Tejun Heo <tj@kernel.org>
Date: Tue, 04 Aug 2009 04:49:16 +0000
Subject: Re: [PATCH 9/10] drivers/ata: introduce missing kfree
Message-Id: <4A77BDCC.1070502@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908011055050.23408@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908011055050.23408@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jgarzik@pobox.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, geomatsi@gmail.com

Julia Lawall wrote:
...
> ---
>  drivers/ata/pata_at91.c             |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/ata/pata_at91.c b/drivers/ata/pata_at91.c
> index 5702aff..46fb883 100644
> --- a/drivers/ata/pata_at91.c
> +++ b/drivers/ata/pata_at91.c
> @@ -261,7 +261,8 @@ static int __devinit pata_at91_probe(struct platform_device *pdev)
>  
>  	if (IS_ERR(info->mck)) {
>  		dev_err(dev, "failed to get access to mck clock\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto err_clk_get;
>  	}
>  
>  	info->cs    = board->chipselect;
> @@ -308,6 +309,7 @@ err_alt_ioremap:
>  
>  err_ide_ioremap:
>  	clk_put(info->mck);
> +err_clk_get:
>  	kfree(info);

cc'ing Matyukevich Sergey.  Matyukevich, is it possible to use
devm_kzalloc() instead?

Thanks.

-- 
tejun
