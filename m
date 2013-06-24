From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 24 Jun 2013 06:24:37 +0000
Subject: build regressions 2013-06-23
Message-Id: <51c7e625.ZhQVkAdqqi3auVa4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/afs/flock.c:255:15: error: expected identifier or '(' before '=' token
fs/afs/flock.c:277:13: error: 'inode' undeclared (first use in this function)
ERROR: "of_get_next_parent" [drivers/mtd/devices/m25p80.ko] undefined!
include/linux/compiler.h:137:17: error: too many arguments to function 'register_hotplug_dock_device'
drivers/pci/hotplug/acpiphp_glue.c:317:4: error: too many arguments to function 'register_hotplug_dock_device'

[coccinelle]
lib/fonts/font_10x18.c:5135:34-35: pref: first occurrence line 5142, second occurrence line 5144
lib/fonts/font_acorn_8x8.c:264:38-39: pref: first occurrence line 271, second occurrence line 273
lib/fonts/font_sun12x22.c:6154:38-39: pref: first occurrence line 6161, second occurrence line 6163
lib/fonts/font_sun8x16.c:264:37-38: pref: first occurrence line 271, second occurrence line 273
lib/fonts/fonts.c:92:3-19: code aligned with following code on line 90

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
