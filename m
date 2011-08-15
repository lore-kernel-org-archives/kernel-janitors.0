From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Aug 2011 11:25:35 +0000
Subject: [patch -next] libertas: handle mesh networks in lbs_iface_active()
Message-Id: <20110815112535.GC10560@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>, Daniel Drake <dsd@laptop.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, "open list:MARVELL LIBERTAS..." <libertas-dev@lists.infradead.org>, "open list:NETWORKING [WIREL..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

There was an extra semicolon so the if condition wasn't used.  We
checked "priv->dev" twice instead of "priv->mesh_dev".

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.

diff --git a/drivers/net/wireless/libertas/dev.h b/drivers/net/wireless/libertas/dev.h
index 8148389..b9ff0dc 100644
--- a/drivers/net/wireless/libertas/dev.h
+++ b/drivers/net/wireless/libertas/dev.h
@@ -190,8 +190,8 @@ static inline int lbs_iface_active(struct lbs_private *priv)
 	int r;
 
 	r = netif_running(priv->dev);
-	if (priv->mesh_dev);
-		r |= netif_running(priv->dev);
+	if (priv->mesh_dev)
+		r |= netif_running(priv->mesh_dev);
 
 	return r;
 }
