From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 28 Dec 2015 09:20:10 +0000
Subject: Re: [PATCH] [media] tuners: One check less in m88rs6000t_get_rf_strength() after error detection
Message-Id: <alpine.DEB.2.10.1512281019050.2702@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <5680FDB3.7060305@users.sourceforge.net>
In-Reply-To: <5680FDB3.7060305@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 28 Dec 2015, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 28 Dec 2015 10:10:34 +0100
>
> This issue was detected by using the Coccinelle software.
>
> Move the jump label directly before the desired log statement
> so that the variable "ret" will not be checked once more
> after it was determined that a function call failed.

Why not avoid both unnecessary ifs and the enormous ugliness of a label
inside an if by making two returns: a return 0 for success and a dev_dbg
and return ret for failure?

julia


> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/media/tuners/m88rs6000t.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88rs6000t.c
> index 504bfbc..b45594e 100644
> --- a/drivers/media/tuners/m88rs6000t.c
> +++ b/drivers/media/tuners/m88rs6000t.c
> @@ -510,27 +510,27 @@ static int m88rs6000t_get_rf_strength(struct dvb_frontend *fe, u16 *strength)
>
>  	ret = regmap_read(dev->regmap, 0x5A, &val);
>  	if (ret)
> -		goto err;
> +		goto report_failure;
>  	RF_GC = val & 0x0f;
>
>  	ret = regmap_read(dev->regmap, 0x5F, &val);
>  	if (ret)
> -		goto err;
> +		goto report_failure;
>  	IF_GC = val & 0x0f;
>
>  	ret = regmap_read(dev->regmap, 0x3F, &val);
>  	if (ret)
> -		goto err;
> +		goto report_failure;
>  	TIA_GC = (val >> 4) & 0x07;
>
>  	ret = regmap_read(dev->regmap, 0x77, &val);
>  	if (ret)
> -		goto err;
> +		goto report_failure;
>  	BB_GC = (val >> 4) & 0x0f;
>
>  	ret = regmap_read(dev->regmap, 0x76, &val);
>  	if (ret)
> -		goto err;
> +		goto report_failure;
>  	PGA2_GC = val & 0x3f;
>  	PGA2_cri = PGA2_GC >> 2;
>  	PGA2_crf = PGA2_GC & 0x03;
> @@ -562,9 +562,11 @@ static int m88rs6000t_get_rf_strength(struct dvb_frontend *fe, u16 *strength)
>  	/* scale value to 0x0000-0xffff */
>  	gain = clamp_val(gain, 1000U, 10500U);
>  	*strength = (10500 - gain) * 0xffff / (10500 - 1000);
> -err:
> -	if (ret)
> +
> +	if (ret) {
> +report_failure:
>  		dev_dbg(&dev->client->dev, "failed=%d\n", ret);
> +	}
>  	return ret;
>  }
>
> --
> 2.6.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
