From: Adrian Hunter <adrian.hunter@intel.com>
Date: Mon, 20 Apr 2020 06:08:39 +0000
Subject: Re: [PATCH][next] sdhci: arasan: fix uninitialized value being returned as error code
Message-Id: <49e93e7a-1f9e-ce5b-ca68-a088069ca2b0@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200417154901.112236-1-colin.king@canonical.com>
In-Reply-To: <20200417154901.112236-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Michal Simek <michal.simek@xilinx.com>, Ulf Hansson <ulf.hansson@linaro.org>, Manish Narani <manish.narani@xilinx.com>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/04/20 6:49 pm, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return value in variable ret is not being initialized
> and so a successful return path is returning a garbage value. Since ret
> is not being used the simple fix is just return 0 on a successful return.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: f73e66a36772 ("sdhci: arasan: Add support for Versal Tap Delays")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

>  drivers/mmc/host/sdhci-of-arasan.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index 16e26c217a77..45603ba515b2 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -735,7 +735,6 @@ static int sdhci_versal_sdcardclk_set_phase(struct clk_hw *hw, int degrees)
>  		container_of(clk_data, struct sdhci_arasan_data, clk_data);
>  	struct sdhci_host *host = sdhci_arasan->host;
>  	u8 tap_delay, tap_max = 0;
> -	int ret;
>  
>  	/*
>  	 * This is applicable for SDHCI_SPEC_300 and above
> @@ -781,7 +780,7 @@ static int sdhci_versal_sdcardclk_set_phase(struct clk_hw *hw, int degrees)
>  		sdhci_writel(host, regval, SDHCI_ARASAN_OTAPDLY_REGISTER);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct clk_ops versal_sdcardclk_ops = {
> @@ -807,7 +806,6 @@ static int sdhci_versal_sampleclk_set_phase(struct clk_hw *hw, int degrees)
>  		container_of(clk_data, struct sdhci_arasan_data, clk_data);
>  	struct sdhci_host *host = sdhci_arasan->host;
>  	u8 tap_delay, tap_max = 0;
> -	int ret;
>  
>  	/*
>  	 * This is applicable for SDHCI_SPEC_300 and above
> @@ -857,7 +855,7 @@ static int sdhci_versal_sampleclk_set_phase(struct clk_hw *hw, int degrees)
>  		sdhci_writel(host, regval, SDHCI_ARASAN_ITAPDLY_REGISTER);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct clk_ops versal_sampleclk_ops = {
> 
