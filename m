From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Jul 2016 12:47:27 +0000
Subject: Re: [patch] drm/mediatek/mtk_mipi_tx: checking the wrong variable
Message-Id: <20160712124727.GX23520@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160701135934.GA15723@mwanda>
 <f665b4b4-c7b3-f07a-4185-fe551d334623@gmail.com>
In-Reply-To: <f665b4b4-c7b3-f07a-4185-fe551d334623@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org

On Sat, Jul 02, 2016 at 06:44:13PM +0200, Matthias Brugger wrote:
> 
> 
> On 07/01/2016 03:59 PM, Dan Carpenter wrote:
> > We should be checking "phy_provider" here not "phy".
> > 
> > Fixes: 2e54c14e310f ('drm/mediatek: Add DSI sub driver')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Applied to drm-misc, thanks.
-Daniel

> 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> > index cf8f38d..1c366f8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
> > @@ -431,7 +431,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
> >  	phy_set_drvdata(phy, mipi_tx);
> > 
> >  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > -	if (IS_ERR(phy)) {
> > +	if (IS_ERR(phy_provider)) {
> >  		ret = PTR_ERR(phy_provider);
> >  		return ret;
> >  	}
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
