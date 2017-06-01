From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Jun 2017 20:48:00 +0000
Subject: [PATCH 1/5] ARM: OMAP1: DMA: Improve a size determination in omap1_system_dma_init()
Message-Id: <9765c4ce-fe2b-dee7-b79a-b6393fb79594@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85e2ec7f-f650-28a2-6cc5-0b4b52e44183@users.sourceforge.net>
In-Reply-To: <85e2ec7f-f650-28a2-6cc5-0b4b52e44183@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Jun 2017 21:48:11 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/arm/mach-omap1/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/dma.c b/arch/arm/mach-omap1/dma.c
index c821c1d5610e..823dba3dc033 100644
--- a/arch/arm/mach-omap1/dma.c
+++ b/arch/arm/mach-omap1/dma.c
@@ -339,5 +339,5 @@ static int __init omap1_system_dma_init(void)
 		goto exit_iounmap;
 	}
 
-	d = kzalloc(sizeof(struct omap_dma_dev_attr), GFP_KERNEL);
+	d = kzalloc(sizeof(*d), GFP_KERNEL);
 	if (!d) {
-- 
2.13.0

