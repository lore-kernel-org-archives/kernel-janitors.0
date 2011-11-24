From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 24 Nov 2011 12:08:07 +0000
Subject: Re: [patch] ALSA: hda - cut and paste typo in cs420x_models[]
Message-Id: <s5hty5tena0.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111124114824.GC32522@elgon.mountain>
In-Reply-To: <20111124114824.GC32522@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, kernel-janitors@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Henningsson <david.henningsson@canonical.com>, Tim Howe <tim.howe@cirrus.com>

At Thu, 24 Nov 2011 14:48:24 +0300,
Dan Carpenter wrote:
> 
> The CS420X_IMAC27 was copied from the line before but CS420X_APPLE
> was clearly intented.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks!


Takashi

> 
> diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
> index 7bd2a52..70a7abd 100644
> --- a/sound/pci/hda/patch_cirrus.c
> +++ b/sound/pci/hda/patch_cirrus.c
> @@ -1278,7 +1278,7 @@ static const char * const cs420x_models[CS420X_MODELS] = {
>  	[CS420X_MBP53] = "mbp53",
>  	[CS420X_MBP55] = "mbp55",
>  	[CS420X_IMAC27] = "imac27",
> -	[CS420X_IMAC27] = "apple",
> +	[CS420X_APPLE] = "apple",
>  	[CS420X_AUTO] = "auto",
>  };
>  
> 
