From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Feb 2017 11:06:43 +0000
Subject: [PATCH] staging: rtl8192u: remove redundant null check on array alg
Message-Id: <20170209110643.22590-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, simran singhal <singhalsimran0@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Binoy Jayan <binoy.jayan@linaro.org>, "David S . Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Janani Ravichandran <janani.rvchndrn@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

u.crypt.alg is an array of u8 integers and hence the null check on
this array is redundant and can be removed.

Detected with CoverityScan, CID#143214 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../staging/rtl8192u/ieee80211/ieee80211_softmac.c | 32 ++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 844e257..02b9f7a 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -3056,23 +3056,21 @@ static int ieee80211_wpa_set_encryption(struct ieee80211_device *ieee,
 	} else
 		sec.flags &= ~SEC_ACTIVE_KEY;
 
-	if (param->u.crypt.alg != NULL) {
-		memcpy(sec.keys[param->u.crypt.idx],
-		       param->u.crypt.key,
-		       param->u.crypt.key_len);
-		sec.key_sizes[param->u.crypt.idx] = param->u.crypt.key_len;
-		sec.flags |= (1 << param->u.crypt.idx);
-
-		if (strcmp(param->u.crypt.alg, "WEP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_1;
-		} else if (strcmp(param->u.crypt.alg, "TKIP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_2;
-		} else if (strcmp(param->u.crypt.alg, "CCMP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_3;
-		}
+	memcpy(sec.keys[param->u.crypt.idx],
+	       param->u.crypt.key,
+	       param->u.crypt.key_len);
+	sec.key_sizes[param->u.crypt.idx] = param->u.crypt.key_len;
+	sec.flags |= (1 << param->u.crypt.idx);
+
+	if (strcmp(param->u.crypt.alg, "WEP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_1;
+	} else if (strcmp(param->u.crypt.alg, "TKIP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_2;
+	} else if (strcmp(param->u.crypt.alg, "CCMP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_3;
 	}
  done:
 	if (ieee->set_security)
-- 
2.10.2

