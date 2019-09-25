From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 10:56:38 +0000
Subject: [PATCH net] net: netsec: Fix signedness bug in netsec_probe()
Message-Id: <20190925105638.GE3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

The "priv->phy_interface" variable is an enum and in this context GCC
will treat it as an unsigned int so the error handling is never
triggered.

Fixes: 533dd11a12f6 ("net: socionext: Add Synquacer NetSec driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/socionext/netsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index 1502fe8b0456..55db7fbd43cc 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -2007,7 +2007,7 @@ static int netsec_probe(struct platform_device *pdev)
 			   NETIF_MSG_LINK | NETIF_MSG_PROBE;
 
 	priv->phy_interface = device_get_phy_mode(&pdev->dev);
-	if (priv->phy_interface < 0) {
+	if ((int)priv->phy_interface < 0) {
 		dev_err(&pdev->dev, "missing required property 'phy-mode'\n");
 		ret = -ENODEV;
 		goto free_ndev;
-- 
2.20.1
