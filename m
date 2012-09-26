From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 26 Sep 2012 01:37:17 +0000
Subject: [nouveau:master 5/82] drivers/gpu/drm/nouveau/nouveau_drv.h:652:2: error: redeclaration of enumerato
Message-Id: <20120926013717.GC8522@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Ben,

FYI, kernel build failed on

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   f2aa204da8af348697ac0e6d4c2a9a56c3ccf52b
commit: 452d258c97822c6ec610a3460c11a4687a958962 [5/82] drm/nouveau: implement module init functions in nouveau_drm.c
config: x86_64-allmodconfig

All error/warnings:

In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:552:8: error: redefinition of 'struct nouveau_engine'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:6:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/engine.h:10:8: note: originally defined here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:652:2: error: redeclaration of enumerator 'NV_04'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:57:3: note: previous definition of 'NV_04' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:653:2: error: redeclaration of enumerator 'NV_10'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:58:3: note: previous definition of 'NV_10' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:654:2: error: redeclaration of enumerator 'NV_20'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:59:3: note: previous definition of 'NV_20' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:655:2: error: redeclaration of enumerator 'NV_30'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:60:3: note: previous definition of 'NV_30' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:656:2: error: redeclaration of enumerator 'NV_40'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:61:3: note: previous definition of 'NV_40' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:657:2: error: redeclaration of enumerator 'NV_50'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:62:3: note: previous definition of 'NV_50' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:658:2: error: redeclaration of enumerator 'NV_C0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:63:3: note: previous definition of 'NV_C0' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:659:2: error: redeclaration of enumerator 'NV_D0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:64:3: note: previous definition of 'NV_D0' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:660:2: error: redeclaration of enumerator 'NV_E0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/device.h:65:3: note: previous definition of 'NV_E0' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1431:19: error: conflicting types for 'nv_rd32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:78:1: note: previous definition of 'nv_rd32' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1437:20: error: conflicting types for 'nv_wr32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:103:1: note: previous definition of 'nv_wr32' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1443:19: error: conflicting types for 'nv_mask'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:111:1: note: previous definition of 'nv_mask' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1450:18: error: conflicting types for 'nv_rd08'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:60:1: note: previous definition of 'nv_rd08' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1456:20: error: conflicting types for 'nv_wr08'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:87:1: note: previous definition of 'nv_wr08' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1483:12: error: conflicting types for 'nv_ro32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/object.h:142:1: note: previous definition of 'nv_ro32' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1484:13: error: conflicting types for 'nv_wo32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/object.h:164:1: note: previous definition of 'nv_wo32' was here
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1490:0: warning: "NV_PRINTK" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/nouveau_drm.h:31:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1494:0: warning: "NV_DEBUG" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/nouveau_drm.h:42:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1516:0: warning: "NV_ERROR" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/nouveau_drm.h:36:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1517:0: warning: "NV_INFO" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/nouveau_drm.h:40:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1520:0: warning: "NV_WARN" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/nouveau_drm.h:38:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/core/ramht.c:27:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1589:1: error: conflicting types for 'nv_engine'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:6:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/core/ramht.c:27:
drivers/gpu/drm/nouveau/core/include/core/engine.h:20:1: note: previous definition of 'nv_engine' was here
--
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:552:8: error: redefinition of 'struct nouveau_engine'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:6:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/engine.h:10:8: note: originally defined here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:652:2: error: redeclaration of enumerator 'NV_04'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:57:3: note: previous definition of 'NV_04' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:653:2: error: redeclaration of enumerator 'NV_10'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:58:3: note: previous definition of 'NV_10' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:654:2: error: redeclaration of enumerator 'NV_20'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:59:3: note: previous definition of 'NV_20' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:655:2: error: redeclaration of enumerator 'NV_30'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:60:3: note: previous definition of 'NV_30' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:656:2: error: redeclaration of enumerator 'NV_40'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:61:3: note: previous definition of 'NV_40' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:657:2: error: redeclaration of enumerator 'NV_50'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:62:3: note: previous definition of 'NV_50' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:658:2: error: redeclaration of enumerator 'NV_C0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:63:3: note: previous definition of 'NV_C0' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:659:2: error: redeclaration of enumerator 'NV_D0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:64:3: note: previous definition of 'NV_D0' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:660:2: error: redeclaration of enumerator 'NV_E0'
In file included from drivers/gpu/drm/nouveau/core/include/core/parent.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/device.h:65:3: note: previous definition of 'NV_E0' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1431:19: error: conflicting types for 'nv_rd32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:78:1: note: previous definition of 'nv_rd32' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1437:20: error: conflicting types for 'nv_wr32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:103:1: note: previous definition of 'nv_wr32' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1443:19: error: conflicting types for 'nv_mask'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:111:1: note: previous definition of 'nv_mask' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1450:18: error: conflicting types for 'nv_rd08'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:60:1: note: previous definition of 'nv_rd08' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1456:20: error: conflicting types for 'nv_wr08'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:5:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/subdev.h:87:1: note: previous definition of 'nv_wr08' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1483:12: error: conflicting types for 'nv_ro32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/object.h:142:1: note: previous definition of 'nv_ro32' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1484:13: error: conflicting types for 'nv_wo32'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:4:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/object.h:164:1: note: previous definition of 'nv_wo32' was here
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1490:0: warning: "NV_PRINTK" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/nouveau_drm.h:31:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1494:0: warning: "NV_DEBUG" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/nouveau_drm.h:42:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1516:0: warning: "NV_ERROR" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/nouveau_drm.h:36:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1517:0: warning: "NV_INFO" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/nouveau_drm.h:40:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1520:0: warning: "NV_WARN" redefined [enabled by default]
In file included from drivers/gpu/drm/nouveau/nouveau_drv.h:62:0,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/nouveau_drm.h:38:0: note: this is the location of the previous definition
In file included from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:0:
drivers/gpu/drm/nouveau/nouveau_drv.h:1589:1: error: conflicting types for 'nv_engine'
In file included from drivers/gpu/drm/nouveau/core/include/core/device.h:6:0,
                 from drivers/gpu/drm/nouveau/core/include/core/parent.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/namedb.h:4,
                 from drivers/gpu/drm/nouveau/core/include/core/client.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drm.h:4,
                 from drivers/gpu/drm/nouveau/nouveau_drv.h:62,
                 from drivers/gpu/drm/nouveau/core/subdev/fb/nv04.c:3:
drivers/gpu/drm/nouveau/core/include/core/engine.h:20:1: note: previous definition of 'nv_engine' was here
..

vim +652 drivers/gpu/drm/nouveau/nouveau_drv.h
   646		struct nv04_crtc_reg crtc_reg[2];
   647		uint32_t pllsel;
   648		uint32_t sel_clk;
   649	};
   650	
   651	enum nouveau_card_type {
 > 652		NV_04      = 0x04,
   653		NV_10      = 0x10,
   654		NV_20      = 0x20,
   655		NV_30      = 0x30,

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
