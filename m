From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Wed, 20 Mar 2019 21:33:02 +0000
Subject: Re: [PATCH][next] scsi: phy: mediatek: fix typo in author's email address
Message-Id: <3e4f18e8-9324-e4c5-4b11-dc57eddd41e2@embeddedor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320212205.5726-1-colin.king@canonical.com>
In-Reply-To: <20190320212205.5726-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stanley Chu <stanley.chu@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 3/20/19 4:22 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a typo in the module author's email address. Fix this.
> 

This is priceless!

Acked-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Thanks, Colin.
--
Gustavo

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/phy/mediatek/phy-mtk-ufs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
> index 9a80a76d7990..cf94f5c35dc5 100644
> --- a/drivers/phy/mediatek/phy-mtk-ufs.c
> +++ b/drivers/phy/mediatek/phy-mtk-ufs.c
> @@ -241,5 +241,5 @@ static struct platform_driver ufs_mtk_phy_driver = {
>  module_platform_driver(ufs_mtk_phy_driver);
>  
>  MODULE_DESCRIPTION("Universal Flash Storage (UFS) MediaTek MPHY");
> -MODULE_AUTHOR("Stanley Chu <stanley.chu@medaitek.com>");
> +MODULE_AUTHOR("Stanley Chu <stanley.chu@mediatek.com>");
>  MODULE_LICENSE("GPL v2");
> 
