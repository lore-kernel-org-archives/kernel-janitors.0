From: Lu Baolu <baolu.lu@linux.intel.com>
Date: Sun, 15 Nov 2020 23:47:55 +0000
Subject: Re: [PATCH] iommu/vt-d: include conditionally on CONFIG_INTEL_IOMMU_SVM
Message-Id: <188313a2-ec53-28ef-2349-66594e116a2e@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201115205951.20698-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201115205951.20698-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Liu Yi L <yi.l.liu@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>

On 2020/11/16 4:59, Lukas Bulwahn wrote:
> Commit 6ee1b77ba3ac ("iommu/vt-d: Add svm/sva invalidate function")
> introduced intel_iommu_sva_invalidate() when CONFIG_INTEL_IOMMU_SVM.
> This function uses the dedicated static variable inv_type_granu_table
> and functions to_vtd_granularity() and to_vtd_size().
> 
> These parts are unused when !CONFIG_INTEL_IOMMU_SVM, and hence,
> make CC=clang W=1 warns with an -Wunused-function warning.
> 
> Include these parts conditionally on CONFIG_INTEL_IOMMU_SVM.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Fixes: 6ee1b77ba3ac0 ("iommu/vt-d: Add svm/sva invalidate function")
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
> applies cleanly on current master and next-20201113
> 
> Liu Yi L, Jakob Pan, Lu Baolu, please ack.
> 
> Joerg, please pick this minor non-urgent clean-up patch.
> 
>   drivers/iommu/intel/iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index c6622011d493..7b32703c0b47 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5386,6 +5386,7 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
>   	aux_domain_remove_dev(to_dmar_domain(domain), dev);
>   }
>   
> +#ifdef CONFIG_INTEL_IOMMU_SVM
>   /*
>    * 2D array for converting and sanitizing IOMMU generic TLB granularity to
>    * VT-d granularity. Invalidation is typically included in the unmap operation
> @@ -5432,7 +5433,6 @@ static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
>   	return order_base_2(nr_pages);
>   }
>   
> -#ifdef CONFIG_INTEL_IOMMU_SVM
>   static int
>   intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   			   struct iommu_cache_invalidate_info *inv_info)
> 
