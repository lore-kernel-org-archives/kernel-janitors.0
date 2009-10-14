From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Wed, 14 Oct 2009 04:16:50 +0000
Subject: [PATCH] leds-ss4200: Check pci_enable_device return
Message-Id: <1255493810.28264.6.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

pci_enable_result is defined using the __must_check macro but leds-ss4200 is not checking the return value.

This patch solves the issue

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/leds/leds-ss4200.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index 0ec4ec3..1e72383 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -347,7 +347,10 @@ static int __devinit ich7_lpc_probe(struct pci_dev *dev,
 	int status = 0;
 	u32 gc = 0;
 
-	pci_enable_device(dev);
+	if ((status = pci_enable_device(dev))) {
+		dev_err(&dev->dev, "pci_enable_device failed\n");
+		goto out;
+	}
 
 	nas_gpio_pci_dev = dev;
 	status = pci_read_config_dword(dev, PMBASE, &g_pm_io_base);
-- 
1.6.0.4






