From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:13:51 +0000
Subject: [PATCH 12/14] vme: tsi148: Delete nine error messages for a failed memory allocation
Message-Id: <578ac7ad-3d13-2bb4-e06e-815fba5d8a19@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 11:10:07 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_tsi148.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/vme/bridges/vme_tsi148.c b/drivers/vme/bridges/vme_tsi148.c
index fc1b634b969a..fb91fddc6312 100644
--- a/drivers/vme/bridges/vme_tsi148.c
+++ b/drivers/vme/bridges/vme_tsi148.c
@@ -754,5 +754,3 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
-			dev_err(tsi148_bridge->parent, "Unable to allocate "
-				"memory for resource name\n");
 			retval = -ENOMEM;
 			goto err_name;
 		}
@@ -1646,5 +1644,3 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
-		dev_err(tsi148_bridge->parent, "Failed to allocate memory for "
-			"dma resource structure\n");
 		retval = -ENOMEM;
 		goto err_mem;
 	}
@@ -2299,5 +2295,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for device "
-			"structure\n");
 		retval = -ENOMEM;
 		goto err_struct;
 	}
@@ -2308,5 +2302,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for device "
-			"structure\n");
 		retval = -ENOMEM;
 		goto err_driver;
 	}
@@ -2376,5 +2368,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"flush resource structure\n");
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -2395,5 +2385,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"master resource structure\n");
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -2424,5 +2412,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"slave resource structure\n");
 			retval = -ENOMEM;
 			goto err_slave;
 		}
@@ -2448,5 +2434,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-			dev_err(&pdev->dev, "Failed to allocate memory for "
-			"dma resource structure\n");
 			retval = -ENOMEM;
 			goto err_dma;
 		}
@@ -2470,5 +2454,3 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-		dev_err(&pdev->dev, "Failed to allocate memory for "
-		"location monitor resource structure\n");
 		retval = -ENOMEM;
 		goto err_lm;
 	}
-- 
2.14.0

