From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 16 Mar 2017 15:19:55 +0000
Subject: [PATCH 3/3] w1: Add subsystem kernel public interface
Message-Id: <20170316151955.10710-4-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316151955.10710-1-afd@ti.com>
In-Reply-To: <20170316151955.10710-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Like other subsystems we should be able to define slave devices outside
of the w1 directory. To do this we move public facing interface
definitions to include/linux/w1.h and rename the internal definition
file to w1_internal.h.

As w1_family.h and w1_int.h contained almost entirely public
driver interface definitions we simply removed these files and
moved the remaining definitions into w1_internal.h.

With this we can now start to move slave devices out of w1/slaves and
into the subsystem based on the function they implement, again like
other drivers.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 MAINTAINERS                        |   1 +
 drivers/w1/masters/ds1wm.c         |   3 +-
 drivers/w1/masters/ds2482.c        |   3 +-
 drivers/w1/masters/ds2490.c        |   3 +-
 drivers/w1/masters/matrox_w1.c     |   3 +-
 drivers/w1/masters/mxc_w1.c        |   3 +-
 drivers/w1/masters/omap_hdq.c      |   3 +-
 drivers/w1/masters/w1-gpio.c       |   3 +-
 drivers/w1/slaves/w1_bq27000.c     |   6 +-
 drivers/w1/slaves/w1_ds2405.c      |   5 +-
 drivers/w1/slaves/w1_ds2406.c      |   6 +-
 drivers/w1/slaves/w1_ds2408.c      |   6 +-
 drivers/w1/slaves/w1_ds2413.c      |   6 +-
 drivers/w1/slaves/w1_ds2423.c      |   6 +-
 drivers/w1/slaves/w1_ds2431.c      |   6 +-
 drivers/w1/slaves/w1_ds2433.c      |   6 +-
 drivers/w1/slaves/w1_ds2760.c      |   7 ++-
 drivers/w1/slaves/w1_ds2780.c      |   7 ++-
 drivers/w1/slaves/w1_ds2781.c      |   7 ++-
 drivers/w1/slaves/w1_ds28e04.c     |   6 +-
 drivers/w1/slaves/w1_smem.c        |   7 ++-
 drivers/w1/slaves/w1_therm.c       |  10 +++-
 drivers/w1/w1.c                    |   6 +-
 drivers/w1/w1_family.c             |   3 +-
 drivers/w1/w1_family.h             |  97 -------------------------------
 drivers/w1/w1_int.c                |   3 +-
 drivers/w1/w1_int.h                |  27 ---------
 drivers/w1/w1_internal.h           |  87 ++++++++++++++++++++++++++++
 drivers/w1/w1_io.c                 |   2 +-
 drivers/w1/w1_netlink.c            |   2 +-
 drivers/w1/w1_netlink.h            |   2 +-
 {drivers/w1 => include/linux}/w1.h | 116 ++++++++++++++++---------------------
 32 files changed, 204 insertions(+), 254 deletions(-)
 delete mode 100644 drivers/w1/w1_family.h
 delete mode 100644 drivers/w1/w1_int.h
 create mode 100644 drivers/w1/w1_internal.h
 rename {drivers/w1 => include/linux}/w1.h (76%)

diff --git a/MAINTAINERS b/MAINTAINERS
index c265a5fe4848..ff52c1b2e167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13500,6 +13500,7 @@ M:	Evgeniy Polyakov <zbr@ioremap.net>
 S:	Maintained
 F:	Documentation/w1/
 F:	drivers/w1/
+F:	include/linux/w1.h
 
 W83791D HARDWARE MONITORING DRIVER
 M:	Marc Hulsman <m.hulsman@tudelft.nl>
diff --git a/drivers/w1/masters/ds1wm.c b/drivers/w1/masters/ds1wm.c
index e0b8a4bc73df..fd2e9da27c4b 100644
--- a/drivers/w1/masters/ds1wm.c
+++ b/drivers/w1/masters/ds1wm.c
@@ -25,8 +25,7 @@
 
 #include <asm/io.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 
 #define DS1WM_CMD	0x00	/* R/W 4 bits command */
diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index e8730ea3e3aa..d49681cd29af 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -20,8 +20,7 @@
 #include <linux/delay.h>
 #include <asm/delay.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 /**
  * Allow the active pullup to be disabled, default is enabled.
diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
index d748e34d4ce5..46ccb2fc4f60 100644
--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -25,8 +25,7 @@
 #include <linux/usb.h>
 #include <linux/slab.h>
 
-#include "../w1_int.h"
-#include "../w1.h"
+#include <linux/w1.h>
 
 /* USB Standard */
 /* USB Control request vendor type */
diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index f20d03ecfd1d..d83d7c99d81d 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -34,8 +34,7 @@
 #include <linux/pci_ids.h>
 #include <linux/pci.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 /*
  * Matrox G400 DDC registers.
diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
index a4621757a47f..74f2e6e6202a 100644
--- a/drivers/w1/masters/mxc_w1.c
+++ b/drivers/w1/masters/mxc_w1.c
@@ -19,8 +19,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 /*
  * MXC W1 Register offsets
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 3302cbd2344a..3612542b6044 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -19,8 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 #define	MOD_NAME	"OMAP_HDQ:"
 
diff --git a/drivers/w1/masters/w1-gpio.c b/drivers/w1/masters/w1-gpio.c
index a373ae69d9f6..a90728ceec5a 100644
--- a/drivers/w1/masters/w1-gpio.c
+++ b/drivers/w1/masters/w1-gpio.c
@@ -20,8 +20,7 @@
 #include <linux/of.h>
 #include <linux/delay.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
+#include <linux/w1.h>
 
 static u8 w1_gpio_set_pullup(void *data, int delay)
 {
diff --git a/drivers/w1/slaves/w1_bq27000.c b/drivers/w1/slaves/w1_bq27000.c
index d480900a28ab..8046ac45381a 100644
--- a/drivers/w1/slaves/w1_bq27000.c
+++ b/drivers/w1/slaves/w1_bq27000.c
@@ -17,9 +17,9 @@
 #include <linux/mutex.h>
 #include <linux/power/bq27xxx_battery.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_BQ27000	0x01
 
 #define HDQ_CMD_READ	(0)
 #define HDQ_CMD_WRITE	(1<<7)
diff --git a/drivers/w1/slaves/w1_ds2405.c b/drivers/w1/slaves/w1_ds2405.c
index d5d54876cb64..42a1e81060ce 100644
--- a/drivers/w1/slaves/w1_ds2405.c
+++ b/drivers/w1/slaves/w1_ds2405.c
@@ -24,8 +24,9 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
-#include "../w1.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_DS2405	0x05
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Maciej S. Szmigiero <mail@maciej.szmigiero.name>");
diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index 709bd5e02eed..fac266366ca3 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -17,9 +17,9 @@
 #include <linux/slab.h>
 #include <linux/crc16.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_DS2406	0x12
 
 #define W1_F12_FUNC_READ_STATUS		   0xAA
 #define W1_F12_FUNC_WRITE_STATUS	   0x55
diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
index e01d2b3997bc..b535d5ec35b6 100644
--- a/drivers/w1/slaves/w1_ds2408.c
+++ b/drivers/w1/slaves/w1_ds2408.c
@@ -15,9 +15,9 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_DS2408	0x29
 
 #define W1_F29_RETRIES		3
 
diff --git a/drivers/w1/slaves/w1_ds2413.c b/drivers/w1/slaves/w1_ds2413.c
index 9cc6f0bc2e95..492e3d010321 100644
--- a/drivers/w1/slaves/w1_ds2413.c
+++ b/drivers/w1/slaves/w1_ds2413.c
@@ -16,9 +16,9 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_DS2413	0x3A
 
 #define W1_F3A_RETRIES                     3
 #define W1_F3A_FUNC_PIO_ACCESS_READ        0xF5
diff --git a/drivers/w1/slaves/w1_ds2423.c b/drivers/w1/slaves/w1_ds2423.c
index 306240fe496c..050407c53b16 100644
--- a/drivers/w1/slaves/w1_ds2423.c
+++ b/drivers/w1/slaves/w1_ds2423.c
@@ -30,9 +30,9 @@
 #include <linux/delay.h>
 #include <linux/crc16.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_COUNTER_DS2423	0x1D
 
 #define CRC16_VALID	0xb001
 #define CRC16_INIT	0
diff --git a/drivers/w1/slaves/w1_ds2431.c b/drivers/w1/slaves/w1_ds2431.c
index 20182d4a4b19..5adecd3face1 100644
--- a/drivers/w1/slaves/w1_ds2431.c
+++ b/drivers/w1/slaves/w1_ds2431.c
@@ -16,9 +16,9 @@
 #include <linux/types.h>
 #include <linux/delay.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_EEPROM_DS2431	0x2D
 
 #define W1_F2D_EEPROM_SIZE		128
 #define W1_F2D_PAGE_COUNT		4
diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
index 86c30aceea3e..75ad70cfe8e8 100644
--- a/drivers/w1/slaves/w1_ds2433.c
+++ b/drivers/w1/slaves/w1_ds2433.c
@@ -22,9 +22,9 @@
 
 #endif
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_EEPROM_DS2433	0x23
 
 #define W1_EEPROM_SIZE		512
 #define W1_PAGE_COUNT		16
diff --git a/drivers/w1/slaves/w1_ds2760.c b/drivers/w1/slaves/w1_ds2760.c
index f35d1e2ef9bb..26168abfb8b8 100644
--- a/drivers/w1/slaves/w1_ds2760.c
+++ b/drivers/w1/slaves/w1_ds2760.c
@@ -18,11 +18,12 @@
 #include <linux/idr.h>
 #include <linux/gfp.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
 #include "w1_ds2760.h"
 
+#define W1_FAMILY_DS2760	0x30
+
 static int w1_ds2760_io(struct device *dev, char *buf, int addr, size_t count,
 			int io)
 {
diff --git a/drivers/w1/slaves/w1_ds2780.c b/drivers/w1/slaves/w1_ds2780.c
index 292972212107..a60528131154 100644
--- a/drivers/w1/slaves/w1_ds2780.c
+++ b/drivers/w1/slaves/w1_ds2780.c
@@ -21,11 +21,12 @@
 #include <linux/mutex.h>
 #include <linux/idr.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
 #include "w1_ds2780.h"
 
+#define W1_FAMILY_DS2780	0x32
+
 static int w1_ds2780_do_io(struct device *dev, char *buf, int addr,
 			size_t count, int io)
 {
diff --git a/drivers/w1/slaves/w1_ds2781.c b/drivers/w1/slaves/w1_ds2781.c
index a5d75067b230..645be6e0b24a 100644
--- a/drivers/w1/slaves/w1_ds2781.c
+++ b/drivers/w1/slaves/w1_ds2781.c
@@ -18,11 +18,12 @@
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
 #include "w1_ds2781.h"
 
+#define W1_FAMILY_DS2781	0x3D
+
 static int w1_ds2781_do_io(struct device *dev, char *buf, int addr,
 			size_t count, int io)
 {
diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index c62858c05e8f..ec234b846eb3 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -20,9 +20,9 @@
 #define CRC16_INIT		0
 #define CRC16_VALID		0xb001
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_DS28E04	0x1C
 
 /* Allow the strong pullup to be disabled, but default to enabled.
  * If it was disabled a parasite powered device might not get the required
diff --git a/drivers/w1/slaves/w1_smem.c b/drivers/w1/slaves/w1_smem.c
index 99b03bfb9941..e556b0caff71 100644
--- a/drivers/w1/slaves/w1_smem.c
+++ b/drivers/w1/slaves/w1_smem.c
@@ -27,9 +27,10 @@
 #include <linux/device.h>
 #include <linux/types.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_FAMILY_SMEM_01	0x01
+#define W1_FAMILY_SMEM_81	0x81
 
 static struct w1_family w1_smem_family_01 = {
 	.fid = W1_FAMILY_SMEM_01,
diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index ccaf29994a42..cb3fc3c6b0d1 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -30,9 +30,13 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 
-#include "../w1.h"
-#include "../w1_int.h"
-#include "../w1_family.h"
+#include <linux/w1.h>
+
+#define W1_THERM_DS18S20	0x10
+#define W1_THERM_DS1822		0x22
+#define W1_THERM_DS18B20	0x28
+#define W1_THERM_DS1825		0x3B
+#define W1_THERM_DS28EA00	0x42
 
 /* Allow the strong pullup to be disabled, but default to enabled.
  * If it was disabled a parasite powered device might not get the require
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 8172dee5e23c..95ea7e6b1d99 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -28,11 +28,11 @@
 
 #include <linux/atomic.h>
 
-#include "w1.h"
-#include "w1_int.h"
-#include "w1_family.h"
+#include "w1_internal.h"
 #include "w1_netlink.h"
 
+#define W1_FAMILY_DEFAULT	0
+
 static int w1_timeout = 10;
 module_param_named(timeout, w1_timeout, int, 0);
 MODULE_PARM_DESC(timeout, "time in seconds between automatic slave searches");
diff --git a/drivers/w1/w1_family.c b/drivers/w1/w1_family.c
index 9759cdaf22f4..f14ab0b340b5 100644
--- a/drivers/w1/w1_family.c
+++ b/drivers/w1/w1_family.c
@@ -18,8 +18,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 
-#include "w1_family.h"
-#include "w1.h"
+#include "w1_internal.h"
 
 DEFINE_SPINLOCK(w1_flock);
 static LIST_HEAD(w1_families);
diff --git a/drivers/w1/w1_family.h b/drivers/w1/w1_family.h
deleted file mode 100644
index c4a6b257a367..000000000000
--- a/drivers/w1/w1_family.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/*
- * Copyright (c) 2004 Evgeniy Polyakov <zbr@ioremap.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __W1_FAMILY_H
-#define __W1_FAMILY_H
-
-#include <linux/types.h>
-#include <linux/device.h>
-#include <linux/atomic.h>
-
-#define W1_FAMILY_DEFAULT	0
-#define W1_FAMILY_BQ27000	0x01
-#define W1_FAMILY_SMEM_01	0x01
-#define W1_FAMILY_SMEM_81	0x81
-#define W1_FAMILY_DS2405	0x05
-#define W1_THERM_DS18S20 	0x10
-#define W1_FAMILY_DS28E04	0x1C
-#define W1_COUNTER_DS2423	0x1D
-#define W1_THERM_DS1822  	0x22
-#define W1_EEPROM_DS2433  	0x23
-#define W1_THERM_DS18B20 	0x28
-#define W1_FAMILY_DS2408	0x29
-#define W1_EEPROM_DS2431	0x2D
-#define W1_FAMILY_DS2760	0x30
-#define W1_FAMILY_DS2780	0x32
-#define W1_FAMILY_DS2413	0x3A
-#define W1_FAMILY_DS2406	0x12
-#define W1_THERM_DS1825		0x3B
-#define W1_FAMILY_DS2781	0x3D
-#define W1_THERM_DS28EA00	0x42
-
-#define MAXNAMELEN		32
-
-struct w1_slave;
-
-/**
- * struct w1_family_ops - operations for a family type
- * @add_slave: add_slave
- * @remove_slave: remove_slave
- * @groups: sysfs group
- */
-struct w1_family_ops
-{
-	int  (* add_slave)(struct w1_slave *);
-	void (* remove_slave)(struct w1_slave *);
-	const struct attribute_group **groups;
-};
-
-/**
- * struct w1_family - reference counted family structure.
- * @family_entry:	family linked list
- * @fid:		8 bit family identifier
- * @fops:		operations for this family
- * @refcnt:		reference counter
- */
-struct w1_family
-{
-	struct list_head	family_entry;
-	u8			fid;
-
-	struct w1_family_ops	*fops;
-
-	atomic_t		refcnt;
-};
-
-extern spinlock_t w1_flock;
-
-void w1_family_put(struct w1_family *);
-void __w1_family_get(struct w1_family *);
-struct w1_family * w1_family_registered(u8);
-void w1_unregister_family(struct w1_family *);
-int w1_register_family(struct w1_family *);
-
-/**
- * module_w1_driver() - Helper macro for registering a 1-Wire families
- * @__w1_family: w1_family struct
- *
- * Helper macro for 1-Wire families which do not do anything special in module
- * init/exit. This eliminates a lot of boilerplate. Each module may only
- * use this macro once, and calling it replaces module_init() and module_exit()
- */
-#define module_w1_family(__w1_family) \
-	module_driver(__w1_family, w1_register_family, \
-			w1_unregister_family)
-
-#endif /* __W1_FAMILY_H */
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 4439d10709bb..1c776178f598 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -21,9 +21,8 @@
 #include <linux/export.h>
 #include <linux/moduleparam.h>
 
