From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 23 Oct 2006 20:22:57 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <1161634977.419.18.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc2-git7/drivers/pci/hotplug/acpiphp_ibm.c.orig	2006-10-23 21:30:51.000000000 +0200
+++ linux-2.6.19-rc2-git7/drivers/pci/hotplug/acpiphp_ibm.c	2006-10-23 21:31:31.000000000 +0200
@@ -160,10 +160,8 @@ static union apci_descriptor *ibm_slot_f
 		ret = des;
 
 ibm_slot_done:
-	if (ret) {
-		ret = kmalloc(sizeof(union apci_descriptor), GFP_KERNEL);
-		memcpy(ret, des, sizeof(union apci_descriptor));
-	}
+	if (ret)
+		ret = kmemdup(des, sizeof(union apci_descriptor), GFP_KERNEL);
 	kfree(table);
 	return ret;
 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
