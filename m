From: Matthias Brugger <matthias.bgg@gmail.com>
Date: Sat, 02 Jul 2016 16:44:13 +0000
Subject: Re: [patch] drm/mediatek/mtk_mipi_tx: checking the wrong variable
Message-Id: <f665b4b4-c7b3-f07a-4185-fe551d334623@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160701135934.GA15723@mwanda>
In-Reply-To: <20160701135934.GA15723@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, CK Hu <ck.hu@mediatek.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org



On 07/01/2016 03:59 PM, Dan Carpenter wrote:
> We should be checking "phy_provider" here not "phy".
>
> Fixes: 2e54c14e310f ('drm/mediatek: Add DSI sub driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> index cf8f38d..1c366f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> @@ -431,7 +431,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
>  	phy_set_drvdata(phy, mipi_tx);
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy)) {
> +	if (IS_ERR(phy_provider)) {
>  		ret = PTR_ERR(phy_provider);
>  		return ret;
>  	}
>