-#include "w1.h"
+#include "w1_internal.h"
 #include "w1_netlink.h"
-#include "w1_int.h"
 
 static int w1_search_count = -1; /* Default is continual scan */
 module_param_named(search_count, w1_search_count, int, 0);
diff --git a/drivers/w1/w1_int.h b/drivers/w1/w1_int.h
deleted file mode 100644
index 371989159216..000000000000
--- a/drivers/w1/w1_int.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Copyright (c) 2004 Evgeniy Polyakov <zbr@ioremap.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __W1_INT_H
-#define __W1_INT_H
-
-#include <linux/kernel.h>
-#include <linux/device.h>
-
-#include "w1.h"
-
-int w1_add_master_device(struct w1_bus_master *);
-void w1_remove_master_device(struct w1_bus_master *);
-void __w1_remove_master_device(struct w1_master *);
-
-#endif /* __W1_INT_H */
diff --git a/drivers/w1/w1_internal.h b/drivers/w1/w1_internal.h
new file mode 100644
index 000000000000..1623e2fdccc7
--- /dev/null
+++ b/drivers/w1/w1_internal.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright (c) 2004 Evgeniy Polyakov <zbr@ioremap.net>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __W1_H
+#define __W1_H
+
+#include <linux/w1.h>
+
+#include <linux/completion.h>
+#include <linux/mutex.h>
+
+#define W1_SLAVE_ACTIVE		0
+#define W1_SLAVE_DETACH		1
+
+/**
+ * struct w1_async_cmd - execute callback from the w1_process kthread
+ * @async_entry: link entry
+ * @cb: callback function, must list_del and destroy this list before
+ * returning
+ *
+ * When inserted into the w1_master async_list, w1_process will execute
+ * the callback.  Embed this into the structure with the command details.
+ */
+struct w1_async_cmd {
+	struct list_head	async_entry;
+	void (*cb)(struct w1_master *dev, struct w1_async_cmd *async_cmd);
+};
+
+int w1_create_master_attributes(struct w1_master *master);
+void w1_destroy_master_attributes(struct w1_master *master);
+void w1_search(struct w1_master *dev, u8 search_type,
+	       w1_slave_found_callback cb);
+void w1_search_devices(struct w1_master *dev, u8 search_type,
+		       w1_slave_found_callback cb);
+/* call w1_unref_slave to release the reference counts w1_search_slave added */
+struct w1_slave *w1_search_slave(struct w1_reg_num *id);
+/*
+ * decrements the reference on sl->master and sl, and cleans up if zero
+ * returns the reference count after it has been decremented
+ */
+int w1_unref_slave(struct w1_slave *sl);
+void w1_slave_found(struct w1_master *dev, u64 rn);
+void w1_search_process_cb(struct w1_master *dev, u8 search_type,
+			  w1_slave_found_callback cb);
+struct w1_slave *w1_slave_search_device(struct w1_master *dev,
+					struct w1_reg_num *rn);
+struct w1_master *w1_search_master_id(u32 id);
+
+/* Disconnect and reconnect devices in the given family.  Used for finding
+ * unclaimed devices after a family has been registered or releasing devices
+ * after a family has been unregistered.  Set attach to 1 when a new family
+ * has just been registered, to 0 when it has been unregistered.
+ */
+void w1_reconnect_slaves(struct w1_family *f, int attach);
+int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn);
+/* 0 success, otherwise EBUSY */
+int w1_slave_detach(struct w1_slave *sl);
+
+void __w1_remove_master_device(struct w1_master *dev);
+
+void w1_family_put(struct w1_family *f);
+void __w1_family_get(struct w1_family *f);
+struct w1_family *w1_family_registered(u8 fid);
+
+extern struct device_driver w1_master_driver;
+extern struct device w1_master_device;
+extern int w1_max_slave_count;
+extern int w1_max_slave_ttl;
+extern struct list_head w1_masters;
+extern struct mutex w1_mlock;
+extern spinlock_t w1_flock;
+
+int w1_process_callbacks(struct w1_master *dev);
+int w1_process(void *data);
+
+#endif /* __W1_H */
diff --git a/drivers/w1/w1_io.c b/drivers/w1/w1_io.c
index 1134e6b1eb02..d191e1f80579 100644
--- a/drivers/w1/w1_io.c
+++ b/drivers/w1/w1_io.c
@@ -18,7 +18,7 @@
 #include <linux/moduleparam.h>
 #include <linux/module.h>
 
