From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Apr 2019 15:10:17 +0000
Subject: [PATCH][next] powerpc/mm: fix spelling mistake "Outisde" -> "Outside"
Message-Id: <20190423151017.14429-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several identical spelling mistakes in warning messages,
fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/mm/hash_utils_64.c  | 4 ++--
 arch/powerpc/mm/pgtable-hash64.c | 2 +-
 arch/powerpc/mm/pgtable-radix.c  | 6 +++---
 arch/powerpc/mm/pgtable_64.c     | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/hash_utils_64.c b/arch/powerpc/mm/hash_utils_64.c
index f727197de713..6eb89643ce58 100644
--- a/arch/powerpc/mm/hash_utils_64.c
+++ b/arch/powerpc/mm/hash_utils_64.c
@@ -784,7 +784,7 @@ int hash__create_section_mapping(unsigned long start, unsigned long end, int nid
 	int rc;
 
 	if (end >= H_VMALLOC_START) {
-		pr_warn("Outisde the supported range\n");
+		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
@@ -932,7 +932,7 @@ static void __init htab_initialize(void)
 		    base, size, prot);
 
 		if ((base + size) >= H_VMALLOC_START) {
-			pr_warn("Outisde the supported range\n");
+			pr_warn("Outside the supported range\n");
 			continue;
 		}
 
diff --git a/arch/powerpc/mm/pgtable-hash64.c b/arch/powerpc/mm/pgtable-hash64.c
index d934de4e2b3a..097a3b3538b1 100644
--- a/arch/powerpc/mm/pgtable-hash64.c
+++ b/arch/powerpc/mm/pgtable-hash64.c
@@ -115,7 +115,7 @@ int __meminit hash__vmemmap_create_mapping(unsigned long start,
 	int rc;
 
 	if ((start + page_size) >= H_VMEMMAP_END) {
-		pr_warn("Outisde the supported range\n");
+		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
diff --git a/arch/powerpc/mm/pgtable-radix.c b/arch/powerpc/mm/pgtable-radix.c
index e6d5065b0bc8..fcb0169e2d32 100644
--- a/arch/powerpc/mm/pgtable-radix.c
+++ b/arch/powerpc/mm/pgtable-radix.c
@@ -341,7 +341,7 @@ void __init radix_init_pgtable(void)
 		 */
 
 		if ((reg->base + reg->size) >= RADIX_VMALLOC_START) {
-			pr_warn("Outisde the supported range\n");
+			pr_warn("Outside the supported range\n");
 			continue;
 		}
 
@@ -902,7 +902,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 int __meminit radix__create_section_mapping(unsigned long start, unsigned long end, int nid)
 {
 	if (end >= RADIX_VMALLOC_START) {
-		pr_warn("Outisde the supported range\n");
+		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
@@ -934,7 +934,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	int ret;
 
 	if ((start + page_size) >= RADIX_VMEMMAP_END) {
-		pr_warn("Outisde the supported range\n");
+		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 72f58c076e26..95ad2a09501c 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -122,7 +122,7 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
 		return NULL;
 
 	if ((ea + size) >= (void *)IOREMAP_END) {
-		pr_warn("Outisde the supported range\n");
+		pr_warn("Outside the supported range\n");
 		return NULL;
 	}
 
-- 
2.20.1
