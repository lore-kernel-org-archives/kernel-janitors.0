From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 14:54:21 +0000
Subject: [PATCH] staging/rtl8192u/ieee80211: Delete an error message for a failed memory allocation in ieee80
Message-Id: <37ac5f8b-02a5-99e1-536f-fd8c956be0ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Derek Robson <robsonde@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Riccardo Marotti <riccardo.marotti@gmail.com>, Simran Singhal <singhalsimran0@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 15:46:07 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_module.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
index 90a097f2cd4e..f900dee19a7f 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
@@ -67,11 +67,8 @@ static inline int ieee80211_networks_allocate(struct ieee80211_device *ieee)
 	ieee->networks = kcalloc(
 		MAX_NETWORK_COUNT, sizeof(struct ieee80211_network),
 		GFP_KERNEL);
-	if (!ieee->networks) {
-		printk(KERN_WARNING "%s: Out of memory allocating beacons\n",
-		       ieee->dev->name);
+	if (!ieee->networks)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.15.1

