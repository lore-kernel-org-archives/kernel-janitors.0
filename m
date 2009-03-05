From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:53:42 +0000
Subject: [PATCH v3 02/15] NULL noise: arch/x86/kernel/amd_iommu*.c
Message-Id: <20090305195228.2407.4911.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net> <20090305191312.30062.28919.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305191312.30062.28919.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Joerg Roedel <joerg.roedel@amd.com>

Fix this sparse warning(s):
  arch/x86/kernel/amd_iommu_init.c:901:37: warning: Using plain integer as NULL pointer
  arch/x86/kernel/amd_iommu.c:1522:24: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro
v3: no need to init the variable (thanks to Joe Perches)

 arch/x86/kernel/amd_iommu.c      |    2 +-
 arch/x86/kernel/amd_iommu_init.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_iommu.c b/arch/x86/kernel/amd_iommu.c
index 008e522..3f6e1c8 100644
--- a/arch/x86/kernel/amd_iommu.c
+++ b/arch/x86/kernel/amd_iommu.c
@@ -1519,7 +1519,7 @@ static void *alloc_coherent(struct device *dev, size_t size,
 	flag |= __GFP_ZERO;
 	virt_addr = (void *)__get_free_pages(flag, get_order(size));
 	if (!virt_addr)
-		return 0;
+		return NULL;
 
 	paddr = virt_to_phys(virt_addr);
 
diff --git a/arch/x86/kernel/amd_iommu_init.c b/arch/x86/kernel/amd_iommu_init.c
index 42c33ce..9bccd0f 100644
--- a/arch/x86/kernel/amd_iommu_init.c
+++ b/arch/x86/kernel/amd_iommu_init.c
@@ -898,7 +898,7 @@ static int __init init_exclusion_range(struct ivmd_header *m)
 /* called for unity map ACPI definition */
 static int __init init_unity_map_range(struct ivmd_header *m)
 {
-	struct unity_map_entry *e = 0;
+	struct unity_map_entry *e;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (e = NULL)

