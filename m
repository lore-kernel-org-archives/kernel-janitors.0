From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:51:35 +0000
Subject: [PATCH 06/18] isdn: avm: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124297-13492-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Alexey Dobriyan <adobriyan@gmail.com>, Tilman Schmidt <tilman@imap.cc>, Tejun Heo <tj@kernel.org>, netdev@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/isdn/hardware/avm/c4.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/isdn/hardware/avm/c4.c b/drivers/isdn/hardware/avm/c4.c
index 7715d32..f255001 100644
--- a/drivers/isdn/hardware/avm/c4.c
+++ b/drivers/isdn/hardware/avm/c4.c
@@ -1273,6 +1273,8 @@ static int __devinit c4_probe(struct pci_dev *dev,
 	if (retval != 0) {
 		printk(KERN_ERR "c4: no AVM-C%d at i/o %#x, irq %d detected, mem %#x\n",
 		       nr, param.port, param.irq, param.membase);
+		if (retval != -EBUSY)
+			pci_disable_device(dev);
 		return -ENODEV;
 	}
 	return 0;
-- 
1.7.0.4

