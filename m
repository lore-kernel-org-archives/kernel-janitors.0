From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:16:19 +0000
Subject: [PATCH 17/43] drivers/net/cxgb3: fix sparse warnings: fix signedness
Message-Id: <20090214211612.23489.60993.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/net/cxgb3/ael1002.c:1010:60: warning: incorrect type in argument 4 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/cxgb3/ael1002.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/net/cxgb3/ael1002.c b/drivers/net/cxgb3/ael1002.c
index 5c3c05d..e1b2249 100644
--- a/drivers/net/cxgb3/ael1002.c
+++ b/drivers/net/cxgb3/ael1002.c
@@ -1005,7 +1005,8 @@ static int ael2005_reset(struct cphy *phy, int wait)
 		{ 0, 0, 0, 0 }
 	};
 
-	int err, lasi_ctrl;
+	int err;
+	unsigned int lasi_ctrl;
 
 	err = mdio_read(phy, MDIO_DEV_PMA_PMD, LASI_CTRL, &lasi_ctrl);
 	if (err)

