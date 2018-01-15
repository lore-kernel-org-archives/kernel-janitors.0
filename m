From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:14:22 +0000
Subject: [PATCH 1/3] mfd/sm501: Delete an error message for a failed memory allocation in two functions
Message-Id: <132f079f-8f99-329f-105b-91542ed7fcca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
In-Reply-To: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:40:46 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/sm501.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index ad774161a22d..7298d6b571a1 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1385,7 +1385,6 @@ static int sm501_plat_probe(struct platform_device *dev)
 
 	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
 	if (sm = NULL) {
-		dev_err(&dev->dev, "no memory for device data\n");
 		ret = -ENOMEM;
 		goto err1;
 	}
@@ -1575,7 +1574,6 @@ static int sm501_pci_probe(struct pci_dev *dev,
 
 	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
 	if (sm = NULL) {
-		dev_err(&dev->dev, "no memory for device data\n");
 		err = -ENOMEM;
 		goto err1;
 	}
-- 
2.15.1

