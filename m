From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Wed, 14 Nov 2012 10:12:57 +0000
Subject: [PATCH] staging: rtl8187se: r8180_core.c: Inspect the return value of register_netdev()
Message-Id: <1352887257-23142-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: amiller@amilx.com, akpm@linux-foundation.org, joe@perches.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Inspect the return value of register_netdev() in the driver probe routine and
return -ENODEV in case of error.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/rtl8187se/r8180_core.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8187se/r8180_core.c b/drivers/staging/rtl8187se/r8180_core.c
index 20e5fb5..833b083 100644
--- a/drivers/staging/rtl8187se/r8180_core.c
+++ b/drivers/staging/rtl8187se/r8180_core.c
@@ -3638,7 +3638,8 @@ static int __devinit rtl8180_pci_probe(struct pci_dev *pdev,
 
 	netif_carrier_off(dev);
 
-	register_netdev(dev);
+	if (register_netdev(dev))
+		goto fail1;
 
 	rtl8180_proc_init_one(dev);
 
-- 
1.7.9.5

