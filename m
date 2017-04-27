From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 27 Apr 2017 22:36:46 +0000
Subject: Re: [PATCH] ASoC: Intel: Skylake: uninitialized variable in error message
Message-Id: <d8a7c10a-de78-7d26-0e86-85c488ad41b5@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427185002.r4yv2uuex6t7jz2m@mwanda>
In-Reply-To: <20170427185002.r4yv2uuex6t7jz2m@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, G Kranthi <gudishax.kranthikumar@intel.com>
Cc: alsa-devel@alsa-project.org, Vinod Koul <vinod.koul@intel.com>, Jayachandran B <jayachandran.b@intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Ramesh Babu <ramesh.babu@intel.com>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>

Hi,

On Apr 28 2017 03:50, Dan Carpenter wrote:
> "skl" hasn't been initialized yet, so we can't dereference it.
> 
> Fixes: 9fe9c7119283 ("ASoC: Intel: Skylake: Move sst common initialization to a helper function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
> index fde4bc0f35b0..f5e7dbb1ba39 100644
> --- a/sound/soc/intel/skylake/bxt-sst.c
> +++ b/sound/soc/intel/skylake/bxt-sst.c
> @@ -564,7 +564,7 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
>  
>  	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp_ops, dsp, &skl_dev);
>  	if (ret < 0) {
> -		dev_err(skl->dev, "%s: no device\n", __func__);
> +		dev_err(dev, "%s: no device\n", __func__);
>  		return ret;
>  	}

Thanks for posting this patch, however Vinod already posted the same
fix. Please wait for merging it and verify again:

[alsa-devel] [PATCH 1/3] ASoC: Intel: Skylake: Fix uninitialized pointer
usage
http://mailman.alsa-project.org/pipermail/alsa-devel/2017-April/120214.html


Regards

Takashi Sakamoto
