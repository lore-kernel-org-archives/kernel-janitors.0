From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 14 Nov 2019 13:22:56 +0000
Subject: Re: [PATCH][next] reset: npcm: check for NULL return from syscon_regmap_lookup_by_compat
Message-Id: <ea47e8e7a8663d33acb44dd4473a5a150ea51526.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191108155524.170566-1-colin.king@canonical.com>
In-Reply-To: <20191108155524.170566-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Fri, 2019-11-08 at 15:55 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function syscon_regmap_lookup_by_compat can return a NULL pointer, so

Could you point out where that NULL pointer would come from? As far as I
understand, syscon_regmap_lookup_by_compatible() should either return a
negative error code, or syscon->regmap, which should never be NULL.

> the IS_ERR check on the return is incorrect. Fix this by checking for
> IS_ERR_OR_NULL and return -ENODEV if true.  This avoids a null pointer
> dereference on gcr_regmap later on.
> 
> Addresses-Coverity: ("Dereference null return (stat)")
> Fixes: b3f1d036f26d ("reset: npcm: add NPCM reset controller driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/reset/reset-npcm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> index 2ea4d3136e15..9febf8bed2f6 100644
> --- a/drivers/reset/reset-npcm.c
> +++ b/drivers/reset/reset-npcm.c
> @@ -161,9 +161,9 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
>  	of_match_device(dev->driver->of_match_table, dev)->data;
>  
>  	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
> -	if (IS_ERR(gcr_regmap)) {
> +	if (IS_ERR_OR_NULL(gcr_regmap)) {
>  		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
> -		return PTR_ERR(gcr_regmap);
> +		return -ENODEV;
>  	}
>  
>  	/* checking which USB device is enabled */

regards
Philipp
