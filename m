From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Thu, 15 Nov 2012 17:34:13 +0000
Subject: [PATCH] staging: rtl8192e: rtl8192e: rtl_core.c: Audit the return value of register_netdev()
Message-Id: <1353000133-13462-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: seanm@seanm.ca, s.l-h@gmx.de, tim.gardner@canonical.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Inspect the return value of register_netdev() in the driver probe routine and
return -ENODEV in case of error.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 81134d3..f68df24 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2955,7 +2955,8 @@ static int __devinit rtl8192_pci_probe(struct pci_dev *pdev,
 	netif_carrier_off(dev);
 	netif_stop_queue(dev);
 
-	register_netdev(dev);
+	if (register_netdev(dev))
+		goto err_free_irq;
 	RT_TRACE(COMP_INIT, "dev name: %s\n", dev->name);
 
 	rtl8192_proc_init_one(dev);
-- 
1.7.9.5

