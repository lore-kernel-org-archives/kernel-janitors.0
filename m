From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 18:56:53 +0000
Subject: [PATCH 2/2] powerpc-ps3: Improve a size determination in two functions
Message-Id: <caf62593-9a36-e73c-2224-9f61338f694d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
In-Reply-To: <36a8ba41-7f1e-31f8-5d32-19e04393b181@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 20:15:17 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/ps3/mm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/mm.c b/arch/powerpc/platforms/ps3/mm.c
index b0f34663b1ae..257de451e324 100644
--- a/arch/powerpc/platforms/ps3/mm.c
+++ b/arch/powerpc/platforms/ps3/mm.c
@@ -524,8 +524,7 @@ static int dma_sb_map_pages(struct ps3_dma_region *r, unsigned long phys_addr,
 	int result;
 	struct dma_chunk *c;
 
-	c = kzalloc(sizeof(struct dma_chunk), GFP_ATOMIC);
-
+	c = kzalloc(sizeof(*c), GFP_ATOMIC);
 	if (!c) {
 		result = -ENOMEM;
 		goto fail_alloc;
@@ -570,8 +569,7 @@ static int dma_ioc0_map_pages(struct ps3_dma_region *r, unsigned long phys_addr,
 
 	DBG(KERN_ERR "%s: phy=%#lx, lpar%#lx, len=%#lx\n", __func__,
 	    phys_addr, ps3_mm_phys_to_lpar(phys_addr), len);
-	c = kzalloc(sizeof(struct dma_chunk), GFP_ATOMIC);
-
+	c = kzalloc(sizeof(*c), GFP_ATOMIC);
 	if (!c) {
 		result = -ENOMEM;
 		goto fail_alloc;
-- 
2.14.2

