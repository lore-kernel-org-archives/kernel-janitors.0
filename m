From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Aug 2018 13:42:24 +0000
Subject: [PATCH] iwlegacy: fix spelling mistake "acumulative" -> "accumulative"
Message-Id: <20180803134224.2609-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <sgruszka@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

fix spelling mistake in rx stats text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlegacy/3945-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/3945-debug.c b/drivers/net/wireless/intel/iwlegacy/3945-debug.c
index c1b4441fb8b2..a2960032be81 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-debug.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-debug.c
@@ -95,7 +95,7 @@ il3945_ucode_rx_stats_read(struct file *file, char __user *user_buf,
 	pos + 	    scnprintf(buf + pos, bufsz - pos,
 		      "%-32s     current"
-		      "acumulative       delta         max\n",
+		      "accumulative      delta         max\n",
 		      "Statistics_Rx - OFDM:");
 	pos + 	    scnprintf(buf + pos, bufsz - pos,
-- 
2.17.1

