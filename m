From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Nov 2013 08:42:11 +0000
Subject: [patch] usb: gadget: update some out of date comments
Message-Id: <20131114084211.GA30780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These functions used to return negative errror codes but now they return
ERR_PTRs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/u_ether.h b/drivers/usb/gadget/u_ether.h
index fb23d1f..a32b41e 100644
--- a/drivers/usb/gadget/u_ether.h
+++ b/drivers/usb/gadget/u_ether.h
@@ -106,7 +106,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
  * gadget driver using this framework.  The link layer addresses are
  * set up using module parameters.
  *
- * Returns negative errno, or zero on success
+ * Returns a eth_dev pointer on success, or an ERR_PTR on failure
  */
 static inline struct eth_dev *gether_setup(struct usb_gadget *g,
 		const char *dev_addr, const char *host_addr,
diff --git a/drivers/usb/gadget/u_ether.c b/drivers/usb/gadget/u_ether.c
index 2aae0d6..b7d4f82 100644
--- a/drivers/usb/gadget/u_ether.c
+++ b/drivers/usb/gadget/u_ether.c
@@ -753,7 +753,7 @@ static struct device_type gadget_type = {
  * gadget driver using this framework.  The link layer addresses are
  * set up using module parameters.
  *
- * Returns negative errno, or zero on success
+ * Returns an eth_dev pointer on success, or an ERR_PTR on failure.
  */
 struct eth_dev *gether_setup_name(struct usb_gadget *g,
 		const char *dev_addr, const char *host_addr,
