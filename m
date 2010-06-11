From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 11 Jun 2010 06:35:48 +0000
Subject: [PATCH] staging/wlags49_hs: Fix build error when CONFIG_SYSFS is
Message-Id: <1276238148.22216.30.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, Henk de Groot <pe1dnn@amsat.org>, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors <kernel-janitors@vger.kernel.org>

With current linux-next I got a build error with wlags49_h2 driver when CONFIG_SYSFS is not set.

This patch solves the issue.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/wlags49_h2/wl_sysfs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_sysfs.h b/drivers/staging/wlags49_h2/wl_sysfs.h
index 6d96d03..7d5895d 100644
--- a/drivers/staging/wlags49_h2/wl_sysfs.h
+++ b/drivers/staging/wlags49_h2/wl_sysfs.h
@@ -2,6 +2,6 @@
 extern void register_wlags_sysfs(struct net_device *);
 extern void unregister_wlags_sysfs(struct net_device *);
 #else
-static void register_wlags_sysfs(struct net_device *) { return; };
-static void unregister_wlags_sysfs(struct net_device *) { return; };
+#define register_wlags_sysfs(net_device) { }
+#define unregister_wlags_sysfs(net_device) { }
 #endif
-- 
1.7.0.4





