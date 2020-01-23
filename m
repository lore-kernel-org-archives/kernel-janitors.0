From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:18:01 +0000
Subject: [PATCH] ar5523: fix spelling mistake "to" -> "too"
Message-Id: <20200123001801.2831921-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pontus Fuchs <pontus.fuchs@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ar5523_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ar5523/ar5523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index da2d179430ca..f4a04d88bd3f 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -74,7 +74,7 @@ static void ar5523_read_reply(struct ar5523 *ar, struct ar5523_cmd_hdr *hdr,
 
 	if (cmd->odata) {
 		if (cmd->olen < olen) {
-			ar5523_err(ar, "olen to small %d < %d\n",
+			ar5523_err(ar, "olen too small %d < %d\n",
 				   cmd->olen, olen);
 			cmd->olen = 0;
 			cmd->res = -EOVERFLOW;
-- 
2.24.0
