From: Eric Anschuetz <ericanschuetz@yahoo.com>
Date: Sat, 13 Mar 2010 00:52:13 +0000
Subject: [PATCH 2/2] Staging: rar: fix various style issues in rar_driver.c
Message-Id: <1268441533.4388.2.camel@Acer-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From 4d59ee6e30f056f262948dc35c8c1967c9d1b2a5 Mon Sep 17 00:00:00 2001
From: Eric Anschuetz <gh4ever@Acer-laptop.(none)>
Date: Sun, 7 Mar 2010 16:16:17 -0500
Subject: [PATCH 2/2] Staging: rar: fix various style issues in rar_driver.c
 This is a patch to the rar_driver.c file that fixes indentation and space warnings.
 Signed-off-by: Eric Anschuetz <ericanschuetz@yahoo.com>

---
 drivers/staging/rar/rar_driver.c |   26 ++++++++++++--------------
 1 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rar/rar_driver.c b/drivers/staging/rar/rar_driver.c
index 640b06f..e1a7402 100644
--- a/drivers/staging/rar/rar_driver.c
+++ b/drivers/staging/rar/rar_driver.c
@@ -293,7 +293,7 @@ static int memrar_init_rar_params(struct pci_dev *pdev)
 			|| memrar_get_rar_addr(pdev,
 					(*i).high,
 					&(rar_addr[n].high)) != 0) {
-		       result = -1;
+			result = -1;
 		       break;
 	       }
 	}
@@ -302,18 +302,18 @@ static int memrar_init_rar_params(struct pci_dev *pdev)
 	/* pci_dev_put(pdev); */
 
 	if (result = 0) {
-	if (1) {
-	       size_t z;
-	       for (z = 0; z != MRST_NUM_RAR; ++z) {
-			printk(KERN_WARNING "rar - BRAR[%Zd] physical address low\n"
-			     "\tlow:  0x%08x\n"
-			     "\thigh: 0x%08x\n",
-			     z,
-			     rar_addr[z].low,
-			     rar_addr[z].high);
+		if (1) {
+			size_t z;
+			for (z = 0; z != MRST_NUM_RAR; ++z) {
+				printk(KERN_WARNING "rar - BRAR[%Zd] physical address low\n"
+					"\tlow:  0x%08x\n"
+					"\thigh: 0x%08x\n",
+					z,
+					rar_addr[z].low,
+					rar_addr[z].high);
+				}
 			}
-	       }
-	}
+		}
 
 	return result;
 }
@@ -410,8 +410,6 @@ int get_rar_address(int rar_index, struct RAR_address_struct *addresses)
 		return -ENODEV;
 		}
 }
-
-
 EXPORT_SYMBOL(get_rar_address);
 
 /* The lock_rar function is ued by other device drivers to lock an RAR.
-- 
1.6.3.3




