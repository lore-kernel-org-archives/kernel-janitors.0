From: Dong Aisheng-B29396 <B29396@freescale.com>
Date: Sun, 21 Aug 2011 13:40:36 +0000
Subject: RE: [PATCH] sound/soc/mxs/mxs-saif.c: add missing kfree
Message-Id: <65EE16ACC360FA4D99C96DC085B3F772221437@039-SN1MPN1-001.039d.mgd.msft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313820761-12042-3-git-send-email-julia@diku.dk>
	<20110820134439.GA2266@pengutronix.de>
	<Pine.LNX.4.64.1108201718200.30651@ask.diku.dk>
	<65EE16ACC360FA4D99C96DC085B3F7722212DF@039-SN1MPN1-001.039d.mgd.msft.net>
	<Pine.LNX.4.64.1108211318060.4072@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1108211318060.4072@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfram Sang <w.sang@pengutronix.de>, Mark@alsa-project.org, Liam Girdwood <lrg@ti.com>

> -----Original Message-----
> From: Julia Lawall [mailto:julia@diku.dk]
> Sent: Sunday, August 21, 2011 7:19 PM
> To: Dong Aisheng-B29396
> Cc: Wolfram Sang; Liam Girdwood; kernel-janitors@vger.kernel.org; Mark
> Brown; Jaroslav Kysela; Takashi Iwai; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] sound/soc/mxs/mxs-saif.c: add missing kfree
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Move the test on pdev->id before the kzalloc to avoid requiring kfree
> when the test fails.  This fix was suggested by Wolfram Sang.
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
> if (...) { ... when != kfree(x)
>                when != x = E3
>                when != E3 = x
> *  return ...;
>  }
> ... when != x = E2
>     when != I(...,x,...) S
> if (...) { ... when != x = E4
>  kfree(x); ... return ...; }
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  sound/soc/mxs/mxs-saif.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c index
> 0b3adae..ab453ca 100644
> --- a/sound/soc/mxs/mxs-saif.c
> +++ b/sound/soc/mxs/mxs-saif.c
> @@ -519,12 +519,13 @@ static int mxs_saif_probe(struct platform_device
> *pdev)
>  	struct mxs_saif *saif;
>  	int ret = 0;
> 
> +	if (pdev->id >= ARRAY_SIZE(mxs_saif))
> +		return -EINVAL;
> +
>  	saif = kzalloc(sizeof(*saif), GFP_KERNEL);
>  	if (!saif)
>  		return -ENOMEM;
> 
> -	if (pdev->id >= ARRAY_SIZE(mxs_saif))
> -		return -EINVAL;
>  	mxs_saif[pdev->id] = saif;
> 
>  	saif->clk = clk_get(&pdev->dev, NULL);

Acked-by: Dong Aisheng <b29396@freescale.com>

Regards
Dong Aisheng

