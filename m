From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Feb 2017 11:37:54 +0000
Subject: [PATCH] Staging: rtl8192e: remove redundant null check on array alg
Message-Id: <20170209113754.26584-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binoy Jayan <binoy.jayan@linaro.org>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Florian Westphal <fw@strlen.de>, Tejun Heo <tj@kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

u.crypt.alg is an array of u8 integers and hence the null check on
this array is redundant and can be removed.

Detected with CoverityScan, CID#146583 ("Array compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 32 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 1430ba2..eeda17d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -3365,23 +3365,21 @@ static int rtllib_wpa_set_encryption(struct rtllib_device *ieee,
 	} else
 		sec.flags &= ~SEC_ACTIVE_KEY;
 
-	if (param->u.crypt.alg != NULL) {
-		memcpy(sec.keys[param->u.crypt.idx],
-		       param->u.crypt.key,
-		       param->u.crypt.key_len);
-		sec.key_sizes[param->u.crypt.idx] = param->u.crypt.key_len;
-		sec.flags |= (1 << param->u.crypt.idx);
-
-		if (strcmp(param->u.crypt.alg, "R-WEP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_1;
-		} else if (strcmp(param->u.crypt.alg, "R-TKIP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_2;
-		} else if (strcmp(param->u.crypt.alg, "R-CCMP") = 0) {
-			sec.flags |= SEC_LEVEL;
-			sec.level = SEC_LEVEL_3;
-		}
+	memcpy(sec.keys[param->u.crypt.idx],
+	       param->u.crypt.key,
+	       param->u.crypt.key_len);
+	sec.key_sizes[param->u.crypt.idx] = param->u.crypt.key_len;
+	sec.flags |= (1 << param->u.crypt.idx);
+
+	if (strcmp(param->u.crypt.alg, "R-WEP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_1;
+	} else if (strcmp(param->u.crypt.alg, "R-TKIP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_2;
+	} else if (strcmp(param->u.crypt.alg, "R-CCMP") = 0) {
+		sec.flags |= SEC_LEVEL;
+		sec.level = SEC_LEVEL_3;
 	}
  done:
 	if (ieee->set_security)
-- 
2.10.2

