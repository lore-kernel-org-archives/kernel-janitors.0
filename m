From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 10 Feb 2020 14:09:26 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: mrfld: return error codes when an error occurs
Message-Id: <96b4d153-2ee5-ea88-7176-a2d9ebf19982@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208220720.36657-1-colin.king@canonical.com>
In-Reply-To: <20200208220720.36657-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 2/8/20 4:07 PM, Colin King wrote:
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

Yes, it's clearly bad.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I don't think this impacts anyone though, the code can only be used for 
Merrifield/Tangier.

> ---
>   sound/soc/intel/atom/sst/sst_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
> index d952719bc098..5862fe968083 100644
> --- a/sound/soc/intel/atom/sst/sst_pci.c
> +++ b/sound/soc/intel/atom/sst/sst_pci.c
> @@ -99,7 +99,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
>   	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
>   do_release_regions:
>   	pci_release_regions(pci);
> -	return 0;
> +	return ret;
>   }
>   
>   /*
> 
