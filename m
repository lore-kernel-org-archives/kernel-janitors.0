From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 08:06:06 +0000
Subject: [PATCH net] net: stmmac: Fix an error code in probe()
Message-Id: <20181217080606.GA21139@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

The function should return an error if create_singlethread_workqueue()
fails.

Fixes: 34877a15f787 ("net: stmmac: Rework and fix TX Timeout code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5551fead8f66..c4a35e932f05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4250,6 +4250,7 @@ int stmmac_dvr_probe(struct device *device,
 	priv->wq = create_singlethread_workqueue("stmmac_wq");
 	if (!priv->wq) {
 		dev_err(priv->device, "failed to create workqueue\n");
+		ret = -ENOMEM;
 		goto error_wq;
 	}
 
-- 
2.17.1
