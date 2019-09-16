From: Robin Murphy <robin.murphy@arm.com>
Date: Mon, 16 Sep 2019 10:46:10 +0000
Subject: Re: [PATCH] iommu/arm-smmu: Axe a useless test in 'arm_smmu_master_alloc_smes()'
Message-Id: <de9ee628-9efb-3078-590c-6852be61c7d2@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190915193401.27426-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190915193401.27426-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, will@kernel.org, joro@8bytes.org
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 15/09/2019 20:34, Christophe JAILLET wrote:
> 'ommu_group_get_for_dev()' never returns NULL, so this test can be removed.

Nit: typo in the function name.

Otherwise, there definitely used to be some path where a NULL return 
could leak out, so I would have had that in mind at the time I wrote 
this, but apparently I never noticed that that had already been cleaned 
up by the time this got merged.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/iommu/arm-smmu.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index c3ef0cc8f764..6fae8cdbe985 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1038,8 +1038,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
>   	}
>   
>   	group = iommu_group_get_for_dev(dev);
> -	if (!group)
> -		group = ERR_PTR(-ENOMEM);
>   	if (IS_ERR(group)) {
>   		ret = PTR_ERR(group);
>   		goto out_err;
> 