-#include "w1.h"
+#include "w1_internal.h"
 
 static int w1_delay_parm = 1;
 module_param_named(delay_coef, w1_delay_parm, int, 0);
diff --git a/drivers/w1/w1_netlink.c b/drivers/w1/w1_netlink.c
index 027950f997d1..f2f099caeb77 100644
--- a/drivers/w1/w1_netlink.c
+++ b/drivers/w1/w1_netlink.c
@@ -17,7 +17,7 @@
 #include <linux/netlink.h>
 #include <linux/connector.h>
 
-#include "w1.h"
+#include "w1_internal.h"
 #include "w1_netlink.h"
 
 #if defined(CONFIG_W1_CON) && (defined(CONFIG_CONNECTOR) || (defined(CONFIG_CONNECTOR_MODULE) && defined(CONFIG_W1_MODULE)))
diff --git a/drivers/w1/w1_netlink.h b/drivers/w1/w1_netlink.h
index b389e5ff5fa5..a36661cd1f05 100644
--- a/drivers/w1/w1_netlink.h
+++ b/drivers/w1/w1_netlink.h
@@ -18,7 +18,7 @@
 #include <asm/types.h>
 #include <linux/connector.h>
 
-#include "w1.h"
+#include "w1_internal.h"
 
 /**
  * enum w1_cn_msg_flags - bitfield flags for struct cn_msg.flags
diff --git a/drivers/w1/w1.h b/include/linux/w1.h
similarity index 76%
rename from drivers/w1/w1.h
rename to include/linux/w1.h
index 758a7a6322e9..a7221037ce5e 100644
--- a/drivers/w1/w1.h
+++ b/include/linux/w1.h
@@ -1,5 +1,7 @@
 /*
  * Copyright (c) 2004 Evgeniy Polyakov <zbr@ioremap.net>
+ * Copyright (C) 2017 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -12,8 +14,10 @@
  * GNU General Public License for more details.
  */
 
