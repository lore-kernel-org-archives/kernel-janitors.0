From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Jul 2018 13:38:43 +0000
Subject: [PATCH] airo: remove unused variables len and dev and clean up formatting
Message-Id: <20180709133843.15615-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables len and dev assigned values but are never used hence they
are redundant and can be removed.  Also add in white space in for-loop
and remove some { } braces on if statement.

Cleans up clang warnings:
warning: variable 'len' set but not used [-Wunused-but-set-variable]
warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/cisco/airo.c    | 8 +++-----
 drivers/net/wireless/cisco/airo_cs.c | 3 ---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
index 72046e182745..04dd7a936593 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -3419,7 +3419,7 @@ static void airo_handle_rx(struct airo_info *ai)
 
 static void airo_handle_tx(struct airo_info *ai, u16 status)
 {
-	int i, len = 0, index = -1;
+	int i, index = -1;
 	u16 fid;
 
 	if (test_bit(FLAG_MPI, &ai->flags)) {
@@ -3443,11 +3443,9 @@ static void airo_handle_tx(struct airo_info *ai, u16 status)
 
 	fid = IN4500(ai, TXCOMPLFID);
 
-	for(i = 0; i < MAX_FIDS; i++) {
-		if ((ai->fids[i] & 0xffff) = fid) {
-			len = ai->fids[i] >> 16;
+	for (i = 0; i < MAX_FIDS; i++) {
+		if ((ai->fids[i] & 0xffff) = fid)
 			index = i;
-		}
 	}
 
 	if (index != -1) {
diff --git a/drivers/net/wireless/cisco/airo_cs.c b/drivers/net/wireless/cisco/airo_cs.c
index d9ed22b4cc6b..3718f958c0fc 100644
--- a/drivers/net/wireless/cisco/airo_cs.c
+++ b/drivers/net/wireless/cisco/airo_cs.c
@@ -102,11 +102,8 @@ static int airo_cs_config_check(struct pcmcia_device *p_dev, void *priv_data)
 
 static int airo_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int ret;
 
-	dev = link->priv;
-
 	dev_dbg(&link->dev, "airo_config\n");
 
 	link->config_flags |= CONF_ENABLE_IRQ | CONF_AUTO_SET_VPP |
-- 
2.17.1

