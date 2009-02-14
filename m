From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:50:45 +0000
Subject: [PATCH 43/43] drivers/net/wireless/prism54: fix sparse warning: fix
Message-Id: <20090214215034.24377.54126.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix sparse warning:
  drivers/net/wireless/prism54/isl_ioctl.c:2997:32: warning: incorrect type in argument 2 (different signedness)
  drivers/net/wireless/prism54/oid_mgt.c:712:42: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/prism54/isl_ioctl.c |    3 ++-
 drivers/net/wireless/prism54/oid_mgt.c   |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
index 57a150a..4c97c6a 100644
--- a/drivers/net/wireless/prism54/isl_ioctl.c
+++ b/drivers/net/wireless/prism54/isl_ioctl.c
@@ -2981,7 +2981,8 @@ prism54_set_spy(struct net_device *ndev,
 		union iwreq_data *uwrq, char *extra)
 {
 	islpci_private *priv = netdev_priv(ndev);
-	u32 u, oid = OID_INL_CONFIG;
+	u32 u;
+	enum oid_num_t oid = OID_INL_CONFIG;
 
 	down_write(&priv->mib_sem);
 	mgt_get(priv, OID_INL_CONFIG, &u);
diff --git a/drivers/net/wireless/prism54/oid_mgt.c b/drivers/net/wireless/prism54/oid_mgt.c
index 57a4ac3..1187e61 100644
--- a/drivers/net/wireless/prism54/oid_mgt.c
+++ b/drivers/net/wireless/prism54/oid_mgt.c
@@ -698,7 +698,7 @@ int
 mgt_commit(islpci_private *priv)
 {
 	int rvalue;
-	u32 u;
+	enum oid_num_t u;
 
 	if (islpci_get_state(priv) < PRV_STATE_INIT)
 		return 0;

