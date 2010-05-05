From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 05 May 2010 09:18:41 +0000
Subject: [PATCH] USB: isp1760: Use resource_size
Message-Id: <1273051121-12861-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/usb/host/isp1760-if.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index 42a0946..8f0259e 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -36,7 +36,7 @@ static int of_isp1760_probe(struct of_device *dev,
 	struct resource memory;
 	struct of_irq oirq;
 	int virq;
-	u64 res_len;
+	resource_size_t res_len;
 	int ret;
 	const unsigned int *prop;
 	unsigned int devflags = 0;
@@ -45,13 +45,12 @@ static int of_isp1760_probe(struct of_device *dev,
 	if (ret)
 		return -ENXIO;
 
-	res = request_mem_region(memory.start, memory.end - memory.start + 1,
-			dev_name(&dev->dev));
+	res_len = resource_size(&memory);
+
+	res = request_mem_region(memory.start, res_len, dev_name(&dev->dev));
 	if (!res)
 		return -EBUSY;
 
-	res_len = memory.end - memory.start + 1;
-
 	if (of_irq_map_one(dp, 0, &oirq)) {
 		ret = -ENODEV;
 		goto release_reg;
@@ -92,7 +91,7 @@ static int of_isp1760_probe(struct of_device *dev,
 	return ret;
 
 release_reg:
-	release_mem_region(memory.start, memory.end - memory.start + 1);
+	release_mem_region(memory.start, res_len);
 	return ret;
 }
 
-- 
1.6.3.3

