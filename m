From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Mar 2016 12:04:08 +0000
Subject: [patch] libertas: fix an error code in probe
Message-Id: <20160308120408.GA28684@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success instead of a negative error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/libertas/main.c b/drivers/net/wireless/marvell/libertas/main.c
index b35b8bc..8541cbe 100644
--- a/drivers/net/wireless/marvell/libertas/main.c
+++ b/drivers/net/wireless/marvell/libertas/main.c
@@ -1118,7 +1118,8 @@ int lbs_start_card(struct lbs_private *priv)
 	else
 		pr_info("%s: mesh disabled\n", dev->name);
 
-	if (lbs_cfg_register(priv)) {
+	ret = lbs_cfg_register(priv);
+	if (ret) {
 		pr_err("cannot register device\n");
 		goto done;
 	}
