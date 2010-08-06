From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:51:41 +0000
Subject: [PATCH 07/18] isdn: avm: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124303-13537-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Alexey Dobriyan <adobriyan@gmail.com>, Tilman Schmidt <tilman@imap.cc>, netdev@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/isdn/hardware/avm/t1pci.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/hardware/avm/t1pci.c b/drivers/isdn/hardware/avm/t1pci.c
index 5a3f830..e891ed6 100644
--- a/drivers/isdn/hardware/avm/t1pci.c
+++ b/drivers/isdn/hardware/avm/t1pci.c
@@ -210,6 +210,8 @@ static int __devinit t1pci_probe(struct pci_dev *dev,
 	if (retval != 0) {
 		printk(KERN_ERR "t1pci: no AVM-T1-PCI at i/o %#x, irq %d detected, mem %#x\n",
 		       param.port, param.irq, param.membase);
+		if (retval != -EBUSY)
+			pci_disable_device(dev);
 		return -ENODEV;
 	}
 	return 0;
-- 
1.7.0.4

