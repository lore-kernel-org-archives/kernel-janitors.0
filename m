From: "Wolf Entwicklungen" <Marcus.Wolf@Wolf-Entwicklungen.de>
Date: Thu, 20 Jul 2017 11:04:09 +0000
Subject: Re: [PATCH 2/3][staging-next] staging: pi433: Make functions rf69_set_bandwidth_intern static
Message-Id: <fe33e1df059d389d869ba929a60b4352-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhaW34HUVw=-webmailer1@server01.webmailer.webmailer.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
    <20170718130400.25436-2-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Reviewed-by: Marcus Wolf <linux@wolf-entwicklungen.de>

Am Di, 18.07.2017, 15:03 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The function rf69_set_bandwidth_intern is local to the source
> and do not need to be in global scope, so make it static. Also
> break overly wide line.
>
> Cleans up sparse warning:
> symbol 'update_share_count' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/pi433/rf69.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e391ce777bc7..04af906476e3 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -433,7 +433,8 @@ int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum dccPer
>  	return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
>  }
>
> -int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse mantisse, u8 exponent)
> +static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
> +				     enum mantisse mantisse, u8 exponent)
>  {
>  	u8 newValue;
>
> --
> 2.11.0
>
>
>

