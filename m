From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Nov 2020 18:16:36 +0000
Subject: [PATCH] net: wireless: make a const array static, makes object smaller
Message-Id: <20201116181636.362729-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array bws on the stack but instead it
static. Makes the object code smaller by 80 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  85694	  16865	   1216	 103775	  1955f	./net/wireless/reg.o

After:
   text	   data	    bss	    dec	    hex	filename
  85518	  16961	   1216	 103695	  1950f	./net/wireless/reg.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/wireless/reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index a04fdfb35f07..c037960e5a1a 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1616,7 +1616,7 @@ static const struct ieee80211_reg_rule *
 __freq_reg_info(struct wiphy *wiphy, u32 center_freq, u32 min_bw)
 {
 	const struct ieee80211_regdomain *regd = reg_get_regdomain(wiphy);
-	const u32 bws[] = {0, 1, 2, 4, 5, 8, 10, 16, 20};
+	static const u32 bws[] = {0, 1, 2, 4, 5, 8, 10, 16, 20};
 	const struct ieee80211_reg_rule *reg_rule;
 	int i = ARRAY_SIZE(bws) - 1;
 	u32 bw;
-- 
2.28.0
