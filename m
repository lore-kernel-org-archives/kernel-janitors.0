From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Oct 2020 22:24:07 +0000
Subject: [PATCH][next] nl80211/cfg80211: fix potential infinite loop
Message-Id: <20201029222407.390218-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Tova Mussai <tova.mussai@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The for-loop iterates with a u8 loop counter and compares this
with the loop upper limit of request->n_ssids which is an int type.
There is a potential infinite loop if n_ssids is larger than the
u8 loop counter, so fix this by making the loop counter an int.

Addresses-Coverity: ("Infinite loop")
Fixes: c8cb5b854b40 ("nl80211/cfg80211: support 6 GHz scanning")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/wireless/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 8d0e49c46db3..3409f37d838b 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -694,7 +694,7 @@ static  void cfg80211_scan_req_add_chan(struct cfg80211_scan_request *request,
 static bool cfg80211_find_ssid_match(struct cfg80211_colocated_ap *ap,
 				     struct cfg80211_scan_request *request)
 {
-	u8 i;
+	int i;
 	u32 s_ssid;
 
 	for (i = 0; i < request->n_ssids; i++) {
-- 
2.27.0
