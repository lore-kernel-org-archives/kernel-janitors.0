From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Mar 2018 14:33:01 +0000
Subject: [PATCH] HSI: ssi_protocol: fix spelling mistake: "trigerred" -> "triggered"
Message-Id: <20180316143301.11599-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hsi/clients/ssi_protocol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 9b167bc6eee4..0dba737327c6 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -495,7 +495,7 @@ static void ssip_rx_wd(struct timer_list *t)
 	struct ssi_protocol *ssi = from_timer(ssi, t, rx_wd);
 	struct hsi_client *cl = ssi->cl;
 
-	dev_err(&cl->device, "Watchdog trigerred\n");
+	dev_err(&cl->device, "Watchdog triggered\n");
 	ssip_error(cl);
 }
 
@@ -504,7 +504,7 @@ static void ssip_tx_wd(struct timer_list *t)
 	struct ssi_protocol *ssi = from_timer(ssi, t, tx_wd);
 	struct hsi_client *cl = ssi->cl;
 
-	dev_err(&cl->device, "Watchdog trigerred\n");
+	dev_err(&cl->device, "Watchdog triggered\n");
 	ssip_error(cl);
 }
 
-- 
2.15.1

