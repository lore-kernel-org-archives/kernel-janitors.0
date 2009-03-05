From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:15:23 +0000
Subject: [PATCH v2 07/15] NULL noise: drivers/pci/dmar.c
Message-Id: <20090305191518.30062.96525.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: David Woodhouse <David.Woodhouse@intel.com>

Fix this sparse warning(s):
  drivers/pci/dmar.c:782:29: warning: Using plain integer as NULL pointer
  drivers/pci/dmar.c:790:29: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 drivers/pci/dmar.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/dmar.c b/drivers/pci/dmar.c
index 5f33340..4b654b2 100644
--- a/drivers/pci/dmar.c
+++ b/drivers/pci/dmar.c
@@ -779,7 +779,7 @@ int dmar_enable_qi(struct intel_iommu *iommu)
 	qi->desc = (void *)(get_zeroed_page(GFP_KERNEL));
 	if (!qi->desc) {
 		kfree(qi);
-		iommu->qi = 0;
+		iommu->qi = NULL;
 		return -ENOMEM;
 	}
 
@@ -787,7 +787,7 @@ int dmar_enable_qi(struct intel_iommu *iommu)
 	if (!qi->desc_status) {
 		free_page((unsigned long) qi->desc);
 		kfree(qi);
-		iommu->qi = 0;
+		iommu->qi = NULL;
 		return -ENOMEM;
 	}
 

