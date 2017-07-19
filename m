From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Wed, 19 Jul 2017 19:52:16 +0000
Subject: Re: [PATCH 2/3][staging-next] staging: pi433: Make functions rf69_set_bandwidth_intern static
Message-Id: <1045274239.111522.1500493937059@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
 <20170718130400.25436-2-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,
 
thanks for your patches.
 
#1 is fine. Same fix was provided by Joseph Wright. I tested it and it works
fine.
#2 looks fine, too.
 
Conerning #3, I would suggest to declare rf69_set_dc_cut_off_frequency static,
as well. Would you prefer to remove rf69_set_dc_cut_off_frequency from the
header (rf69.h) or would you prefer to add a static there?
If you prefer to keep the line in the header, we should spend a line for
rf69_set_bandwidth_intern in the header, too.
 
Again thank you :-)
 
Marcus
 

> Colin King <colin.king@canonical.com> hat am 18. Juli 2017 um 15:03
> geschrieben:
>
>
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
> drivers/staging/pi433/rf69.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e391ce777bc7..04af906476e3 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -433,7 +433,8 @@ int rf69_set_dc_cut_off_frequency_during_afc(struct
> spi_device *spi, enum dccPer
> return rf69_set_dc_cut_off_frequency_intern(spi, REG_AFCBW, dccPercent);
> }
>
> -int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg, enum mantisse
> mantisse, u8 exponent)
> +static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
> + enum mantisse mantisse, u8 exponent)
> {
> u8 newValue;
>
> --
> 2.11.0
>
>
