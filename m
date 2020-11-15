From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 20:59:51 +0000
Subject: [PATCH] iommu/vt-d: include conditionally on CONFIG_INTEL_IOMMU_SVM
Message-Id: <20201115205951.20698-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liu Yi L <yi.l.liu@intel.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>

Commit 6ee1b77ba3ac ("iommu/vt-d: Add svm/sva invalidate function")
introduced intel_iommu_sva_invalidate() when CONFIG_INTEL_IOMMU_SVM.
This function uses the dedicated static variable inv_type_granu_table
and functions to_vtd_granularity() and to_vtd_size().

These parts are unused when !CONFIG_INTEL_IOMMU_SVM, and hence,
make CC=clang W=1 warns with an -Wunused-function warning.

Include these parts conditionally on CONFIG_INTEL_IOMMU_SVM.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201113

Liu Yi L, Jakob Pan, Lu Baolu, please ack.

Joerg, please pick this minor non-urgent clean-up patch.

 drivers/iommu/intel/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index c6622011d493..7b32703c0b47 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5386,6 +5386,7 @@ static void intel_iommu_aux_detach_device(struct iommu_domain *domain,
 	aux_domain_remove_dev(to_dmar_domain(domain), dev);
 }
 
+#ifdef CONFIG_INTEL_IOMMU_SVM
 /*
  * 2D array for converting and sanitizing IOMMU generic TLB granularity to
  * VT-d granularity. Invalidation is typically included in the unmap operation
@@ -5432,7 +5433,6 @@ static inline u64 to_vtd_size(u64 granu_size, u64 nr_granules)
 	return order_base_2(nr_pages);
 }
 
-#ifdef CONFIG_INTEL_IOMMU_SVM
 static int
 intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
 			   struct iommu_cache_invalidate_info *inv_info)
-- 
2.17.1
