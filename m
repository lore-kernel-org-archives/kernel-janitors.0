From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Oct 2017 20:15:19 +0000
Subject: [PATCH 3/4] ARM: OMAP: Use kcalloc() in omap_system_dma_probe()
Message-Id: <cb714a17-9400-13fe-c4b0-f99aaf2e1aed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b196ffac-4bd1-4465-cee9-e46b7405633d@users.sourceforge.net>
In-Reply-To: <b196ffac-4bd1-4465-cee9-e46b7405633d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Oct 2017 21:07:33 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/plat-omap/dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 409e4ecaebe9..d4012d6c0dcb 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -1321,8 +1321,9 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (dma_omap2plus()) {
-		dma_linked_lch = kzalloc(sizeof(struct dma_link_info) *
-						dma_lch_count, GFP_KERNEL);
+		dma_linked_lch = kcalloc(dma_lch_count,
+					 sizeof(*dma_linked_lch),
+					 GFP_KERNEL);
 		if (!dma_linked_lch) {
 			ret = -ENOMEM;
 			goto exit_dma_lch_fail;
-- 
2.14.2

