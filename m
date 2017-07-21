From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Fri, 21 Jul 2017 10:17:38 +0000
Subject: Re: [PATCH] Make functions rf69_set_bandwidth_intern and rf69_set_dc_cut_off_frequency_intern static
Message-Id: <939686319.12802.1500632259005@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170720223324.8093-1-colin.king@canonical.com>
In-Reply-To: <20170720223324.8093-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org

Reviewed-by: Marcus Wolf <linux@wolf-entwicklungen.de>

Attention: This patch is nothing new, just a combination of Patch
[PATCH 2/3][staging-next] staging: pi433: Make functions
rf69_set_bandwidth_intern static
and
[PATCH 1/1][staging-next] staging: pi433: Make functions
rf69_set_dc_cut_off_frequency_intern static 


> Colin King <colin.king@canonical.com> hat am 21. Juli 2017 um 00:33
> geschrieben:
>
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The functions rf69_set_bandwidth_intern and also
> rf69_set_dc_cut_off_frequency_intern is local to the source and
> do not need to be in global scope, so make it static. Also break
> break overly wide line. Finally, remove the function declaration
> rf69_set_dc_cut_off_frequency_intern from the rf69.h header.
>
> Cleans up sparse warning:
> symbol 'update_share_count' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/staging/pi433/rf69.c | 7 +++++--
> drivers/staging/pi433/rf69.h | 1 -
> 2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e391ce777bc7..170e9cc59cde 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -400,7 +400,9 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
> }
> }
>
> -int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi ,u8 reg, enum
> dccPercent dccPercent)
> +static int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi,
> + u8 reg,
> + enum dccPercent dccPercent)
> {
> switch (dccPercent) {
> case dcc16Percent: return WRITE_REG(reg, ( (READ_REG(reg) & ~MASK_BW_DCC_FREQ)
> | BW_DCC_16_PERCENT) );
> @@ -433,7 +435,8 @@ int rf69_set_dc_cut_off_frequency_during_afc(struct
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
> diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
> index b81e0762032e..3fdf5d3d225b 100644
> --- a/drivers/staging/pi433/rf69.h
> +++ b/drivers/staging/pi433/rf69.h
> @@ -41,7 +41,6 @@ int rf69_set_pa_ramp(struct spi_device *spi, enum paRamp
> paRamp);
> int rf69_set_antenna_impedance(struct spi_device *spi, enum antennaImpedance
> antennaImpedance);
> int rf69_set_lna_gain(struct spi_device *spi, enum lnaGain lnaGain);
> enum lnaGain rf69_get_lna_gain(struct spi_device *spi);
> -int rf69_set_dc_cut_off_frequency_intern(struct spi_device *spi, u8 reg, enum
> dccPercent dccPercent);
> int rf69_set_dc_cut_off_frequency(struct spi_device *spi, enum dccPercent
> dccPercent);
> int rf69_set_dc_cut_off_frequency_during_afc(struct spi_device *spi, enum
> dccPercent dccPercent);
> int rf69_set_bandwidth(struct spi_device *spi, enum mantisse mantisse, u8
> exponent);
> --
> 2.11.0
>
>
