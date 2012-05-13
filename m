From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 13 May 2012 17:09:38 +0000
Subject: [patch v2] iommu: off by one in dmar_get_fault_reason()
Message-Id: <20120513170938.GA4280@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4FAE595A.6010605@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suresh Siddha <suresh.b.siddha@intel.com>
Cc: Ingo Molnar <mingo@elte.hu>, Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Youquan Song <youquan.song@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>

fault_reason - 0x20 = ARRAY_SIZE(irq_remap_fault_reasons) is one past
the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: re-arranged slightly for readability

diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
index 5ef65cf..3a74e44 100644
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@ -1057,8 +1057,8 @@ static const char *irq_remap_fault_reasons[]  
 const char *dmar_get_fault_reason(u8 fault_reason, int *fault_type)
 {
-	if (fault_reason >= 0x20 && (fault_reason <= 0x20 +
-				     ARRAY_SIZE(irq_remap_fault_reasons))) {
+	if (fault_reason >= 0x20 && (fault_reason - 0x20 <
+					ARRAY_SIZE(irq_remap_fault_reasons))) {
 		*fault_type = INTR_REMAP;
 		return irq_remap_fault_reasons[fault_reason - 0x20];
 	} else if (fault_reason < ARRAY_SIZE(dma_remap_fault_reasons)) {
