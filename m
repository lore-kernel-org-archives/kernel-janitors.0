From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 16 Dec 2015 14:56:00 +0000
Subject: Re: [patch] ASoC: Intel: Skylake: Fix a couple signedness bugs
Message-Id: <20151216144400.GN1854@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151212123815.GA21408@mwanda>
In-Reply-To: <20151212123815.GA21408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Dharageswari R <dharageswari.r@intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeeja KP <jeeja.kp@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2015 at 03:38:15PM +0300, Dan Carpenter wrote:
> These need to be unsigned because they hold negative error codes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Vinod Koul <vinod.koul@intel.com>

> 
> diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
> index 8cd5cdb..e26f474 100644
> --- a/sound/soc/intel/skylake/skl-sst.c
> +++ b/sound/soc/intel/skylake/skl-sst.c
> @@ -208,7 +208,7 @@ static unsigned int skl_get_errorcode(struct sst_dsp *ctx)
>   * since get/set_module are called from DAPM context,
>   * we don't need lock for usage count
>   */
> -static unsigned int skl_get_module(struct sst_dsp *ctx, u16 mod_id)
> +static int skl_get_module(struct sst_dsp *ctx, u16 mod_id)
>  {
>  	struct skl_module_table *module;
>  
> @@ -220,7 +220,7 @@ static unsigned int skl_get_module(struct sst_dsp *ctx, u16 mod_id)
>  	return -EINVAL;
>  }
>  
> -static unsigned int skl_put_module(struct sst_dsp *ctx, u16 mod_id)
> +static int skl_put_module(struct sst_dsp *ctx, u16 mod_id)
>  {
>  	struct skl_module_table *module;
>  
> @@ -340,7 +340,7 @@ static int skl_load_module(struct sst_dsp *ctx, u16 mod_id, char *guid)
>  
>  static int skl_unload_module(struct sst_dsp *ctx, u16 mod_id)
>  {
> -	unsigned int usage_cnt;
> +	int usage_cnt;
>  	struct skl_sst *skl = ctx->thread_context;
>  	int ret = 0;
>  
> 

-- 
~Vinod
