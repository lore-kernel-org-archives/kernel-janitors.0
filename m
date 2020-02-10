From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Feb 2020 08:49:55 +0000
Subject: Re: [PATCH] ASoC: Intel: mrfld: return error codes when an error occurs
Message-Id: <20200210084955.GY1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208220720.36657-1-colin.king@canonical.com>
In-Reply-To: <20200208220720.36657-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Vinod Koul <vkoul@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, linux-kernel@vger.kernel.org

On Sat, Feb 08, 2020 at 10:07:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently function sst_platform_get_resources always returns zero and
> error return codes set by the function are never returned. Fix this
> by returning the error return code in variable ret rather than the
> hard coded zero.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: f533a035e4da ("ASoC: Intel: mrfld - create separate module for pci part")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/intel/atom/sst/sst_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
> index d952719bc098..5862fe968083 100644
> --- a/sound/soc/intel/atom/sst/sst_pci.c
> +++ b/sound/soc/intel/atom/sst/sst_pci.c
> @@ -99,7 +99,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>  	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
>  do_release_regions:
>  	pci_release_regions(pci);

It's weird that we release the regions on the success path.

regards,
dan carpenter

> -	return 0;
> +	return ret;
>  }
