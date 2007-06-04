From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 04 Jun 2007 19:53:19 +0000
Subject: [KJ] [PATCH] drivers/ide: Array size calculations using sizeof
Message-Id: <200706042153.20097.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces various array size calculations in drivers/ide/ide-cd.{c,h}
that were done using sizeof with the ARRAY_SIZE macro. There was a macro
called ARY_LEN defined in ide-cd.h that does exactly the same thing as
ARRAY_SIZE. I removed that macro and replaced all occurences with ARRAY_SIZE.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/ide/ide-cd.c b/drivers/ide/ide-cd.c
index 252ab82..79ee92a 100644
--- a/drivers/ide/ide-cd.c
+++ b/drivers/ide/ide-cd.c
@@ -481,7 +481,7 @@ void cdrom_analyze_sense_data(ide_drive_t *drive,
 		else
 			printk("  Unknown Error Type: ");
 
-		if (sense->sense_key < ARY_LEN(sense_key_texts))
+		if (sense->sense_key < ARRAY_SIZE(sense_key_texts))
 			s = sense_key_texts[sense->sense_key];
 
 		printk("%s -- (Sense key=0x%02x)\n", s, sense->sense_key);
@@ -491,7 +491,7 @@ void cdrom_analyze_sense_data(ide_drive_t *drive,
 				 sense->ascq);
 			s = buf;
 		} else {
-			int lo = 0, mid, hi = ARY_LEN(sense_data_texts);
+			int lo = 0, mid, hi = ARRAY_SIZE(sense_data_texts);
 			unsigned long key = (sense->sense_key << 16);
 			key |= (sense->asc << 8);
 			if (!(sense->ascq >= 0x80 && sense->ascq <= 0xdd))
@@ -524,7 +524,7 @@ void cdrom_analyze_sense_data(ide_drive_t *drive,
 
 		if (failed_command != NULL) {
 
-			int lo=0, mid, hi= ARY_LEN (packet_command_texts);
+			int lo=0, mid, hi= ARRAY_SIZE (packet_command_texts);
 			s = NULL;
 
 			while (hi > lo) {
diff --git a/drivers/ide/ide-cd.h b/drivers/ide/ide-cd.h
index ad1f2ed..228b29c 100644
--- a/drivers/ide/ide-cd.h
+++ b/drivers/ide/ide-cd.h
@@ -498,8 +498,6 @@ struct cdrom_info {
  * Descriptions of ATAPI error codes.
  */
 
-#define ARY_LEN(a) ((sizeof(a) / sizeof(a[0])))
-
 /* This stuff should be in cdrom.h, since it is now generic... */
 
 /* ATAPI sense keys (from table 140 of ATAPI 2.6) */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
