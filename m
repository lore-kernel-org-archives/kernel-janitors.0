From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:06:43 +0000
Subject: [PATCH 09/14] vme: ca91cx42: Delete eight error messages for a failed memory allocation
Message-Id: <e463aed0-6627-0bdd-2608-7e34a8866a95@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 10:20:03 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_ca91cx42.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/vme/bridges/vme_ca91cx42.c b/drivers/vme/bridges/vme_ca91cx42.c
index 7cc51223db1c..d25f997e8aeb 100644
--- a/drivers/vme/bridges/vme_ca91cx42.c
+++ b/drivers/vme/bridges/vme_ca91cx42.c
@@ -538,5 +538,3 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
-			dev_err(ca91cx42_bridge->parent, "Unable to allocate "
-				"memory for resource name\n");
 			retval = -ENOMEM;
 			goto err_name;
 		}
@@ -1041,5 +1039,3 @@ static int ca91cx42_dma_list_add(struct vme_dma_list *list,
-		dev_err(dev, "Failed to allocate memory for dma resource "
-			"structure\n");
 		retval = -ENOMEM;
 		goto err_mem;
 	}
@@ -1624,5 +1620,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for device "
-			"structure\n");
 		retval = -ENOMEM;
 		goto err_struct;
 	}
@@ -1634,5 +1628,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for device "
-			"structure\n");
 		retval = -ENOMEM;
 		goto err_driver;
 	}
@@ -1694,5 +1686,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"master resource structure\n");
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -1720,5 +1710,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"slave resource structure\n");
 			retval = -ENOMEM;
 			goto err_slave;
 		}
@@ -1747,5 +1735,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"dma resource structure\n");
 			retval = -ENOMEM;
 			goto err_dma;
 		}
@@ -1767,5 +1753,3 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for "
-		"location monitor resource structure\n");
 		retval = -ENOMEM;
 		goto err_lm;
 	}
-- 
2.14.0

