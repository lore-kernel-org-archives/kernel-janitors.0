From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 19:08:26 +0000
Subject: [PATCH 2/2] sn/ioc3: Improve a size determination in ioc3_probe()
Message-Id: <347f356e-02e4-b2bf-15b6-8177f53e74b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5248143d-b207-536a-16eb-ea899cd639b8@users.sourceforge.net>
In-Reply-To: <5248143d-b207-536a-16eb-ea899cd639b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 19:53:18 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/sn/ioc3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/sn/ioc3.c b/drivers/sn/ioc3.c
index 2e6e0514d8f7..1cacc6178e6f 100644
--- a/drivers/sn/ioc3.c
+++ b/drivers/sn/ioc3.c
@@ -629,7 +629,7 @@ static int ioc3_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 #endif
 
 	/* Set up per-IOC3 data */
-	idd = kzalloc(sizeof(struct ioc3_driver_data), GFP_KERNEL);
+	idd = kzalloc(sizeof(*idd), GFP_KERNEL);
 	if (!idd) {
 		ret = -ENODEV;
 		goto out_idd;
-- 
2.15.1

