From: Amol Lad <amol@verismonetworks.com>
Date: Thu, 28 Sep 2006 06:27:25 +0000
Subject: [KJ] [PATCH] ioremap balanced with iounmap for drivers/pci/hotplug
Message-Id: <1159424125.9310.22.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1158842563.28299.145.camel@amol.verismonetworks.com>
In-Reply-To: <1158842563.28299.145.camel@amol.verismonetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ioremap must be balanced by an iounmap and failing to do so can result
in a memory leak.

Tested (compilation only) with:
- allmodconfig

Signed-off-by: Amol Lad <amol@verismonetworks.com>	
---
 shpchp_hpc.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletion(-)
---
diff -uprN -X linux-2.6.18-orig/Documentation/dontdiff linux-2.6.18-orig/drivers/pci/hotplug/shpchp_hpc.c linux-2.6.18/drivers/pci/hotplug/shpchp_hpc.c
--- linux-2.6.18-orig/drivers/pci/hotplug/shpchp_hpc.c	2006-09-21 10:15:38.000000000 +0530
+++ linux-2.6.18/drivers/pci/hotplug/shpchp_hpc.c	2006-09-28 11:32:02.000000000 +0530
@@ -1282,8 +1282,11 @@ int shpc_init(struct controller * ctrl, 
 	 */
 	if (atomic_add_return(1, &shpchp_num_controllers) = 1) {
 		shpchp_wq = create_singlethread_workqueue("shpchpd");
-		if (!shpchp_wq)
+		if (!shpchp_wq) {
+			iounmap(php_ctlr->creg);
+			php_ctlr->creg = NULL;
 			return -ENOMEM;
+		}
 	}
 
 	/*
@@ -1313,6 +1316,8 @@ int shpc_init(struct controller * ctrl, 
 
 	/* We end up here for the many possible ways to fail this API.  */
 abort_free_ctlr:
+	if (php_ctlr->creg)
+		iounmap(php_ctlr->creg);
 	kfree(php_ctlr);
 abort:
 	DBG_LEAVE_ROUTINE


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
