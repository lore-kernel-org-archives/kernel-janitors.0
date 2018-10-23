From: Lubomir Rintel <lkundrak@v3.sk>
Date: Tue, 23 Oct 2018 14:25:11 +0000
Subject: Re: [PATCH] libertas: remove set but not used variable 'int_type'
Message-Id: <56d49bb6e62e3a7246bd839a349874908e6a9673.camel@v3.sk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539569795-176889-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539569795-176889-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2018-10-15 at 02:16 +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/marvell/libertas/if_spi.c: In function
> 'if_spi_h2c':
> drivers/net/wireless/marvell/libertas/if_spi.c:799:6: warning:
>  variable 'int_type' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in
> commit d2b21f191753 ("libertas: if_spi, driver for libertas GSPI
> devices")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks.

Tested-by: Lubomir Rintel <lkundrak@v3.sk>

> ---
>  drivers/net/wireless/marvell/libertas/if_spi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/marvell/libertas/if_spi.c
> b/drivers/net/wireless/marvell/libertas/if_spi.c
> index 504d6e0..7c3224b 100644
> --- a/drivers/net/wireless/marvell/libertas/if_spi.c
> +++ b/drivers/net/wireless/marvell/libertas/if_spi.c
> @@ -796,15 +796,13 @@ static void if_spi_h2c(struct if_spi_card
> *card,
>  {
>  	struct lbs_private *priv = card->priv;
>  	int err = 0;
> -	u16 int_type, port_reg;
> +	u16 port_reg;
>  
>  	switch (type) {
>  	case MVMS_DAT:
> -		int_type = IF_SPI_CIC_TX_DOWNLOAD_OVER;
>  		port_reg = IF_SPI_DATA_RDWRPORT_REG;
>  		break;
>  	case MVMS_CMD:
> -		int_type = IF_SPI_CIC_CMD_DOWNLOAD_OVER;
>  		port_reg = IF_SPI_CMD_RDWRPORT_REG;
>  		break;
>  	default:
> 
