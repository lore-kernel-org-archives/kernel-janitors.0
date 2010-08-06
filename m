From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:51:48 +0000
Subject: [PATCH 08/18] isdn: eicon: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124310-13582-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Armin Schindler <mac@melware.de>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Peter Huewe <peterhuewe@gmx.de>, Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/isdn/hardware/eicon/divasmain.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/hardware/eicon/divasmain.c b/drivers/isdn/hardware/eicon/divasmain.c
index ed9c555..61e077e 100644
--- a/drivers/isdn/hardware/eicon/divasmain.c
+++ b/drivers/isdn/hardware/eicon/divasmain.c
@@ -743,6 +743,7 @@ static int __devinit divas_init_one(struct pci_dev *pdev,
 			CardProperties[ent->driver_data].
 			Name, pdev->bus->number,
 			pdev->devfn);
+		pci_disable_device(pdev);
 		return (-EIO);
 	}
 
-- 
1.7.0.4

