From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jul 2013 06:02:31 +0000
Subject: [patch] rapidio: use after free in unregister function
Message-Id: <20130705060231.GA14443@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alexandre.bounine@idt.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to use the _safe version of list_for_each_entry() because we
are freeing the iterator.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index f4f30af..84ac64a 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -1701,7 +1701,7 @@ EXPORT_SYMBOL_GPL(rio_register_scan);
 int rio_unregister_scan(int mport_id, struct rio_scan *scan_ops)
 {
 	struct rio_mport *port;
-	struct rio_scan_node *scan;
+	struct rio_scan_node *scan, *tmp;
 
 	pr_debug("RIO: %s for mport_id=%d\n", __func__, mport_id);
 
@@ -1715,7 +1715,7 @@ int rio_unregister_scan(int mport_id, struct rio_scan *scan_ops)
 		    (mport_id = RIO_MPORT_ANY && port->nscan = scan_ops))
 			port->nscan = NULL;
 
-	list_for_each_entry(scan, &rio_scans, node)
+	list_for_each_entry_safe(scan, tmp, &rio_scans, node)
 		if (scan->mport_id = mport_id) {
 			list_del(&scan->node);
 			kfree(scan);
