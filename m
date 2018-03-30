From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 30 Mar 2018 02:07:05 +0000
Subject: [PATCH net-next] cfg80211: fix possible memory leak in regdb_query_country()
Message-Id: <1522375625-135679-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

'wmm_ptrs' is malloced in regdb_query_country() and should be freed
before leaving from the error handling cases, otherwise it will cause
memory leak.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/wireless/reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 16c7e4e..ac3e12c 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -1026,6 +1026,7 @@ static int regdb_query_country(const struct fwdb_header *db,
 
 			if (!tmp_rd) {
 				kfree(regdom);
+				kfree(wmm_ptrs);
 				return -ENOMEM;
 			}
 			regdom = tmp_rd;



