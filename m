From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 19:17:36 +0000
Subject: [PATCH 1/5] mtip32xx: Delete an error message for a failed memory allocation in five functions
Message-Id: <53e47438-4ac6-4b1b-f478-0e361692c563@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
In-Reply-To: <524db5d1-1411-a839-6461-7c33403c1843@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart Van Assche <Bart.VanAssche@sandisk.com>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <jthumshirn@suse.de>, Ming Lei <ming.lei@redhat.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 19:09:04 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/mtip32xx/mtip32xx.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 4a3cfc7940de..5ccbab619e57 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -2379,11 +2379,8 @@ static ssize_t mtip_hw_read_device_status(struct file *f, char __user *ubuf,
 		return 0;
 
 	buf = kzalloc(MTIP_DFS_MAX_BUF_SIZE, GFP_KERNEL);
-	if (!buf) {
-		dev_err(&dd->pdev->dev,
-			"Memory allocation: status buffer\n");
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	size += show_device_status(NULL, buf);
 
@@ -2409,11 +2406,8 @@ static ssize_t mtip_hw_read_registers(struct file *f, char __user *ubuf,
 		return 0;
 
 	buf = kzalloc(MTIP_DFS_MAX_BUF_SIZE, GFP_KERNEL);
-	if (!buf) {
-		dev_err(&dd->pdev->dev,
-			"Memory allocation: register buffer\n");
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	size += sprintf(&buf[size], "H/ S ACTive      : [ 0x");
 
@@ -2475,11 +2469,8 @@ static ssize_t mtip_hw_read_flags(struct file *f, char __user *ubuf,
 		return 0;
 
 	buf = kzalloc(MTIP_DFS_MAX_BUF_SIZE, GFP_KERNEL);
-	if (!buf) {
-		dev_err(&dd->pdev->dev,
-			"Memory allocation: flag buffer\n");
+	if (!buf)
 		return -ENOMEM;
-	}
 
 	size += sprintf(&buf[size], "Flag-port : [ %08lX ]\n",
 							dd->port->flags);
@@ -3031,11 +3022,8 @@ static int mtip_hw_init(struct driver_data *dd)
 
 	dd->port = kzalloc_node(sizeof(struct mtip_port), GFP_KERNEL,
 				dd->numa_node);
-	if (!dd->port) {
-		dev_err(&dd->pdev->dev,
-			"Memory allocation: port structure\n");
+	if (!dd->port)
 		return -ENOMEM;
-	}
 
 	/* Continue workqueue setup */
 	for (i = 0; i < MTIP_MAX_SLOT_GROUPS; i++)
@@ -4228,11 +4216,8 @@ static int mtip_pci_probe(struct pci_dev *pdev,
 		cpu_to_node(raw_smp_processor_id()), raw_smp_processor_id());
 
 	dd = kzalloc_node(sizeof(struct driver_data), GFP_KERNEL, my_node);
-	if (dd = NULL) {
-		dev_err(&pdev->dev,
-			"Unable to allocate memory for driver data\n");
+	if (!dd)
 		return -ENOMEM;
-	}
 
 	/* Attach the private data to this PCI device.  */
 	pci_set_drvdata(pdev, dd);
-- 
2.13.4

