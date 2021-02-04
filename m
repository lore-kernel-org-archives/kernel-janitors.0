From: Will Deacon <will@kernel.org>
Date: Thu, 04 Feb 2021 15:45:23 +0000
Subject: Re: [PATCH][next][V2] iommu/mediatek: Fix unsigned domid comparison with less than zero
Message-Id: <20210204154522.GD21058@willie-the-truck>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204150001.102672-1-colin.king@canonical.com>
In-Reply-To: <20210204150001.102672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

On Thu, Feb 04, 2021 at 03:00:01PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned. Fix this by casting domid to an int before making
> the comparison.
> 
> Addresses-Coverity: ("Unsigned comparison against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: cast domid rather than making it an int. Replace L with : in
>     the commit message.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..1f262621ef19 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -645,7 +645,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_READ;
>  
> -	if (domid < 0)
> +	if ((int)domid < 0)
>  		return;
>  	curdom = data->plat_data->iova_region + domid;
>  	for (i = 0; i < data->plat_data->iova_region_nr; i++) {

Thanks, Colin.

Acked-by: Will Deacon <will@kernel.org>

Will
