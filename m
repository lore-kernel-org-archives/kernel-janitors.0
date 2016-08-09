From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 09 Aug 2016 16:11:02 +0000
Subject: [PATCH] NFC: pn533: constify pn533_phy_ops structures
Message-Id: <1470759062-21276-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: kernel-janitors@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org

The pn533_phy_ops are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/nfc/pn533/i2c.c   |    2 +-
 drivers/nfc/pn533/pn533.c |    2 +-
 drivers/nfc/pn533/pn533.h |    4 ++--
 drivers/nfc/pn533/usb.c   |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index 1dc8924..8a7c17e 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -176,7 +176,7 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct pn533_phy_ops i2c_phy_ops = {
+static const struct pn533_phy_ops i2c_phy_ops = {
 	.send_frame = pn533_i2c_send_frame,
 	.send_ack = pn533_i2c_send_ack,
 	.abort_cmd = pn533_i2c_abort_cmd,
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index d9c5583..2f817b3 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2560,7 +2560,7 @@ struct pn533 *pn533_register_device(u32 device_type,
 				u32 protocols,
 				enum pn533_protocol_type protocol_type,
 				void *phy,
-				struct pn533_phy_ops *phy_ops,
+				const struct pn533_phy_ops *phy_ops,
 				struct pn533_frame_ops *fops,
 				struct device *dev,
 				struct device *parent)
diff --git a/drivers/nfc/pn533/pn533.h b/drivers/nfc/pn533/pn533.h
index 553c7d1..e26d634 100644
--- a/drivers/nfc/pn533/pn533.h
+++ b/drivers/nfc/pn533/pn533.h
@@ -179,7 +179,7 @@ struct pn533 {
 
 	struct device *dev;
 	void *phy;
-	struct pn533_phy_ops *phy_ops;
+	const struct pn533_phy_ops *phy_ops;
 };
 
 typedef int (*pn533_send_async_complete_t) (struct pn533 *dev, void *arg,
@@ -226,7 +226,7 @@ struct pn533 *pn533_register_device(u32 device_type,
 				u32 protocols,
 				enum pn533_protocol_type protocol_type,
 				void *phy,
-				struct pn533_phy_ops *phy_ops,
+				const struct pn533_phy_ops *phy_ops,
 				struct pn533_frame_ops *fops,
 				struct device *dev,
 				struct device *parent);
diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index 33ed78b..bcf3f54 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -434,7 +434,7 @@ static void pn533_send_complete(struct urb *urb)
 	}
 }
 
-static struct pn533_phy_ops usb_phy_ops = {
+static const struct pn533_phy_ops usb_phy_ops = {
 	.send_frame = pn533_usb_send_frame,
 	.send_ack = pn533_usb_send_ack,
 	.abort_cmd = pn533_usb_abort_cmd,

