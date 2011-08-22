From: Timur Tabi <timur@freescale.com>
Date: Mon, 22 Aug 2011 13:55:28 +0000
Subject: Re: [PATCH 1/2] sound/soc/fsl/p1022_ds.c: add missing of_node_put
Message-Id: <4E525FD0.5020806@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313823721-16930-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313823721-16930-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Axel@alsa-project.org, Lin <axel.lin@gmail.com>, Liam Girdwood <lrg@ti.com>

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> dma_channel_np has been accessed at this point, so decrease its reference
> count before leaving the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier x;
> expression E1!=0,E2,E3,E4;
> statement S;
> iterator I;
> @@
>
> (
> if (...) { ... when != of_node_put(x)
>                when != x = E3
>                when != E3 = x
> *  return ...;
>  }
> ... when != x = E2
>     when != I(...,x,...) S
> if (...) { ... when != x = E4
>  of_node_put(x); ... return ...; }
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Timur Tabi <timur@freescale.com>

Thanks, Julia.

-- 
Timur Tabi
Linux kernel developer at Freescale

