From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:33 +0000
Subject: [PATCH 25/25] wl_profile: remove casts from void*
Message-Id: <1277806594-31554-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "Prashant P. Shah" <pshah.mumbai@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Henk de Groot <pe1dnn@amsat.org>, Andy Shevchenko <ext-andriy.shevchenko@nokia.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/wlags49_h2/wl_profile.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_profile.c b/drivers/staging/wlags49_h2/wl_profile.c
index 292d579..7a1337d 100644
--- a/drivers/staging/wlags49_h2/wl_profile.c
+++ b/drivers/staging/wlags49_h2/wl_profile.c
@@ -169,7 +169,7 @@ void parse_config(struct net_device *dev)
 	DBG_ENTER(DbgInfo);
 
 	/* Get the wavelan specific info for this device */
-	wvlan_config = (struct wl_private *)dev->priv;
+	wvlan_config = dev->priv;
 	if (wvlan_config = NULL) {
 		DBG_ERROR(DbgInfo, "Wavelan specific info struct not present?\n");
 		return;
-- 
1.7.0.4

