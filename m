From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 19:26:11 +0000
Subject: [patch] stmmac: fix an error code in stmmac_ptp_register()
Message-Id: <20161014192417.GC21917@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

PTR_ERR(NULL) is success.  We have to preserve the error code earlier.

Fixes: 7086605a6ab5 ("stmmac: fix error check when init ptp")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to net.git tree.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 289d527..5d61fb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -185,8 +185,10 @@ int stmmac_ptp_register(struct stmmac_priv *priv)
 	priv->ptp_clock = ptp_clock_register(&priv->ptp_clock_ops,
 					     priv->device);
 	if (IS_ERR(priv->ptp_clock)) {
+		int ret = PTR_ERR(priv->ptp_clock);
+
 		priv->ptp_clock = NULL;
-		return PTR_ERR(priv->ptp_clock);
+		return ret;
 	}
 
 	spin_lock_init(&priv->ptp_lock);
