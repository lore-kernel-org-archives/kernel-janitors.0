From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 26 Apr 2016 02:33:43 +0000
Subject: [PATCH] ps3_gelic: fix memcpy parameter
Message-Id: <1461638023-2986-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The size allocated for target->hwinfo and the number of bytes copied in it
should be consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested

 drivers/net/ethernet/toshiba/ps3_gelic_wireless.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
index 13214a6..743b182 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
@@ -1622,7 +1622,7 @@ static void gelic_wl_scan_complete_event(struct gelic_wl_info *wl)
 			continue;
 
 		/* copy hw scan info */
-		memcpy(target->hwinfo, scan_info, scan_info->size);
+		memcpy(target->hwinfo, scan_info, be16_to_cpu(scan_info->size));
 		target->essid_len = strnlen(scan_info->essid,
 					    sizeof(scan_info->essid));
 		target->rate_len = 0;
-- 
2.7.4

