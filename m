From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 23 Jul 2010 16:44:44 +0000
Subject: [PATCH] net: 3c59x: fix leak of iomaps
Message-Id: <1279903485-28247-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Steffen Klassert <klassert@mathematik.tu-chemnitz.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Joe Perches <joe@perches.com>, netdev@vger.kernel.org

If vortex_probe1() fails we should unmap ioaddr mapped earlier.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/3c59x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/3c59x.c b/drivers/net/3c59x.c
index 9b137e1..ebd4c19 100644
--- a/drivers/net/3c59x.c
+++ b/drivers/net/3c59x.c
@@ -1029,6 +1029,7 @@ static int __devinit vortex_init_one(struct pci_dev *pdev,
 	rc = vortex_probe1(&pdev->dev, ioaddr, pdev->irq,
 			   ent->driver_data, unit);
 	if (rc < 0) {
+		pci_iounmap(pdev, ioaddr);
 		pci_disable_device(pdev);
 		goto out;
 	}
-- 
1.7.0.4

