From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:14:28 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/acpi/
Message-Id: <1161634468.419.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/acpi/scan.c.orig	2006-10-23 20:57:29.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/acpi/scan.c	2006-10-23 20:59:03.000000000 +0200
@@ -853,10 +853,8 @@ static void acpi_device_set_id(struct ac
 		device->flags.unique_id = 1;
 	}
 	if (cid_list) {
-		device->pnp.cid_list = kmalloc(cid_list->size, GFP_KERNEL);
-		if (device->pnp.cid_list)
-			memcpy(device->pnp.cid_list, cid_list, cid_list->size);
-		else
+		device->pnp.cid_list = kmemdup(cid_list, cid_list->size, GFP_KERNEL);
+		if (!device->pnp.cid_list)
 			printk(KERN_ERR "Memory allocation error\n");
 	}
 


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
