From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 19:07:21 +0000
Subject: [PATCH 1/2] sn/ioc3: Delete an error message for a failed memory allocation in ioc3_probe()
Message-Id: <9cfe5f4c-92cf-8f6b-c302-59d471c4a7c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5248143d-b207-536a-16eb-ea899cd639b8@users.sourceforge.net>
In-Reply-To: <5248143d-b207-536a-16eb-ea899cd639b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 19:39:18 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/sn/ioc3.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/sn/ioc3.c b/drivers/sn/ioc3.c
index fb7ea0d9a734..2e6e0514d8f7 100644
--- a/drivers/sn/ioc3.c
+++ b/drivers/sn/ioc3.c
@@ -631,9 +631,6 @@ static int ioc3_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	/* Set up per-IOC3 data */
 	idd = kzalloc(sizeof(struct ioc3_driver_data), GFP_KERNEL);
 	if (!idd) {
-		printk(KERN_WARNING
-		       "%s: Failed to allocate IOC3 data for pci_dev %s.\n",
-		       __func__, pci_name(pdev));
 		ret = -ENODEV;
 		goto out_idd;
 	}
-- 
2.15.1

