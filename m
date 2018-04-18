From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Apr 2018 11:00:08 +0000
Subject: [PATCH] net: caif: fix spelling mistake "UKNOWN" -> "UNKNOWN"
Message-Id: <20180418110008.29841-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/caif/chnl_net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/caif/chnl_net.c b/net/caif/chnl_net.c
index 53ecda10b790..13e2ae6be620 100644
--- a/net/caif/chnl_net.c
+++ b/net/caif/chnl_net.c
@@ -174,7 +174,7 @@ static void chnl_flowctrl_cb(struct cflayer *layr, enum caif_ctrlcmd flow,
 		flow = CAIF_CTRLCMD_DEINIT_RSP ? "CLOSE/DEINIT" :
 		flow = CAIF_CTRLCMD_INIT_FAIL_RSP ? "OPEN_FAIL" :
 		flow = CAIF_CTRLCMD_REMOTE_SHUTDOWN_IND ?
-		 "REMOTE_SHUTDOWN" : "UKNOWN CTRL COMMAND");
+		 "REMOTE_SHUTDOWN" : "UNKNOWN CTRL COMMAND");
 
 
 
-- 
2.17.0

