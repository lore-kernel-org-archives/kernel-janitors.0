From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 21 Jul 2010 12:00:36 +0000
Subject: [PATCH] 3c59x: handle pci_iomap() errors
Message-Id: <1279713638-31567-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Steffen Klassert <klassert@mathematik.tu-chemnitz.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Joe Perches <joe@perches.com>, netdev@vger.kernel.org

pci_iomap() can fail, handle this case and return -ENOMEM from probe
function.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/3c59x.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/net/3c59x.c b/drivers/net/3c59x.c
index 069a03f..9b137e1 100644
--- a/drivers/net/3c59x.c
+++ b/drivers/net/3c59x.c
@@ -1020,6 +1020,11 @@ static int __devinit vortex_init_one(struct pci_dev *pdev,
 	ioaddr = pci_iomap(pdev, pci_bar, 0);
 	if (!ioaddr) /* If mapping fails, fall-back to BAR 0... */
 		ioaddr = pci_iomap(pdev, 0, 0);
+	if (!ioaddr) {
+		pci_disable_device(pdev);
+		rc = -ENOMEM;
+		goto out;
+	}
 
 	rc = vortex_probe1(&pdev->dev, ioaddr, pdev->irq,
 			   ent->driver_data, unit);
-- 
1.7.0.4

