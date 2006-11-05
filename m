From: Thomas Hisch <t.hisch@gmail.com>
Date: Sun, 05 Nov 2006 21:31:24 +0000
Subject: [KJ] [Patch] Fix small typo in drivers/serial/icom.c
Message-Id: <Pine.LNX.4.64.0611052227220.18111@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


I noticed a typo in driver/serial/icon.c.

-thi-

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
  drivers/serial/icom.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/icom.c b/drivers/serial/icom.c
index a3c00a2..498f708 100644
--- a/drivers/serial/icom.c
+++ b/drivers/serial/icom.c
@@ -1511,7 +1511,7 @@ static int __devinit icom_probe(struct p
  	}

  	if ( (retval = pci_request_regions(dev, "icom"))) {
-		 dev_err(&dev->dev, "pci_request_region FAILED\n");
+		 dev_err(&dev->dev, "pci_request_regions FAILED\n");
  		 pci_disable_device(dev);
  		 return retval;
  	 }
-- 
1.4.2.1.g80823

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
