From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 11 Jun 2010 22:18:34 +0000
Subject: [PATCH] staging/wlags49_hs: Fix build error when CONFIG_SYSFS is
Message-Id: <1276294714.4942.6.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276238148.22216.30.camel@lenovo>
In-Reply-To: <1276238148.22216.30.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Henk de Groot <pe1dnn@amsat.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

I got a build error in linux-next while compiling wlags49_h2 driver when CONFIG_SYSFS not set.

This is the second version of this patch, as Joe recommended I'm using functions instead of macros.

Thanks a lot

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/wlags49_h2/wl_sysfs.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_sysfs.h b/drivers/staging/wlags49_h2/wl_sysfs.h
index 6d96d03..fa658c3 100644
--- a/drivers/staging/wlags49_h2/wl_sysfs.h
+++ b/drivers/staging/wlags49_h2/wl_sysfs.h
@@ -2,6 +2,6 @@
 extern void register_wlags_sysfs(struct net_device *);
 extern void unregister_wlags_sysfs(struct net_device *);
 #else
-static void register_wlags_sysfs(struct net_device *) { return; };
-static void unregister_wlags_sysfs(struct net_device *) { return; };
+static inline void register_wlags_sysfs(struct net_device *net) { }
+static inline void unregister_wlags_sysfs(struct net_device *net) { }
 #endif
-- 
1.7.0.4




