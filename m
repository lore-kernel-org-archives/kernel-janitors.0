From: Joe Perches <joe@perches.com>
Date: Fri, 11 Aug 2017 14:44:31 +0000
Subject: Re: [PATCH] ASoC: Freescale: Delete an error message for a failed memory allocation in three functio
Message-Id: <1502462671.3099.13.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <671f4a88-bee9-85b4-ea9b-68abcdb40443@users.sourceforge.net>
In-Reply-To: <671f4a88-bee9-85b4-ea9b-68abcdb40443@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Fabio Estevam <fabio.estevam@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@tabi.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2017-08-11 at 15:32 +0200, SF Markus Elfring wrote:
> From 885ccd6c63291dcd4854a0cbaab5188cdc3db805 Mon Sep 17 00:00:00 2001
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 11 Aug 2017 15:10:43 +0200
> Subject: [PATCH] ASoC: Freescale: Delete an error message for a failed memory allocation in three functions
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

This doesn't have anything to do with refactoring strings.

Just note that allocations without GFP_NOWARN do a dump_stack()

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
[]
> @@ -282,7 +282,5 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
> -	if (!pair) {
> -		dev_err(dev, "failed to allocate pair\n");
> +	if (!pair)
>  		return -ENOMEM;
> -	}

Use normal diff output that shows 3 lines of context
above and below the patched lines.
