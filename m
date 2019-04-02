From: CK Hu <ck.hu@mediatek.com>
Date: Tue, 02 Apr 2019 01:43:03 +0000
Subject: Re: [PATCH] drm/mediatek: Fix an error code in mtk_hdmi_dt_parse_pdata()
Message-Id: <1554169383.20131.1.camel@mtksdaap41>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328143130.GO32590@kadam>
In-Reply-To: <20190328143130.GO32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jie Qiu <jie.qiu@mediatek.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

Hi, Dan:

On Thu, 2019-03-28 at 17:31 +0300, Dan Carpenter wrote:
> We don't want to overwrite "ret", it already holds the correct error
> code.  The "regmap" variable might be a valid pointer as this point.
> 
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to mediatek-drm-fixes-5.1 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.1

Regards,
CK

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 915cc84621ae..543a25e5765e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1480,7 +1480,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  	if (IS_ERR(regmap))
>  		ret = PTR_ERR(regmap);
>  	if (ret) {
> -		ret = PTR_ERR(regmap);
>  		dev_err(dev,
>  			"Failed to get system configuration registers: %d\n",
>  			ret);
