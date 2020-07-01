From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Jul 2020 13:52:21 +0000
Subject: [PATCH] iwlegacy: 4965: remove redundant initialization of variable tid
Message-Id: <20200701135221.549700-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <stf_xl@wp.pl>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable tid is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/intel/iwlegacy/4965-rs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/4965-rs.c b/drivers/net/wireless/intel/iwlegacy/4965-rs.c
index 0a02d8aca320..1f196665d21f 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-rs.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-rs.c
@@ -1749,7 +1749,7 @@ il4965_rs_rate_scale_perform(struct il_priv *il, struct sk_buff *skb,
 	u8 done_search = 0;
 	u16 high_low;
 	s32 sr;
-	u8 tid = MAX_TID_COUNT;
+	u8 tid;
 	struct il_tid_data *tid_data;
 
 	D_RATE("rate scale calculate new rate for skb\n");
-- 
2.27.0
