From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Nov 2014 10:36:08 +0000
Subject: [patch 2/2 -next] mfd: dln2: a couple endian fixes
Message-Id: <20141113103607.GB17038@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Octavian Purdila <octavian.purdila@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse catches a couple endian bugs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 3101e5e..babf7b6 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -437,6 +437,7 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 handle, u16 cmd,
 	struct device *dev = &dln2->interface->dev;
 	const unsigned long timeout = DLN2_USB_TIMEOUT * HZ / 1000;
 	struct dln2_mod_rx_slots *rxs = &dln2->mod_rx_slots[handle];
+	int size;
 
 	spin_lock(&dln2->disconnect_lock);
 	if (!dln2->disconnect)
@@ -476,8 +477,9 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 handle, u16 cmd,
 
 	/* if we got here we know that the response header has been checked */
 	rsp = rxc->urb->transfer_buffer;
+	size = le16_to_cpu(rsp->hdr.size);
 
-	if (rsp->hdr.size < sizeof(*rsp)) {
+	if (size < sizeof(*rsp)) {
 		ret = -EPROTO;
 		goto out_free_rx_slot;
 	}
@@ -494,8 +496,8 @@ static int _dln2_transfer(struct dln2_dev *dln2, u16 handle, u16 cmd,
 		goto out_free_rx_slot;
 	}
 
-	if (*ibuf_len > rsp->hdr.size - sizeof(*rsp))
-		*ibuf_len = rsp->hdr.size - sizeof(*rsp);
+	if (*ibuf_len > size - sizeof(*rsp))
+		*ibuf_len = size - sizeof(*rsp);
 
 	memcpy(ibuf, rsp + 1, *ibuf_len);
 
