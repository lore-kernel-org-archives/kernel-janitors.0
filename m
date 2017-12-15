From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:36:20 +0000
Subject: [PATCH 7/7] rapidio: Move 12 EXPORT_SYMBOL_GPL() calls to function implementations
Message-Id: <5f51f606-ece8-7bff-bb86-81d182c49b98@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 11:08:31 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index d095a18257c2..83406696c7aa 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -81,6 +81,7 @@ u16 rio_local_get_device_id(struct rio_mport *port)
 
 	return (RIO_GET_DID(port->sys_size, result));
 }
+EXPORT_SYMBOL_GPL(rio_local_get_device_id);
 
 /**
  * rio_query_mport - Query mport device attributes
@@ -275,6 +276,7 @@ int rio_request_inb_mbox(struct rio_mport *mport,
       out:
 	return rc;
 }
+EXPORT_SYMBOL_GPL(rio_request_inb_mbox);
 
 /**
  * rio_release_inb_mbox - release inbound mailbox message service
@@ -303,6 +305,7 @@ int rio_release_inb_mbox(struct rio_mport *mport, int mbox)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rio_release_inb_mbox);
 
 /**
  * rio_request_outb_mbox - request outbound mailbox service
@@ -357,6 +360,7 @@ int rio_request_outb_mbox(struct rio_mport *mport,
       out:
 	return rc;
 }
+EXPORT_SYMBOL_GPL(rio_request_outb_mbox);
 
 /**
  * rio_release_outb_mbox - release outbound mailbox message service
@@ -385,6 +389,7 @@ int rio_release_outb_mbox(struct rio_mport *mport, int mbox)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rio_release_outb_mbox);
 
 /**
  * rio_setup_inb_dbell - bind inbound doorbell callback
@@ -458,6 +463,7 @@ int rio_request_inb_dbell(struct rio_mport *mport,
       out:
 	return rc;
 }
+EXPORT_SYMBOL_GPL(rio_request_inb_dbell);
 
 /**
  * rio_release_inb_dbell - release inbound doorbell message service
@@ -499,6 +505,7 @@ int rio_release_inb_dbell(struct rio_mport *mport, u16 start, u16 end)
       out:
 	return rc;
 }
+EXPORT_SYMBOL_GPL(rio_release_inb_dbell);
 
 /**
  * rio_request_outb_dbell - request outbound doorbell message range
@@ -527,6 +534,7 @@ struct resource *rio_request_outb_dbell(struct rio_dev *rdev, u16 start,
 
 	return res;
 }
+EXPORT_SYMBOL_GPL(rio_request_outb_dbell);
 
 /**
  * rio_release_outb_dbell - release outbound doorbell message range
@@ -544,6 +552,7 @@ int rio_release_outb_dbell(struct rio_dev *rdev, struct resource *res)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(rio_release_outb_dbell);
 
 /**
  * rio_add_mport_pw_handler - add port-write message handler into the list
@@ -1450,6 +1459,7 @@ struct rio_dev *rio_get_asm(u16 vid, u16 did,
 	spin_unlock(&rio_global_list_lock);
 	return rdev;
 }
+EXPORT_SYMBOL_GPL(rio_get_asm);
 
 /**
  * rio_get_device - Begin or continue searching for a RIO device by vid/did
@@ -1469,6 +1479,7 @@ struct rio_dev *rio_get_device(u16 vid, u16 did, struct rio_dev *from)
 {
 	return rio_get_asm(vid, did, RIO_ANY_ID, RIO_ANY_ID, from);
 }
+EXPORT_SYMBOL_GPL(rio_get_device);
 
 /**
  * rio_std_route_add_entry - Add switch route table entry using standard
@@ -2203,6 +2214,7 @@ int rio_init_mports(void)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rio_init_mports);
 
 static int rio_get_hdid(int index)
 {
@@ -2317,16 +2329,3 @@ int rio_unregister_mport(struct rio_mport *port)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rio_unregister_mport);
-
-EXPORT_SYMBOL_GPL(rio_local_get_device_id);
-EXPORT_SYMBOL_GPL(rio_get_device);
-EXPORT_SYMBOL_GPL(rio_get_asm);
-EXPORT_SYMBOL_GPL(rio_request_inb_dbell);
-EXPORT_SYMBOL_GPL(rio_release_inb_dbell);
-EXPORT_SYMBOL_GPL(rio_request_outb_dbell);
-EXPORT_SYMBOL_GPL(rio_release_outb_dbell);
-EXPORT_SYMBOL_GPL(rio_request_inb_mbox);
-EXPORT_SYMBOL_GPL(rio_release_inb_mbox);
-EXPORT_SYMBOL_GPL(rio_request_outb_mbox);
-EXPORT_SYMBOL_GPL(rio_release_outb_mbox);
-EXPORT_SYMBOL_GPL(rio_init_mports);
-- 
2.15.1

