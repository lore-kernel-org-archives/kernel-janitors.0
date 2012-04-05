From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Thu, 05 Apr 2012 06:13:44 +0000
Subject: [PATCH 2/2] Agp: Use u32 __iomem  annotation to silence sparse warning.
Message-Id: <1333605704-18658-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Replace "void *" by "u32 __iomem *" to silence sparse warning.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/char/agp/generic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
index 38022ea..a0df182 100644
--- a/drivers/char/agp/generic.c
+++ b/drivers/char/agp/generic.c
@@ -958,7 +958,7 @@ int agp_generic_create_gatt_table(struct agp_bridge_data *bridge)
 	if (set_memory_uc((unsigned long)table, 1 << page_order))
 		printk(KERN_WARNING "Could not set GATT table memory to UC!\n");
 
-	bridge->gatt_table = (void *)table;
+	bridge->gatt_table = (u32 __iomem *)table;
 #else
 	bridge->gatt_table = ioremap_nocache(virt_to_phys(table),
 					(PAGE_SIZE * (1 << page_order)));
-- 
1.7.4.4

