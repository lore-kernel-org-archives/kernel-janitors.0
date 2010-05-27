From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 16:10:08 +0000
Subject: [PATCH] drivers/usb/host: Eliminate NULL dereference
Message-Id: <Pine.LNX.4.64.1005271809090.5422@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Vrabel <david.vrabel@csr.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The test above allows std to be NULL, so check that std is not NULL before
doing the dereference.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E,E1;
identifier f;
statement S1,S2,S3;
@@

if ((E = NULL && ...) || ...)
{
  ... when != if (...) S1 else S2
      when != E = E1
* E->f
  ... when any
}
else S3
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff --git a/drivers/usb/host/whci/qset.c b/drivers/usb/host/whci/qset.c
index ab5a14f..dc0ab83 100644
--- a/drivers/usb/host/whci/qset.c
+++ b/drivers/usb/host/whci/qset.c
@@ -475,7 +475,7 @@ static int qset_add_urb_sg(struct whc *whc, struct whc_qset *qset, struct urb *u
 			    || (prev_end & (WHCI_PAGE_SIZE-1))
 			    || (dma_addr & (WHCI_PAGE_SIZE-1))
 			    || std->len + WHCI_PAGE_SIZE > QTD_MAX_XFER_SIZE) {
-				if (std->len % qset->max_packet != 0)
+				if (std && std->len % qset->max_packet != 0)
 					return -EINVAL;
 				std = qset_new_std(whc, qset, urb, mem_flags);
 				if (std = NULL) {
