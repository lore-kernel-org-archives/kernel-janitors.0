From: Archit Taneja <architt@codeaurora.org>
Date: Wed, 18 Oct 2017 04:25:18 +0000
Subject: Re: [PATCH] drm/bridge: adv7511: Fix a use after free
Message-Id: <bdd9b820-93ea-80bd-d11f-82ffbff07338@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171017204343.zctliubjkq7imudi@mwanda>
In-Reply-To: <20171017204343.zctliubjkq7imudi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, John Stultz <john.stultz@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Neil Armstrong <narmstrong@baylibre.com>, Bhumika Goyal <bhumirks@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org



On 10/18/2017 02:13 AM, Dan Carpenter wrote:
> We free "edid", then use it again on the next line.
> 
> Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix. I've queued this to drm-misc-next.

Archit

> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 31ca883bda83..0e14f1572d05 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -607,10 +607,10 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
>   	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
>   			       drm_detect_hdmi_monitor(edid));
>   
> -	kfree(edid);
> -
>   	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
>   
> +	kfree(edid);
> +
>   	return count;
>   }
>   
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
