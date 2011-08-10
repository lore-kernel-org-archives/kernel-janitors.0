From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Aug 2011 08:47:16 +0000
Subject: [PATCH] drivers/mfd/timberdale.c: clean up error handling code
Message-Id: <1312966036-15896-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the first three cases, ioremap has been called, so iounmap is needed.  A
new label for this is introduced, to differentiate it from err_msix, which
is the first point at which msix_entries actually needs to be freed.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mfd/timberdale.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/timberdale.c b/drivers/mfd/timberdale.c
index 696879e..02d6569 100644
--- a/drivers/mfd/timberdale.c
+++ b/drivers/mfd/timberdale.c
@@ -697,7 +697,7 @@ static int __devinit timb_probe(struct pci_dev *dev,
 		dev_err(&dev->dev, "The driver supports an older "
 			"version of the FPGA, please update the driver to "
 			"support %d.%d\n", priv->fw.major, priv->fw.minor);
-		goto err_ioremap;
+		goto err_config;
 	}
 	if (priv->fw.major < TIMB_SUPPORTED_MAJOR ||
 		priv->fw.minor < TIMB_REQUIRED_MINOR) {
@@ -705,13 +705,13 @@ static int __devinit timb_probe(struct pci_dev *dev,
 			"please upgrade the FPGA to at least: %d.%d\n",
 			priv->fw.major, priv->fw.minor,
 			TIMB_SUPPORTED_MAJOR, TIMB_REQUIRED_MINOR);
-		goto err_ioremap;
+		goto err_config;
 	}
 
 	msix_entries = kzalloc(TIMBERDALE_NR_IRQS * sizeof(*msix_entries),
 		GFP_KERNEL);
 	if (!msix_entries)
-		goto err_ioremap;
+		goto err_config;
 
 	for (i = 0; i < TIMBERDALE_NR_IRQS; i++)
 		msix_entries[i].entry = i;
@@ -825,6 +825,8 @@ err_mfd:
 err_create_file:
 	pci_disable_msix(dev);
 err_msix:
+	kfree(msix_entries);
+err_config:
 	iounmap(priv->ctl_membase);
 err_ioremap:
 	release_mem_region(priv->ctl_mapbase, CHIPCTLSIZE);
@@ -833,7 +835,6 @@ err_request:
 err_start:
 	pci_disable_device(dev);
 err_enable:
-	kfree(msix_entries);
 	kfree(priv);
 	pci_set_drvdata(dev, NULL);
 	return -ENODEV;

