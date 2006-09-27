From: Amol Lad <amol@verismonetworks.com>
Date: Wed, 27 Sep 2006 09:55:36 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for drivers/sbus
Message-Id: <1159350216.25016.107.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux kernel <linux-kernel@vger.kernel.org>
Cc: kernel Janitors <kernel-janitors@lists.osdl.org>

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only) with:
- Modifying arch/i386/Kconfig and other Makefiles to make sure that the
changed file is compiling ok.

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 vfc_dev.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletion(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/sbus/char/vfc_dev.c linux-2.6.18/drivers/sbus/char/vfc_dev.c
--- linux-2.6.18-orig/drivers/sbus/char/vfc_dev.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/sbus/char/vfc_dev.c	2006-09-27 14:46:59.000000000 +0530
@@ -678,8 +678,14 @@ static int vfc_probe(void)
 		if (strcmp(sdev->prom_name, "vfc") = 0) {
 			vfc_dev_lst[instance]=(struct vfc_dev *)
 				kmalloc(sizeof(struct vfc_dev), GFP_KERNEL);
-			if (vfc_dev_lst[instance] = NULL)
+			if (vfc_dev_lst[instance] = NULL) {
+				int i;
+				for (i = 0; i < instance; i++) {
+					if (vfc_dev_lst[i]->regs)
+						sbus_iounmap(vfc_dev_lst[i]->regs, sizeof(struct vfc_regs));
+				}
 				return -ENOMEM;
+			}
 			ret = init_vfc_device(sdev,
 					      vfc_dev_lst[instance],
 					      instance);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