-#ifndef __W1_H
-#define __W1_H
+#ifndef __LINUX_W1_H
+#define __LINUX_W1_H
+
+#include <linux/device.h>
 
 /**
  * struct w1_reg_num - broken out slave device id
@@ -22,8 +26,7 @@
  * @id: along with family is the unique device id
  * @crc: checksum of the other bytes
  */
-struct w1_reg_num
-{
+struct w1_reg_num {
 #if defined(__LITTLE_ENDIAN_BITFIELD)
 	__u64	family:8,
 		id:48,
@@ -39,12 +42,6 @@ struct w1_reg_num
 
 #ifdef __KERNEL__
 
-#include <linux/completion.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-
-#include "w1_family.h"
-
 #define W1_MAXNAMELEN		32
 
 #define W1_SEARCH		0xF0
@@ -59,9 +56,6 @@ struct w1_reg_num
 #define W1_MATCH_ROM		0x55
 #define W1_RESUME_CMD		0xA5
 
-#define W1_SLAVE_ACTIVE		0
-#define W1_SLAVE_DETACH		1
-
 /**
  * struct w1_slave - holds a single slave device on the bus
  *
@@ -78,8 +72,7 @@ struct w1_reg_num
  * @dev: kernel device identifier
  *
  */
-struct w1_slave
-{
+struct w1_slave {
 	struct module		*owner;
 	unsigned char		name[W1_MAXNAMELEN];
 	struct list_head	w1_slave_entry;
@@ -96,7 +89,6 @@ struct w1_slave
 
 typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
 
-
 /**
  * struct w1_bus_master - operations available on a bus master
  *
@@ -142,8 +134,7 @@ typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
  * reset_bus.
  *
  */
-struct w1_bus_master
-{
+struct w1_bus_master {
 	void		*data;
 
 	u8		(*read_bit)(void *);
@@ -209,8 +200,7 @@ enum w1_master_flags {
  * @bus_master:		io operations available
  * @seq:		sequence number used for netlink broadcasts
  */
-struct w1_master
-{
+struct w1_master {
 	struct list_head	w1_master_entry;
 	struct module		*owner;
 	unsigned char		name[W1_MAXNAMELEN];
@@ -254,45 +244,51 @@ struct w1_master
 	u32			seq;
 };
 
+int w1_add_master_device(struct w1_bus_master *master);
+void w1_remove_master_device(struct w1_bus_master *master);
+
 /**
- * struct w1_async_cmd - execute callback from the w1_process kthread
- * @async_entry: link entry
- * @cb: callback function, must list_del and destroy this list before
- * returning
- *
- * When inserted into the w1_master async_list, w1_process will execute
- * the callback.  Embed this into the structure with the command details.
+ * struct w1_family_ops - operations for a family type
+ * @add_slave: add_slave
+ * @remove_slave: remove_slave
+ * @groups: sysfs group
  */
-struct w1_async_cmd {
-	struct list_head	async_entry;
-	void (*cb)(struct w1_master *dev, struct w1_async_cmd *async_cmd);
+struct w1_family_ops {
+	int  (*add_slave)(struct w1_slave *sl);
+	void (*remove_slave)(struct w1_slave *sl);
+	const struct attribute_group **groups;
 };
 
-int w1_create_master_attributes(struct w1_master *);
-void w1_destroy_master_attributes(struct w1_master *master);
-void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb);
-void w1_search_devices(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb);
-/* call w1_unref_slave to release the reference counts w1_search_slave added */
-struct w1_slave *w1_search_slave(struct w1_reg_num *id);
-/* decrements the reference on sl->master and sl, and cleans up if zero
- * returns the reference count after it has been decremented */
-int w1_unref_slave(struct w1_slave *sl);
-void w1_slave_found(struct w1_master *dev, u64 rn);
-void w1_search_process_cb(struct w1_master *dev, u8 search_type,
-	w1_slave_found_callback cb);
-struct w1_slave *w1_slave_search_device(struct w1_master *dev,
-	struct w1_reg_num *rn);
-struct w1_master *w1_search_master_id(u32 id);
-
-/* Disconnect and reconnect devices in the given family.  Used for finding
- * unclaimed devices after a family has been registered or releasing devices
- * after a family has been unregistered.  Set attach to 1 when a new family
- * has just been registered, to 0 when it has been unregistered.
+/**
+ * struct w1_family - reference counted family structure.
+ * @family_entry:	family linked list
+ * @fid:		8 bit family identifier
+ * @fops:		operations for this family
+ * @refcnt:		reference counter
+ */
+struct w1_family {
+	struct list_head	family_entry;
+	u8			fid;
+
+	struct w1_family_ops	*fops;
+
+	atomic_t		refcnt;
+};
+
+int w1_register_family(struct w1_family *family);
+void w1_unregister_family(struct w1_family *family);
+
+/**
+ * module_w1_driver() - Helper macro for registering a 1-Wire families
+ * @__w1_family: w1_family struct
+ *
+ * Helper macro for 1-Wire families which do not do anything special in module
+ * init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
  */
-void w1_reconnect_slaves(struct w1_family *f, int attach);
-int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn);
-/* 0 success, otherwise EBUSY */
-int w1_slave_detach(struct w1_slave *sl);
+#define module_w1_family(__w1_family) \
+	module_driver(__w1_family, w1_register_family, \
+			w1_unregister_family)
 
 u8 w1_triplet(struct w1_master *dev, int bdir);
 void w1_write_8(struct w1_master *, u8);
@@ -321,16 +317,6 @@ static inline struct w1_master* dev_to_w1_master(struct device *dev)
 	return container_of(dev, struct w1_master, dev);
 }
 
-extern struct device_driver w1_master_driver;
-extern struct device w1_master_device;
-extern int w1_max_slave_count;
-extern int w1_max_slave_ttl;
-extern struct list_head w1_masters;
-extern struct mutex w1_mlock;
-
-extern int w1_process_callbacks(struct w1_master *dev);
-extern int w1_process(void *);
-
 #endif /* __KERNEL__ */
 
-#endif /* __W1_H */
+#endif /* __LINUX_W1_H */
-- 
2.11.0

