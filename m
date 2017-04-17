From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Apr 2017 15:17:13 +0000
Subject: [PATCH 07/25] net: mvpp2: Improve another size determination in mvpp2_init()
Message-Id: <9efcf14a-9531-084a-f26f-c9e5eb767f9b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d6f26bba-c678-5b66-4f5d-85f56d895190@users.sourceforge.net>
In-Reply-To: <d6f26bba-c678-5b66-4f5d-85f56d895190@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jarod Wilson <jarod@redhat.com>, Jisheng Zhang <jszhang@marvell.com>, Mirko Lindner <mlindner@marvell.com>, Philippe Reynes <tremyfr@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Stephen Hemminger <stephen@networkplumber.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Apr 2017 08:48:23 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/marvell/mvpp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/marvell/mvpp2.c
index 04aba2307b60..e35c4d0b112a 100644
--- a/drivers/net/ethernet/marvell/mvpp2.c
+++ b/drivers/net/ethernet/marvell/mvpp2.c
@@ -6806,7 +6806,7 @@ static int mvpp2_init(struct platform_device *pdev, struct mvpp2 *priv)
 
 	/* Allocate and initialize aggregated TXQs */
 	priv->aggr_txqs = devm_kcalloc(&pdev->dev, num_present_cpus(),
-				       sizeof(struct mvpp2_tx_queue),
+				       sizeof(*priv->aggr_txqs),
 				       GFP_KERNEL);
 	if (!priv->aggr_txqs)
 		return -ENOMEM;
-- 
2.12.2

