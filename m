From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 08 Jun 2007 18:42:33 +0000
Subject: [KJ] [PATCH 1/2] drivers/isdn/act2000: ARRAY_SIZE
Message-Id: <200706082042.33671.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces array size calculations done with sizeof with the
ARRAY_SIZE macro. It also removes the ISA_NRPORTS definition,
because it was only referenced once.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/isdn/act2000/capi.c b/drivers/isdn/act2000/capi.c
index 946c38c..a3428da 100644
--- a/drivers/isdn/act2000/capi.c
+++ b/drivers/isdn/act2000/capi.c
@@ -78,7 +78,7 @@ static actcapi_msgdsc valid_msg[] = {
 #endif
 	{{ 0x00, 0x00}, NULL},
 };
-#define num_valid_msg (sizeof(valid_msg)/sizeof(actcapi_msgdsc))
+#define num_valid_msg ARRAY_SIZE(valid_msg)
 #define num_valid_imsg 27 /* MANUFACTURER_IND */
 
 /*
diff --git a/drivers/isdn/act2000/module.c b/drivers/isdn/act2000/module.c
index ee2b0b9..26208c5 100644
--- a/drivers/isdn/act2000/module.c
+++ b/drivers/isdn/act2000/module.c
@@ -23,7 +23,6 @@ static unsigned short act2000_isa_ports[]          0x0200, 0x0240, 0x0280, 0x02c0, 0x0300, 0x0340, 0x0380,
         0xcfe0, 0xcfa0, 0xcf60, 0xcf20, 0xcee0, 0xcea0, 0xce60,
 };
-#define ISA_NRPORTS (sizeof(act2000_isa_ports)/sizeof(unsigned short))
 
 static act2000_card *cards = (act2000_card *) NULL;
 
@@ -687,7 +686,7 @@ act2000_addcard(int bus, int port, int irq, char *id)
 		 */
 		switch (bus) {
 			case ACT2000_BUS_ISA:
-				for (i = 0; i < ISA_NRPORTS; i++)
+				for (i = 0; i < ARRAY_SIZE(act2000_isa_ports); i++)
 					if (act2000_isa_detect(act2000_isa_ports[i])) {
 						printk(KERN_INFO
 						       "act2000: Detected ISA card at port 0x%x\n",
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
