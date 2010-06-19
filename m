From: <gregkh@suse.de>
Date: Sat, 19 Jun 2010 00:10:45 +0000
Subject: patch staging-wlags49_h2-fix-build-error-when-config_sysfs-is-not-set.patch added to gregkh-2.6 tree
Message-Id: <1276906245336@site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    Subject: Staging: wlags49_h2: Fix build error when CONFIG_SYSFS is not set

to my gregkh-2.6 tree.  Its filename is

    staging-wlags49_h2-fix-build-error-when-config_sysfs-is-not-set.patch

This tree can be found at 
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/


From martinez.javier@gmail.com  Fri Jun 18 17:08:42 2010
From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 17 Jun 2010 01:17:44 -0400
Subject: Staging: wlags49_h2: Fix build error when CONFIG_SYSFS is not set
To: Henk de Groot <pe1dnn@amsat.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors <kernel-janitors@vger.kernel.org>
Message-ID: <1276751864.14632.6.camel@lenovo>

I got a wlags49_h2 driver build error in linux-next when CONFIG_SYSFS is not set.

CC [M]  drivers/staging/wlags49_h2/wl_cs.o
In file included from drivers/staging/wlags49_h2/wl_cs.c:104:
drivers/staging/wlags49_h2/wl_sysfs.h: In function ‘register_wlags_sysfs’:
drivers/staging/wlags49_h2/wl_sysfs.h:5: error: parameter name omitted
drivers/staging/wlags49_h2/wl_sysfs.h: In function ‘unregister_wlags_sysfs’:
drivers/staging/wlags49_h2/wl_sysfs.h:6: error: parameter name omitted
make[1]: *** [drivers/staging/wlags49_h2/wl_cs.o] Error 1
make: *** [_module_drivers/staging/wlags49_h2] Error 2

This is due a wrong function definition (it does not include parameters names).

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/staging/wlags49_h2/wl_sysfs.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

