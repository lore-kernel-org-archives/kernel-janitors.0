From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 08 Dec 2020 12:58:11 +0000
Subject: Re: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy on an error message
Message-Id: <20201208125549.GG8403@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207150937.170435-1-colin.king@canonical.com>
 <1607392202.23328.1.camel@mhfsdcap03>
In-Reply-To: <1607392202.23328.1.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, chunhui dai <chunhui.dai@mediatek.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On 08-12-20, 09:50, Chunfeng Yun wrote:
> On Mon, 2020-12-07 at 15:09 +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there is a null pointer check for hdmi_phy that implies it
> > may be null, however a dev_err messages dereferences this potential null
> > pointer.  Avoid a null pointer dereference by only emitting the dev_err
> > message if hdmi_phy is non-null.  It is a moot point if the error message
> > needs to be printed at all, but since this is a relatively new piece of
> > code it may be useful to keep the message in for the moment in case there
> > are unforseen errors that need to be reported.
> > 
> > Addresses-Coverity: ("Dereference after null check")
> > Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> > index c5c61f5a9ea0..5184054783c7 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> > @@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
> >  	    hdmi_phy->conf->hdmi_phy_disable_tmds)
> >  		return &mtk_hdmi_phy_dev_ops;
> >  
> > -	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> > -		return NULL;
> > +	if (hdmi_phy)
> > +		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> > +			return NULL;
> indentation: one tab before return

I have applied this and fixed the indent while applying

-- 
~Vinod
