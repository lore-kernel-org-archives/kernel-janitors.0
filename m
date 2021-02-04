From: Will Deacon <will@kernel.org>
Date: Thu, 04 Feb 2021 09:25:58 +0000
Subject: Re: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with less than zero
Message-Id: <20210204092558.GA20244@willie-the-truck>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203135936.23016-1-colin.king@canonical.com>
In-Reply-To: <20210203135936.23016-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Anan sun <anan.sun@mediatek.com>, Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>

On Wed, Feb 03, 2021 at 01:59:36PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned.  Fix this by making it signed.
> 
> Addresses-CoverityL ("Unsigned comparison against 0")

Typo here ('L' instead of ':')

> Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..823d719945b2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  				       struct list_head *head)
>  {
>  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
> -	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
> +	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;

Not sure if it's intentional, but this also makes 'i' signed. It probably
should remain 'unsigned' to match 'iova_region_nr' in
'struct mtk_iommu_plat_data'.

Will
