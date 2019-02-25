From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 25 Feb 2019 12:38:49 +0000
Subject: [PATCH] cfg80211: Use kmemdup in cfg80211_gen_new_ie()
Message-Id: <20190225123849.50574-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/wireless/scan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 287518c6caa4..04d888628f29 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -190,10 +190,9 @@ static size_t cfg80211_gen_new_ie(const u8 *ie, size_t ielen,
 	/* copy subelement as we need to change its content to
 	 * mark an ie after it is processed.
 	 */
-	sub_copy = kmalloc(subie_len, gfp);
+	sub_copy = kmemdup(subelement, subie_len, gfp);
 	if (!sub_copy)
 		return 0;
-	memcpy(sub_copy, subelement, subie_len);
 
 	pos = &new_ie[0];
