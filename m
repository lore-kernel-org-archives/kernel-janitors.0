From: Manish Katiyar <mkatiyar@gmail.com>
Date: Mon, 19 Jan 2009 13:41:53 +0000
Subject: [PATCH] : Remove unused variable pdev from drivers/net/r6040.c
Message-Id: <ea11fea30901190529k6f12f4c1xed7295ccbf0dcefa@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200901191441.24992.florian@openwrt.org>
In-Reply-To: <200901191441.24992.florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Below patch removes the following compilation warning.

drivers/net/r6040.c:441: warning: unused variable 'pdev'


Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>
---
 drivers/net/r6040.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/r6040.c b/drivers/net/r6040.c
index 72fd9e9..b2dcdb5 100644
--- a/drivers/net/r6040.c
+++ b/drivers/net/r6040.c
@@ -438,7 +438,6 @@ static void r6040_down(struct net_device *dev)
 {
        struct r6040_private *lp = netdev_priv(dev);
        void __iomem *ioaddr = lp->base;
-       struct pci_dev *pdev = lp->pdev;
        int limit = 2048;
        u16 *adrp;
        u16 cmd;
-- 
1.5.4.3


Thanks -
Manish
