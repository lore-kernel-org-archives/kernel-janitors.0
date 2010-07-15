From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 18:44:54 +0000
Subject: [PATCH 3/8] drivers: irda: fix sign bug
Message-Id: <1279219494-12408-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Samuel Ortiz <samuel@sortiz.org>, "David S. Miller" <davem@davemloft.net>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, netdev@vger.kernel.org

platform_get_irq_byname() can return negative results, it is not seen to
unsigned irq. Make it signed.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/irda/sh_irda.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/irda/sh_irda.c b/drivers/net/irda/sh_irda.c
index 9a828b0..edd5666 100644
--- a/drivers/net/irda/sh_irda.c
+++ b/drivers/net/irda/sh_irda.c
@@ -749,7 +749,7 @@ static int __devinit sh_irda_probe(struct platform_device *pdev)
 	struct sh_irda_self *self;
 	struct resource *res;
 	char clk_name[8];
-	unsigned int irq;
+	int irq;
 	int err = -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.0.4

