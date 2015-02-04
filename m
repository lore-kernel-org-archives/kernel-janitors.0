From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 04 Feb 2015 10:40:07 +0000
Subject: [PATCH 1/1] iommu/amd: Convert non-returned local variable to boolean when relevant
Message-Id: <20150204104007.GA20468@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org

This patch was produced using Coccinelle. A simplified version of the
semantic patch is:

@r exists@
identifier f;
local idexpression u8 x;
identifier xname;
@@

f(...) {
...when any
(
  x@xname = 1;
|
  x@xname = 0;
)
...when any
}

@bad exists@
identifier r.f;
local idexpression u8 r.x
expression e1 != {0, 1}, e2;
@@

f(...) {
...when any
(
  x = e1;
|
  x + e2
)
...when any
}

@depends on !bad@
identifier r.f;
local idexpression u8 r.x;
identifier r.xname;
@@

f(...) {
...
++ bool xname;
- int xname;
<...
(
  x - 1
+ true
|
  x - -1
+ false
)
...>

}

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/iommu/amd_iommu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 59de636..92f9b47 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -843,10 +843,10 @@ static void build_inv_iommu_pages(struct iommu_cmd *cmd, u64 address,
 				  size_t size, u16 domid, int pde)
 {
 	u64 pages;
-	int s;
+	bool s;
 
 	pages = iommu_num_pages(address, size, PAGE_SIZE);
-	s     = 0;
+	s     = false;
 
 	if (pages > 1) {
 		/*
@@ -854,7 +854,7 @@ static void build_inv_iommu_pages(struct iommu_cmd *cmd, u64 address,
 		 * TLB entries for this domain
 		 */
 		address = CMD_INV_IOMMU_ALL_PAGES_ADDRESS;
-		s = 1;
+		s = true;
 	}
 
 	address &= PAGE_MASK;
@@ -874,10 +874,10 @@ static void build_inv_iotlb_pages(struct iommu_cmd *cmd, u16 devid, int qdep,
 				  u64 address, size_t size)
 {
 	u64 pages;
-	int s;
+	bool s;
 
 	pages = iommu_num_pages(address, size, PAGE_SIZE);
-	s     = 0;
+	s     = false;
 
 	if (pages > 1) {
 		/*
@@ -885,7 +885,7 @@ static void build_inv_iotlb_pages(struct iommu_cmd *cmd, u16 devid, int qdep,
 		 * TLB entries for this domain
 		 */
 		address = CMD_INV_IOMMU_ALL_PAGES_ADDRESS;
-		s = 1;
+		s = true;
 	}
 
 	address &= PAGE_MASK;
-- 
1.9.1

