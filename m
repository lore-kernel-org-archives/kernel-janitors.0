From: kbuild test robot <lkp@intel.com>
Date: Fri, 27 Mar 2020 01:12:01 +0000
Subject: [kbuild-all] [RFC PATCH v2] usb: cdns3: cdns3_clear_register_bit() can be static
Message-Id: <20200327011201.GU11705@shao2-debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200325125041.94769-1-colin.king@canonical.com>
In-Reply-To: <20200325125041.94769-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 gadget.c |   32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 372460ea4df9a..54a04614d336f 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -82,7 +82,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
  * @ptr: address of device controller register to be read and changed
  * @mask: bits requested to clar
  */
-void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
+static void cdns3_clear_register_bit(void __iomem *ptr, u32 mask)
 {
 	mask = readl(ptr) & ~mask;
 	writel(mask, ptr);
@@ -137,7 +137,7 @@ struct usb_request *cdns3_next_request(struct list_head *list)
  *
  * Returns buffer or NULL if no buffers in list
  */
-struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
+static struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
 }
@@ -148,7 +148,7 @@ struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
  *
  * Returns request or NULL if no requests in list
  */
-struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
+static struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
 {
 	return list_first_entry_or_null(list, struct cdns3_request, list);
 }
@@ -190,7 +190,7 @@ dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
 	return priv_ep->trb_pool_dma + offset;
 }
 
-int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
+static int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
 {
 	switch (priv_ep->type) {
 	case USB_ENDPOINT_XFER_ISOC:
@@ -345,7 +345,7 @@ static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
 	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
 }
 
-void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
+static void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
 {
 	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
 	int current_trb = priv_req->start_trb;
@@ -511,9 +511,9 @@ static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
 	}
 }
 
-struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
-					      struct cdns3_endpoint *priv_ep,
-					      struct cdns3_request *priv_req)
+static struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
+						     struct cdns3_endpoint *priv_ep,
+						     struct cdns3_request *priv_req)
 {
 	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN &&
 	    priv_req->flags & REQUEST_INTERNAL) {
@@ -551,9 +551,9 @@ struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
 	return &priv_req->request;
 }
 
-int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
-			      struct cdns3_endpoint *priv_ep,
-			      struct cdns3_request *priv_req)
+static int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
+				     struct cdns3_endpoint *priv_ep,
+				     struct cdns3_request *priv_req)
 {
 	int deferred = 0;
 
@@ -836,7 +836,7 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
 }
 
-void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
+static void cdns3_wa1_restore_cycle_bit(struct cdns3_endpoint *priv_ep)
 {
 	/* Work around for stale data address in TRB*/
 	if (priv_ep->wa1_set) {
@@ -1904,8 +1904,8 @@ static int cdns3_ep_onchip_buffer_reserve(struct cdns3_device *priv_dev,
 	return 0;
 }
 
-void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
-			      struct cdns3_endpoint *priv_ep)
+static void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
+				     struct cdns3_endpoint *priv_ep)
 {
 	if (!priv_ep->use_streams || priv_dev->gadget.speed < USB_SPEED_SUPER)
 		return;
@@ -1925,8 +1925,8 @@ void cdns3_stream_ep_reconfig(struct cdns3_device *priv_dev,
 			       EP_CFG_TDL_CHK | EP_CFG_SID_CHK);
 }
 
-void cdns3_configure_dmult(struct cdns3_device *priv_dev,
-			   struct cdns3_endpoint *priv_ep)
+static void cdns3_configure_dmult(struct cdns3_device *priv_dev,
+				  struct cdns3_endpoint *priv_ep)
 {
 	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
 
