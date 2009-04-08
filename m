From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:22:10 +0000
Subject: [PATCH 38/56] pci: Remove void casts
Message-Id: <1239189748-11703-39-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 drivers/pci/intel-iommu.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/intel-iommu.c b/drivers/pci/intel-iommu.c
index fb3a3f3..c0dd267 100644
--- a/drivers/pci/intel-iommu.c
+++ b/drivers/pci/intel-iommu.c
@@ -519,7 +519,7 @@ static struct context_entry * device_to_context_entry(struct intel_iommu *iommu,
 	root = &iommu->root_entry[bus];
 	context = get_context_addr_from_root(root);
 	if (!context) {
-		context = (struct context_entry *)alloc_pgtable_page();
+		context = alloc_pgtable_page();
 		if (!context) {
 			spin_unlock_irqrestore(&iommu->lock, flags);
 			return NULL;
@@ -789,7 +789,7 @@ static int iommu_alloc_root_entry(struct intel_iommu *iommu)
 	struct root_entry *root;
 	unsigned long flags;
 
-	root = (struct root_entry *)alloc_pgtable_page();
+	root = alloc_pgtable_page();
 	if (!root)
 		return -ENOMEM;
 
@@ -1290,7 +1290,7 @@ static int domain_init(struct dmar_domain *domain, int guest_width)
 	domain->iommu_count = 1;
 
 	/* always allocate the top pgd */
-	domain->pgd = (struct dma_pte *)alloc_pgtable_page();
+	domain->pgd = alloc_pgtable_page();
 	if (!domain->pgd)
 		return -ENOMEM;
 	__iommu_flush_cache(iommu, domain->pgd, PAGE_SIZE);
@@ -3019,7 +3019,7 @@ static int vm_domain_init(struct dmar_domain *domain, int guest_width)
 	domain->max_addr = 0;
 
 	/* always allocate the top pgd */
-	domain->pgd = (struct dma_pte *)alloc_pgtable_page();
+	domain->pgd = alloc_pgtable_page();
 	if (!domain->pgd)
 		return -ENOMEM;
 	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
-- 
1.5.4.3

