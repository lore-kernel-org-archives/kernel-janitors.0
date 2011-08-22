From: Timur Tabi <timur@freescale.com>
Date: Mon, 22 Aug 2011 14:03:17 +0000
Subject: Re: [PATCH] sound/soc/fsl/fsl_dma.c: add missing of_node_put
Message-Id: <4E5261A5.5050608@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313825025-17590-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313825025-17590-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>

Julia Lawall wrote:
> diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
> index 0efc04a..b33271b 100644
> --- a/sound/soc/fsl/fsl_dma.c
> +++ b/sound/soc/fsl/fsl_dma.c
> @@ -880,10 +880,12 @@ static struct device_node *find_ssi_node(struct device_node *dma_channel_np)
>  		np = of_parse_phandle(ssi_np, "fsl,playback-dma", 0);
>  		if (np = dma_channel_np)
>  			return ssi_np;
> +		of_node_put(np);
>  
>  		np = of_parse_phandle(ssi_np, "fsl,capture-dma", 0);
>  		if (np = dma_channel_np)
>  			return ssi_np;
> +		of_node_put(np);
>  	}

Thanks for catching the problem, Julia, but the fix is not quite correct.  My
code assumes that of_parse_phandle() doesn't claim the node, but it doesn't
actually use the node pointer, either.  All I care about is whether 'np' is
equal to dma_channel_np.  I'm not going to use 'np'.  So I think the real fix is
this:

@@ -880,10 +880,12 @@ static struct device_node *find_ssi_node(struct
device_node *dma_channel_np)
 		np = of_parse_phandle(ssi_np, "fsl,playback-dma", 0);
+		of_node_put(np);
 		if (np = dma_channel_np)
 			return ssi_np;

 		np = of_parse_phandle(ssi_np, "fsl,capture-dma", 0);
+		of_node_put(np);
 		if (np = dma_channel_np)
 			return ssi_np;
 	}

 	return NULL;

-- 
Timur Tabi
Linux kernel developer at Freescale

