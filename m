From: Stanley Chu <stanley.chu@mediatek.com>
Date: Wed, 20 Mar 2019 23:10:03 +0000
Subject: Re: [PATCH][next] scsi: phy: mediatek: fix typo in author's email address
Message-Id: <1553123403.30977.74.camel@mtkswgap22>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320212205.5726-1-colin.king@canonical.com>
 <20190320212205.5726-2-colin.king@canonical.com>
 <1553122955.10179.169.camel@mhfsdcap03>
In-Reply-To: <1553122955.10179.169.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

Hi Colin,

On Thu, 2019-03-21 at 07:02 +0800, Chunfeng Yun wrote:
> Hi Colin,
> 
> On Wed, 2019-03-20 at 21:22 +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a typo in the module author's email address. Fix this.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-ufs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
> > index 9a80a76d7990..cf94f5c35dc5 100644
> > --- a/drivers/phy/mediatek/phy-mtk-ufs.c
> > +++ b/drivers/phy/mediatek/phy-mtk-ufs.c
> > @@ -241,5 +241,5 @@ static struct platform_driver ufs_mtk_phy_driver = {
> >  module_platform_driver(ufs_mtk_phy_driver);
> >  
> >  MODULE_DESCRIPTION("Universal Flash Storage (UFS) MediaTek MPHY");
> > -MODULE_AUTHOR("Stanley Chu <stanley.chu@medaitek.com>");
> > +MODULE_AUTHOR("Stanley Chu <stanley.chu@mediatek.com>");

Thanks for fixing this.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

> >  MODULE_LICENSE("GPL v2");
> 
> Thank you.
> 
> Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> 
