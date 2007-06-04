From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 04 Jun 2007 19:17:12 +0000
Subject: [KJ] [PATCH] drivers/eisa/eisa-bus.c: Array size calculation using
Message-Id: <200706042117.12714.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces an array size calculation in drivers/eisa/eisa-bus.c
that was done using sizeof with the ARRAY_SIZE macro. I also removed
the preprocessor definition "EISA_INFOS" that represented the number of
entries in eisa_table because it was only referenced once.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/eisa/eisa-bus.c b/drivers/eisa/eisa-bus.c
index d944647..a72c08d 100644
--- a/drivers/eisa/eisa-bus.c
+++ b/drivers/eisa/eisa-bus.c
@@ -29,7 +29,6 @@ struct eisa_device_info {
 static struct eisa_device_info __initdata eisa_table[] = {
 #include "devlist.h"
 };
-#define EISA_INFOS (sizeof (eisa_table) / (sizeof (struct eisa_device_info)))
 #endif
 
 #define EISA_MAX_FORCED_DEV 16
@@ -59,7 +58,7 @@ static void __init eisa_name_device (struct eisa_device *edev)
 {
 #ifdef CONFIG_EISA_NAMES
 	int i;
-	for (i = 0; i < EISA_INFOS; i++) {
+	for (i = 0; i < ARRAY_SIZE(eisa_table); i++) {
 		if (!strcmp (edev->id.sig, eisa_table[i].id.sig)) {
 			strlcpy (edev->pretty_name,
 				 eisa_table[i].name,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
