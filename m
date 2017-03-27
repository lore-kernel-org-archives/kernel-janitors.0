From: Keyon Jie <yang.jie@linux.intel.com>
Date: Mon, 27 Mar 2017 09:41:29 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: intel: remove unused variable data and associated code
Message-Id: <58D8DE49.5030306@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170322143644.29051-1-colin.king@canonical.com>
In-Reply-To: <20170322143644.29051-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 2017年03月22日 22:36, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable 'data' is assigned null and never re-assigned. There
> is also a redundant check for data being non-null which is always
> false, so remove this and the variable data and dma_addr as they
> are not used once the dead code has been removed.
>
> Detected with CoverityScan, CID#1324015 ("'Constant' variable gaurds
> dead code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you for fixing it.

Acked-by: Jie Yang <yang.jie@intel.com>

thanks,
~Keyon

> ---
>   sound/soc/intel/haswell/sst-haswell-ipc.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
> index a3459d1682a6..d33bdaf92c57 100644
> --- a/sound/soc/intel/haswell/sst-haswell-ipc.c
> +++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
> @@ -2000,10 +2000,8 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
>   	u32 param_size, char *param)
>   {
>   	int ret;
> -	unsigned char *data = NULL;
>   	u32 header = 0;
>   	u32 payload_size = 0, transfer_parameter_size = 0;
> -	dma_addr_t dma_addr = 0;
>   	struct sst_hsw_transfer_parameter *parameter;
>   	struct device *dev = hsw->dev;
>
> @@ -2047,10 +2045,6 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
>
>   	kfree(parameter);
>
> -	if (data)
> -		dma_free_coherent(hsw->dsp->dma_dev,
> -			param_size, (void *)data, dma_addr);
> -
>   	return ret;
>   }
>
>
