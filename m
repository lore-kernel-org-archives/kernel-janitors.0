From: Peter Huewe <PeterHuewe@gmx.de>
Date: Fri, 12 Jun 2009 11:07:29 +0000
Subject: [PATCH] block: adding __init/__exit macros to DAC960.c
Message-Id: <200906121307.29865.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions from drivers/block/DAC960.c
linux version 2.6.30

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/block/DAC960.c b/drivers/block/DAC960.c
index f22ed6c..5b4a48b 100644
--- a/drivers/block/DAC960.c
+++ b/drivers/block/DAC960.c
@@ -7209,7 +7209,7 @@ static struct pci_driver DAC960_pci_driver = {
 	.remove		= DAC960_Remove,
 };
 
-static int DAC960_init_module(void)
+static int __init DAC960_init_module(void)
 {
 	int ret;
 
@@ -7221,7 +7221,7 @@ static int DAC960_init_module(void)
 	return ret;
 }
 
-static void DAC960_cleanup_module(void)
+static void __exit DAC960_cleanup_module(void)
 {
 	int i;
