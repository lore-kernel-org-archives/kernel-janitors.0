From: Yakir Yang <ykk@rock-chips.com>
Date: Fri, 26 Feb 2016 06:26:23 +0000
Subject: Re: [patch] drm/rockchip: inno_hdmi: fix an error code
Message-Id: <56CFF00F.3030309@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225213029.GA18267@mwanda>
In-Reply-To: <20160225213029.GA18267@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: David Airlie <airlied@linux.ie>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org

Dan,

On 02/26/2016 05:30 AM, Dan Carpenter wrote:
> We were accidentally returning PTR_ERR(NULL) which means success when we
> wanted to return a negative error code.
>
> Fixes: 412d4ae6b7a5 ('drm/rockchip: hdmi: add Innosilicon HDMI support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Yakir Yang <ykk@rock-chips.com>

Thanks,
- Yakir
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index 10d62ff..f252441 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -855,8 +855,9 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
>   
>   	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
>   	if (IS_ERR(hdmi->ddc)) {
> +		ret = PTR_ERR(hdmi->ddc);
>   		hdmi->ddc = NULL;
> -		return PTR_ERR(hdmi->ddc);
> +		return ret;
>   	}
>   
>   	/*
>
>
>


