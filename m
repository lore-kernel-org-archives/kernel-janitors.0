From: Cao Minh Hiep <cm-hiep@jinso.co.jp>
Date: Fri, 03 Apr 2015 09:44:33 +0000
Subject: Re: [patch] spi: signedness bug in qspi_trigger_transfer_out_int()
Message-Id: <551E6101.6060101@jinso.co.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150403084527.GA27292@mwanda>
In-Reply-To: <20150403084527.GA27292@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,
On 2015年04月03日 17:45, Dan Carpenter wrote:
> We need "ret" to be unsigned for the error handling to work.  The
> signedness of "i" and "n" don't matter but qspi_set_send_trigger()
> returns an int so I've changed them to int as well.
>
> Fixes: 4b6fe3edcbba ('spi: Using Trigger number to transmit/receive data')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index b3871d8..f6bac9e 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -727,7 +727,7 @@ static int rspi_rz_transfer_one(struct spi_master *master,
>   static int qspi_trigger_transfer_out_int(struct rspi_data *rspi, const u8 *tx,
>   					u8 *rx, unsigned int len)
>   {
> -	unsigned int i, n, ret;
> +	int i, n, ret;
>   	int error;
>   
>   	while (len > 0) {
>
>
Thanks for your patch!

Best Regards,
Hiep.
