From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:15 +0000
Subject: [PATCH 11/19] drivers/net/irda: use for_each_pci_dev()
Message-Id: <1278173056-11779-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Samuel Ortiz <samuel@sortiz.org>, "David S. Miller" <davem@davemloft.net>, Stephen Hemminger <shemminger@vyatta.com>, Jiri Kosina <jkosina@suse.cz>, Joe Perches <joe@perches.com>, Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/irda/smsc-ircc2.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/net/irda/smsc-ircc2.c b/drivers/net/irda/smsc-ircc2.c
index d67e484..850ca1c 100644
--- a/drivers/net/irda/smsc-ircc2.c
+++ b/drivers/net/irda/smsc-ircc2.c
@@ -2848,9 +2848,7 @@ static int __init smsc_ircc_preconfigure_subsystems(unsigned short ircc_cfg,
 	unsigned short ss_device = 0x0000;
 	int ret = 0;
 
-	dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-
-	while (dev != NULL) {
+	for_each_pci_dev(dev) {
 		struct smsc_ircc_subsystem_configuration *conf;
 
 		/*
@@ -2899,7 +2897,6 @@ static int __init smsc_ircc_preconfigure_subsystems(unsigned short ircc_cfg,
 					ret = -ENODEV;
 			}
 		}
-		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
 	}
 
 	return ret;
-- 
1.7.0.4

