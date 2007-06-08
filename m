From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 08 Jun 2007 18:44:26 +0000
Subject: [KJ] [PATCH 2/2] drivers/isdn/act2000: Macro capitalization
Message-Id: <200706082044.27017.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch capitalizes lower-case macros defined in
drivers/isdn/act2000/{act2000.h,act2000_isa.h,capi.c} according to
Documentation/CodingStyle, Chapter 12.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/isdn/act2000/act2000.h b/drivers/isdn/act2000/act2000.h
index d4c5051..c167171 100644
--- a/drivers/isdn/act2000/act2000.h
+++ b/drivers/isdn/act2000/act2000.h
@@ -12,8 +12,8 @@
  *
  */
 
-#ifndef act2000_h
-#define act2000_h
+#ifndef ACT2000_H
+#define ACT2000_H
 
 #include <linux/compiler.h>
 
@@ -199,4 +199,4 @@ static inline void act2000_schedule_poll(act2000_card *card)
 extern char *act2000_find_eaz(act2000_card *, char);
 
 #endif                          /* defined(__KERNEL__) || defined(__DEBUGVAR__) */
-#endif                          /* act2000_h */
+#endif                          /* ACT2000_H */
diff --git a/drivers/isdn/act2000/act2000_isa.h b/drivers/isdn/act2000/act2000_isa.h
index ad86c5e..eacb929 100644
--- a/drivers/isdn/act2000/act2000_isa.h
+++ b/drivers/isdn/act2000/act2000_isa.h
@@ -12,8 +12,8 @@
  *
  */
 
-#ifndef act2000_isa_h
-#define act2000_isa_h
+#ifndef ACT2000_ISA_H
+#define ACT2000_ISA_H
 
 #define ISA_POLL_LOOP 40        /* Try to read-write before give up */
 
@@ -133,4 +133,4 @@ extern void act2000_isa_release(act2000_card * card);
 extern void act2000_isa_receive(act2000_card *card);
 extern void act2000_isa_send(act2000_card *card);
 
-#endif                          /* act2000_isa_h */
+#endif                          /* ACT2000_ISA_H */
diff --git a/drivers/isdn/act2000/capi.c b/drivers/isdn/act2000/capi.c
index a3428da..18897ab 100644
--- a/drivers/isdn/act2000/capi.c
+++ b/drivers/isdn/act2000/capi.c
@@ -78,8 +78,8 @@ static actcapi_msgdsc valid_msg[] = {
 #endif
 	{{ 0x00, 0x00}, NULL},
 };
-#define num_valid_msg ARRAY_SIZE(valid_msg)
-#define num_valid_imsg 27 /* MANUFACTURER_IND */
+#define NUM_VALID_MSG ARRAY_SIZE(valid_msg)
+#define NUM_VALID_IMSG 27 /* MANUFACTURER_IND */
 
 /*
  * Check for a valid incoming CAPI message.
@@ -97,7 +97,7 @@ actcapi_chkhdr(act2000_card * card, actcapi_msghdr *hdr)
 		return 0;
 	if (hdr->len < 9)
 		return 0;
-	for (i = 0; i < num_valid_imsg; i++)
+	for (i = 0; i < NUM_VALID_IMSG; i++)
 		if ((hdr->cmd.cmd = valid_msg[i].cmd.cmd) &&
 		    (hdr->cmd.subcmd = valid_msg[i].cmd.subcmd)) {
 			return (i?1:2);
@@ -1025,7 +1025,7 @@ actcapi_debug_msg(struct sk_buff *skb, int direction)
 #ifdef DEBUG_DUMP_SKB
 	dump_skb(skb);
 #endif
-	for (i = 0; i < num_valid_msg; i++)
+	for (i = 0; i < NUM_VALID_MSG; i++)
 		if ((msg->hdr.cmd.cmd = valid_msg[i].cmd.cmd) &&
 		    (msg->hdr.cmd.subcmd = valid_msg[i].cmd.subcmd)) {
 			descr = valid_msg[i].description;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
