From: Jeff Garzik <jgarzik@pobox.com>
Date: Wed, 15 Jul 2009 02:43:58 +0000
Subject: Re: [PATCH 1/5] drivers/ata: Move a dereference below a NULL test
Message-Id: <4A5D426E.90308@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907110949280.29592@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907110949280.29592@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test is necessary, then the dereference should be moved below
> the NULL test.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> type T;
> expression E;
> identifier i,fld;
> statement S;
> @@
> 
> - T i = E->fld;
> + T i;
>   ... when != E
>       when != i
>   if (E = NULL) S
> + i = E->fld;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/ata/pata_at91.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff -u -p a/drivers/ata/pata_at91.c b/drivers/ata/pata_at91.c
> --- a/drivers/ata/pata_at91.c
> +++ b/drivers/ata/pata_at91.c
> @@ -312,11 +312,12 @@ err_ide_ioremap:
>  static int __devexit pata_at91_remove(struct platform_device *pdev)
>  {
>  	struct ata_host *host = dev_get_drvdata(&pdev->dev);
> -	struct at91_ide_info *info = host->private_data;
> +	struct at91_ide_info *info;
>  	struct device *dev = &pdev->dev;
>  
>  	if (!host)
>  		return 0;
> +	info = host->private_data;
>  

applied


