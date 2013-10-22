From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 22 Oct 2013 16:43:49 +0000
Subject: build regressions 2013-10-22
Message-Id: <5266ab45.5nvHh/bPzo9+kxkV%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/powerpc/platforms/powernv/rng.c:64:2: error: implicit declaration of function 'of_get_ibm_chip_id' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/powernv/rng.c:85:2: error: implicit declaration of function 'of_iomap' [-Werror=implicit-function-declaration]
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
include/linux/mm.h:323:17: error: 'VMALLOC_START' undeclared (first use in this function)
include/linux/mm.h:323:41: error: 'VMALLOC_END' undeclared (first use in this function)
include/linux/mm.h:514:3: error: implicit declaration of function 'pte_mkwrite' [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/pgtable.h:63:92: error: conflicting types for 'pte_mkwrite'
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
block/genhd.c:979:15: error: field name not in record or union initializer
block/genhd.c:979:15: error: field name not in record or union initializer
block/genhd.c:980:15: error: field name not in record or union initializer
block/genhd.c:980:15: error: field name not in record or union initializer
block/genhd.c:981:15: error: field name not in record or union initializer
block/genhd.c:981:15: error: field name not in record or union initializer
block/genhd.c:982:15: error: field name not in record or union initializer
block/genhd.c:982:15: error: field name not in record or union initializer
block/genhd.c:983:15: error: field name not in record or union initializer
block/genhd.c:983:15: error: field name not in record or union initializer
block/genhd.c:984:15: error: field name not in record or union initializer
block/genhd.c:984:15: error: field name not in record or union initializer
block/genhd.c:985:15: error: field name not in record or union initializer
block/genhd.c:985:15: error: field name not in record or union initializer
block/genhd.c:987:15: error: field name not in record or union initializer
block/genhd.c:987:15: error: field name not in record or union initializer
block/genhd.c:988:15: error: field name not in record or union initializer
block/genhd.c:988:15: error: field name not in record or union initializer
block/genhd.c:989:15: error: field name not in record or union initializer
block/genhd.c:989:15: error: field name not in record or union initializer
block/genhd.c:1720:21: error: field name not in record or union initializer
block/genhd.c:1720:21: error: field name not in record or union initializer
block/genhd.c:1721:21: error: field name not in record or union initializer
block/genhd.c:1721:21: error: field name not in record or union initializer
block/genhd.c:1722:21: error: field name not in record or union initializer
block/genhd.c:1722:21: error: field name not in record or union initializer
block/genhd.c:1727:2: error: initializer element is not constant
block/genhd.c:1728:2: error: initializer element is not constant
block/genhd.c:1729:2: error: initializer element is not constant
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
block/partition-generic.c:170:15: error: field name not in record or union initializer
block/partition-generic.c:170:15: error: field name not in record or union initializer
block/partition-generic.c:171:15: error: field name not in record or union initializer
block/partition-generic.c:171:15: error: field name not in record or union initializer
block/partition-generic.c:172:15: error: field name not in record or union initializer
block/partition-generic.c:172:15: error: field name not in record or union initializer
block/partition-generic.c:173:15: error: field name not in record or union initializer
block/partition-generic.c:173:15: error: field name not in record or union initializer
block/partition-generic.c:174:15: error: field name not in record or union initializer
block/partition-generic.c:174:15: error: field name not in record or union initializer
block/partition-generic.c:175:15: error: field name not in record or union initializer
block/partition-generic.c:175:15: error: field name not in record or union initializer
block/partition-generic.c:177:15: error: field name not in record or union initializer
block/partition-generic.c:177:15: error: field name not in record or union initializer
block/partition-generic.c:178:15: error: field name not in record or union initializer
block/partition-generic.c:178:15: error: field name not in record or union initializer
block/partition-generic.c:266:15: error: field name not in record or union initializer
block/partition-generic.c:266:15: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
sound/core/pcm.c:1016:2: error: field name not in record or union initializer
sound/core/pcm.c:1016:2: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
sound/core/init.c:661:2: error: field name not in record or union initializer
sound/core/init.c:661:2: error: field name not in record or union initializer
sound/core/init.c:672:2: error: field name not in record or union initializer
sound/core/init.c:672:2: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/base/cpu.c:146:15: error: field name not in record or union initializer
drivers/base/cpu.c:146:15: error: field name not in record or union initializer
drivers/base/cpu.c:157:15: error: field name not in record or union initializer
drivers/base/cpu.c:157:15: error: field name not in record or union initializer
drivers/base/cpu.c:210:2: error: field name not in record or union initializer
drivers/base/cpu.c:210:2: error: field name not in record or union initializer
drivers/base/cpu.c:211:2: error: field name not in record or union initializer
drivers/base/cpu.c:211:2: error: field name not in record or union initializer
drivers/base/cpu.c:212:2: error: field name not in record or union initializer
drivers/base/cpu.c:212:2: error: field name not in record or union initializer
drivers/base/cpu.c:224:15: error: field name not in record or union initializer
drivers/base/cpu.c:224:15: error: field name not in record or union initializer
drivers/base/cpu.c:257:15: error: field name not in record or union initializer
drivers/base/cpu.c:257:15: error: field name not in record or union initializer
drivers/base/cpu.c:331:2: error: initializer element is not constant
drivers/base/cpu.c:332:2: error: initializer element is not constant
drivers/base/cpu.c:333:2: error: initializer element is not constant
drivers/base/cpu.c:334:2: error: initializer element is not constant
drivers/base/cpu.c:335:2: error: initializer element is not constant
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/block/loop.c:761:255: error: field name not in record or union initializer
drivers/block/loop.c:761:255: error: field name not in record or union initializer
drivers/block/loop.c:762:237: error: field name not in record or union initializer
drivers/block/loop.c:762:237: error: field name not in record or union initializer
drivers/block/loop.c:763:246: error: field name not in record or union initializer
drivers/block/loop.c:763:246: error: field name not in record or union initializer
drivers/block/loop.c:764:246: error: field name not in record or union initializer
drivers/block/loop.c:764:246: error: field name not in record or union initializer
drivers/block/loop.c:765:243: error: field name not in record or union initializer
drivers/block/loop.c:765:243: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/hid/hid-core.c:1923:15: error: field name not in record or union initializer
drivers/hid/hid-core.c:1923:15: error: field name not in record or union initializer
drivers/hid/hid-core.c:2048:15: error: field name not in record or union initializer
drivers/hid/hid-core.c:2048:15: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/input/serio/serio.c:454:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:454:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:455:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:455:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:456:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:456:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:457:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:457:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:458:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:458:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:459:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:459:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:460:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:460:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:461:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:461:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:739:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:739:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:763:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:763:15: error: field name not in record or union initializer
drivers/input/serio/serio.c:766:2: error: initializer element is not constant
drivers/input/serio/serio.c:767:2: error: initializer element is not constant
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/rtc/rtc-sysfs.c:32:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:32:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:48:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:48:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:64:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:64:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:81:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:81:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:103:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:103:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:123:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:123:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:224:15: error: field name not in record or union initializer
drivers/rtc/rtc-sysfs.c:224:15: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/tty/tty_io.c:3554:15: error: field name not in record or union initializer
drivers/tty/tty_io.c:3554:15: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/video/console/fbcon.c:3475:2: error: field name not in record or union initializer
drivers/video/console/fbcon.c:3475:2: error: field name not in record or union initializer
drivers/video/console/fbcon.c:3476:2: error: field name not in record or union initializer
drivers/video/console/fbcon.c:3476:2: error: field name not in record or union initializer
drivers/video/console/fbcon.c:3477:2: error: field name not in record or union initializer
drivers/video/console/fbcon.c:3477:2: error: field name not in record or union initializer
include/linux/device.h:45:19: error: field 'attr' has incomplete type
include/linux/device.h:265:19: error: field 'attr' has incomplete type
include/linux/device.h:418:19: error: field 'attr' has incomplete type
include/linux/device.h:513:19: error: field 'attr' has incomplete type
include/linux/device.h:725:17: error: field 'kobj' has incomplete type
include/linux/device.h:810:2: error: implicit declaration of function 'kobject_name' [-Werror=implicit-function-declaration]
include/linux/kobject.h:84:98: error: conflicting types for 'kobject_name'
drivers/tty/vt/vt.c:2946:15: error: field name not in record or union initializer
drivers/tty/vt/vt.c:2946:15: error: field name not in record or union initializer
drivers/tty/vt/vt.c:3330:2: error: field name not in record or union initializer
drivers/tty/vt/vt.c:3330:2: error: field name not in record or union initializer
drivers/tty/vt/vt.c:3331:2: error: field name not in record or union initializer
drivers/tty/vt/vt.c:3331:2: error: field name not in record or union initializer
include/linux/sysfs.h:443:2: error: implicit declaration of function 'kernfs_notify' [-Werror=implicit-function-declaration]
include/linux/sysfs.h:449:2: error: implicit declaration of function 'kernfs_find_and_get' [-Werror=implicit-function-declaration]
include/linux/sysfs.h:454:2: error: implicit declaration of function 'kernfs_get' [-Werror=implicit-function-declaration]
include/linux/sysfs.h:460:2: error: implicit declaration of function 'kernfs_put' [-Werror=implicit-function-declaration]
include/linux/kernfs.h:144:1: error: conflicting types for 'kernfs_find_and_get'
arch/powerpc/kernel/pci-common.c:216:15: error: field name not in record or union initializer
arch/powerpc/kernel/pci-common.c:216:15: error: field name not in record or union initializer
kernel/workqueue.c:3123:15: error: field name not in record or union initializer
kernel/workqueue.c:3123:15: error: field name not in record or union initializer
kernel/workqueue.c:3146:15: error: field name not in record or union initializer
kernel/workqueue.c:3146:15: error: field name not in record or union initializer
kernel/workqueue.c:3294:2: error: field name not in record or union initializer
kernel/workqueue.c:3294:2: error: field name not in record or union initializer
kernel/workqueue.c:3295:2: error: field name not in record or union initializer
kernel/workqueue.c:3295:2: error: field name not in record or union initializer
kernel/workqueue.c:3296:2: error: field name not in record or union initializer
kernel/workqueue.c:3296:2: error: field name not in record or union initializer
kernel/workqueue.c:3297:2: error: field name not in record or union initializer
kernel/workqueue.c:3297:2: error: field name not in record or union initializer
kernel/workqueue.c:3298:2: error: field name not in record or union initializer
kernel/workqueue.c:3372:49: error: request for member 'name' in something not a structure or union
drivers/ata/libata-scsi.c:154:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:154:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:256:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:256:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:289:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:289:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:302:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:302:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:344:8: error: field name not in record or union initializer
drivers/ata/libata-scsi.c:344:8: error: field name not in record or union initializer
drivers/ata/libata-transport.c:217:365: error: field name not in record or union initializer
drivers/ata/libata-transport.c:217:365: error: field name not in record or union initializer
drivers/ata/libata-transport.c:218:374: error: field name not in record or union initializer
drivers/ata/libata-transport.c:218:374: error: field name not in record or union initializer
drivers/ata/libata-transport.c:219:370: error: field name not in record or union initializer
drivers/ata/libata-transport.c:219:370: error: field name not in record or union initializer
drivers/ata/libata-transport.c:340:389: error: field name not in record or union initializer
drivers/ata/libata-transport.c:340:389: error: field name not in record or union initializer
drivers/ata/libata-transport.c:341:383: error: field name not in record or union initializer
drivers/ata/libata-transport.c:341:383: error: field name not in record or union initializer
drivers/ata/libata-transport.c:342:371: error: field name not in record or union initializer
drivers/ata/libata-transport.c:342:371: error: field name not in record or union initializer
drivers/ata/libata-transport.c:466:361: error: field name not in record or union initializer
drivers/ata/libata-transport.c:466:361: error: field name not in record or union initializer
drivers/ata/libata-transport.c:467:366: error: field name not in record or union initializer
drivers/ata/libata-transport.c:467:366: error: field name not in record or union initializer
drivers/ata/libata-transport.c:468:366: error: field name not in record or union initializer
drivers/ata/libata-transport.c:468:366: error: field name not in record or union initializer
drivers/ata/libata-transport.c:469:368: error: field name not in record or union initializer
drivers/ata/libata-transport.c:469:368: error: field name not in record or union initializer
drivers/ata/libata-transport.c:487:374: error: field name not in record or union initializer
drivers/ata/libata-transport.c:487:374: error: field name not in record or union initializer
drivers/ata/libata-transport.c:520:15: error: field name not in record or union initializer
drivers/ata/libata-transport.c:520:15: error: field name not in record or union initializer
drivers/ata/libata-transport.c:539:15: error: field name not in record or union initializer
drivers/ata/libata-transport.c:539:15: error: field name not in record or union initializer
drivers/ata/libata-transport.c:560:15: error: field name not in record or union initializer
drivers/ata/libata-transport.c:560:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:415:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:415:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:416:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:416:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:900:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:900:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:901:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:901:15: error: field name not in record or union initializer
drivers/i2c/i2c-core.c:905:2: error: initializer element is not constant
drivers/i2c/i2c-core.c:906:2: error: initializer element is not constant
drivers/i2c/i2c-core.c:907:2: error: initializer element is not constant
drivers/i2c/i2c-dev.c:114:15: error: field name not in record or union initializer
drivers/i2c/i2c-dev.c:114:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:166:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:166:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:176:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:176:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:187:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:187:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:197:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:197:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:207:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:207:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:218:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:218:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:228:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:228:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:238:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:238:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:249:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:249:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:258:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:258:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:284:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:284:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:296:15: error: field name not in record or union initializer
drivers/mtd/mtdcore.c:296:15: error: field name not in record or union initializer
drivers/net/tun.c:1533:15: error: field name not in record or union initializer
drivers/net/tun.c:1533:15: error: field name not in record or union initializer
drivers/net/tun.c:1534:15: error: field name not in record or union initializer
drivers/net/tun.c:1534:15: error: field name not in record or union initializer
drivers/net/tun.c:1535:15: error: field name not in record or union initializer
drivers/net/tun.c:1535:15: error: field name not in record or union initializer
drivers/pci/pci.c:4319:8: error: field name not in record or union initializer
drivers/pci/pci.c:4319:8: error: field name not in record or union initializer
drivers/pci/pci-driver.c:138:15: error: field name not in record or union initializer
drivers/pci/pci-driver.c:138:15: error: field name not in record or union initializer
drivers/pci/pci-driver.c:184:15: error: field name not in record or union initializer
drivers/pci/pci-driver.c:184:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:139:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:139:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:146:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:146:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:305:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:305:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:338:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:338:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:369:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:369:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:392:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:392:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:503:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:503:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:504:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:504:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:505:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:505:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:506:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:506:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:507:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:507:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:508:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:508:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:509:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:509:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:510:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:510:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:511:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:511:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:512:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:512:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:516:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:516:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:517:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:517:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:518:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:518:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:519:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:519:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:521:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:521:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:525:2: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:529:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:530:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:531:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:557:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:557:8: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:564:179: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:642:179: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:705:158: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:721:158: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:749:186: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:777:186: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:803:186: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:826:186: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:946:180: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:1004:180: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:1179:180: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:1206:180: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:1276:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:1276:15: error: field name not in record or union initializer
drivers/pci/pci-sysfs.c:1471:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:1478:121: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/pci/pci-sysfs.c:1489:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:1490:2: error: initializer element is not constant
drivers/pci/pci-sysfs.c:1497:121: error: invalid operands to binary - (have 'char *' and 'struct attribute **')
drivers/scsi/scsi_sysfs.c:162:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:162:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:202:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:202:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:234:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:234:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:248:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:248:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:282:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:282:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:284:354: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:284:354: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:285:355: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:285:355: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:286:359: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:286:359: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:287:355: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:287:355: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:288:361: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:288:361: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:289:371: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:289:371: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:290:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:290:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:291:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:291:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:292:367: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:292:367: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:293:361: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:293:361: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:530:385: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:530:385: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:531:379: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:531:379: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:532:365: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:532:365: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:533:377: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:533:377: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:534:371: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:534:371: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:535:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:535:370: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:536:365: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:536:365: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:560:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:560:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:589:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:589:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:598:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:598:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:619:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:619:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:657:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:657:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:674:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:674:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:682:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:682:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:695:429: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:695:429: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:696:423: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:696:423: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:697:421: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:697:421: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:706:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:706:15: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:741:983: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:741:983: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:742:1038: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:742:1038: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:743:1043: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:743:1043: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:744:1060: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:744:1060: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:745:1073: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:745:1073: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:746:1018: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:746:1018: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:750:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:751:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:752:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:753:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:754:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:755:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:756:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:757:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:758:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:759:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:760:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:761:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:762:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:763:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:764:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:765:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:766:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:767:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:768:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:769:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:770:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:771:2: error: initializer element is not constant
drivers/scsi/scsi_sysfs.c:811:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:811:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:841:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:841:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:897:2: error: field name not in record or union initializer
drivers/scsi/scsi_sysfs.c:897:2: error: field name not in record or union initializer
drivers/scsi/sd.c:225:15: error: field name not in record or union initializer
drivers/scsi/sd.c:225:15: error: field name not in record or union initializer
drivers/scsi/sd.c:252:15: error: field name not in record or union initializer
drivers/scsi/sd.c:252:15: error: field name not in record or union initializer
drivers/scsi/sd.c:262:15: error: field name not in record or union initializer
drivers/scsi/sd.c:262:15: error: field name not in record or union initializer
drivers/scsi/sd.c:271:15: error: field name not in record or union initializer
drivers/scsi/sd.c:271:15: error: field name not in record or union initializer
drivers/scsi/sd.c:303:15: error: field name not in record or union initializer
drivers/scsi/sd.c:303:15: error: field name not in record or union initializer
drivers/scsi/sd.c:326:15: error: field name not in record or union initializer
drivers/scsi/sd.c:326:15: error: field name not in record or union initializer
drivers/scsi/sd.c:335:15: error: field name not in record or union initializer
drivers/scsi/sd.c:335:15: error: field name not in record or union initializer
drivers/scsi/sd.c:345:15: error: field name not in record or union initializer
drivers/scsi/sd.c:345:15: error: field name not in record or union initializer
drivers/scsi/sd.c:393:15: error: field name not in record or union initializer
drivers/scsi/sd.c:393:15: error: field name not in record or union initializer
drivers/scsi/sd.c:419:15: error: field name not in record or union initializer
drivers/scsi/sd.c:419:15: error: field name not in record or union initializer
drivers/scsi/sd.c:461:15: error: field name not in record or union initializer
drivers/scsi/sd.c:461:15: error: field name not in record or union initializer
drivers/video/output.c:64:15: error: field name not in record or union initializer
drivers/video/output.c:64:15: error: field name not in record or union initializer
drivers/usb/class/usblp.c:1081:15: error: field name not in record or union initializer
drivers/usb/class/usblp.c:1081:15: error: field name not in record or union initializer
drivers/usb/core/hcd.c:887:15: error: field name not in record or union initializer
drivers/usb/core/hcd.c:887:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:44:333: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:44:333: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:45:351: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:45:351: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:46:343: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:46:343: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:47:337: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:47:337: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:56:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:56:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:80:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:80:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:126:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:126:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:142:15: error: field name not in record or union initializer
drivers/usb/core/endpoint.c:142:15: error: field name not in record or union initializer
drivers/usb/core/port.c:49:15: error: field name not in record or union initializer
drivers/usb/core/port.c:49:15: error: field name not in record or union initializer
drivers/usb/host/ehci-sysfs.c:75:15: error: field name not in record or union initializer
drivers/usb/host/ehci-sysfs.c:75:15: error: field name not in record or union initializer
drivers/usb/host/ehci-sysfs.c:162:15: error: field name not in record or union initializer
drivers/usb/host/ehci-sysfs.c:162:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2516:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2516:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2517:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2517:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2518:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2518:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2519:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2519:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2520:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2520:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2521:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2521:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2522:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2522:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2523:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2523:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2524:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2524:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2525:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2525:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2526:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2526:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2527:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2527:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2528:15: error: field name not in record or union initializer
drivers/tty/serial/serial_core.c:2528:15: error: field name not in record or union initializer
drivers/usb/serial/bus.c:48:15: error: field name not in record or union initializer
drivers/usb/serial/bus.c:48:15: error: field name not in record or union initializer
drivers/usb/serial/bus.c:143:15: error: field name not in record or union initializer
drivers/usb/serial/bus.c:143:15: error: field name not in record or union initializer
drivers/usb/serial/ftdi_sio.c:1591:15: error: field name not in record or union initializer
drivers/usb/serial/ftdi_sio.c:1591:15: error: field name not in record or union initializer
drivers/usb/serial/ftdi_sio.c:1619:15: error: field name not in record or union initializer
drivers/usb/serial/ftdi_sio.c:1619:15: error: field name not in record or union initializer
drivers/usb/storage/scsiglue.c:522:15: error: field name not in record or union initializer
drivers/usb/storage/scsiglue.c:522:15: error: field name not in record or union initializer
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drv.c:74:26: error: 'SZ_64K' undeclared (first use in this function)
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_gem.c:138:42: error: 'SZ_2M' undeclared (first use in this function)
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
drivers/gpu/drm/armada/armada_drm.h:29:3: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]

[warnings]
Warning(drivers/spi/spi.c:613): No description found for parameter 'master'
Warning(drivers/spi/spi.c:613): No description found for parameter 'master'
arch/powerpc/platforms/powernv/rng.c:85:12: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
block/genhd.c:1301:2: warning: passing argument 1 of 'kobject_get' from incompatible pointer type [enabled by default]
block/genhd.c:1315:3: warning: passing argument 1 of 'kobject_put' from incompatible pointer type [enabled by default]
block/genhd.c:1327:2: warning: passing argument 1 of 'kobject_uevent_env' from incompatible pointer type [enabled by default]
block/genhd.c:1647:3: warning: passing argument 1 of 'kobject_uevent_env' from incompatible pointer type [enabled by default]
block/genhd.c:1803:2: warning: passing argument 1 of 'sysfs_create_files' from incompatible pointer type [enabled by default]
block/genhd.c:1829:2: warning: passing argument 1 of 'sysfs_remove_files' from incompatible pointer type [enabled by default]
block/genhd.c:494:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:791:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
block/partition-generic.c:341:2: warning: passing argument 2 of 'kobject_create_and_add' from incompatible pointer type [enabled by default]
block/partition-generic.c:357:3: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
block/partition-generic.c:463:2: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
block/partition-generic.c:547:2: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
include/linux/device.h:811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:843:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
drivers/block/loop.c:784:7: warning: passing argument 1 of 'sysfs_create_group' from incompatible pointer type [enabled by default]
drivers/block/loop.c:790:7: warning: passing argument 1 of 'sysfs_remove_group' from incompatible pointer type [enabled by default]
drivers/block/loop.c:911:2: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
drivers/block/loop.c:943:2: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
drivers/block/loop.c:1050:3: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
drivers/hid/hid-core.c:1470:79: warning: initialization from incompatible pointer type [enabled by default]
drivers/hid/hid-core.c:1470:79: warning: (near initialization for 'dev') [enabled by default]
drivers/hid/hid-core.c:1565:2: warning: passing argument 2 of 'device_create_bin_file' from incompatible pointer type [enabled by default]
drivers/hid/hid-core.c:1580:2: warning: passing argument 2 of 'device_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/hid/hid-core.c:2086:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/hid/hid-core.c:2086:2: warning: (near initialization for 'hid_bus_type.uevent') [enabled by default]
include/linux/device.h:811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
drivers/input/serio/serio.c:1000:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/serio/serio.c:1000:2: warning: (near initialization for 'serio_bus.uevent') [enabled by default]
include/linux/device.h:853:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:811:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/i2c.h:237:86: warning: initialization from incompatible pointer type [enabled by default]
include/linux/i2c.h:237:86: warning: (near initialization for 'dev') [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/i2c.h:237:86: warning: initialization from incompatible pointer type [enabled by default]
include/linux/i2c.h:237:86: warning: (near initialization for 'dev') [enabled by default]
include/linux/device.h:114:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:114:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/device.h:359:47: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:503:43: warning: 'struct kobj_uevent_env' declared inside parameter list [enabled by default]
include/linux/device.h:564:19: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/device.h:566:21: warning: 'struct bin_attribute' declared inside parameter list [enabled by default]
include/linux/sysfs.h:441:118: warning: 'struct sysfs_dirent' declared inside parameter list [enabled by default]
include/linux/sysfs.h:441:118: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/sysfs.h:449:2: warning: return makes pointer from integer without a cast [enabled by default]
include/linux/kernfs.h:72:6: warning: conflicting types for 'kernfs_get' [enabled by default]
include/linux/kernfs.h:73:6: warning: conflicting types for 'kernfs_put' [enabled by default]
include/linux/kernfs.h:93:6: warning: conflicting types for 'kernfs_notify' [enabled by default]
kernel/workqueue.c:3382:2: warning: passing argument 1 of 'kobject_uevent' from incompatible pointer type [enabled by default]
drivers/i2c/i2c-core.c:460:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/i2c/i2c-core.c:460:2: warning: (near initialization for 'i2c_client_type.uevent') [enabled by default]
drivers/misc/eeprom/eeprom.c:88:146: warning: initialization from incompatible pointer type [enabled by default]
drivers/misc/eeprom/eeprom.c:88:146: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-driver.c:1318:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-driver.c:1318:2: warning: (near initialization for 'pci_bus_type.uevent') [enabled by default]
drivers/pci/pci-sysfs.c:564:137: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:564:137: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:642:137: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:642:137: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:705:116: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:705:116: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:721:116: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:721:116: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:749:144: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:749:144: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:777:144: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:777:144: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:803:144: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:803:144: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:826:144: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:826:144: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:874:2: warning: passing argument 2 of 'device_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:886:2: warning: passing argument 2 of 'device_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:893:2: warning: passing argument 2 of 'device_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:906:3: warning: passing argument 2 of 'device_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:907:3: warning: passing argument 2 of 'device_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:946:138: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:946:138: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:1004:138: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1004:138: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:1080:4: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1086:4: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1121:3: warning: passing argument 1 of 'sysfs_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1179:138: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1179:138: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:1206:138: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1206:138: warning: (near initialization for '__mptr') [enabled by default]
drivers/pci/pci-sysfs.c:1295:3: warning: passing argument 1 of 'sysfs_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1317:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1334:3: warning: passing argument 1 of 'sysfs_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1336:3: warning: passing argument 1 of 'sysfs_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1362:3: warning: passing argument 1 of 'sysfs_create_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1386:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1394:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1396:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1404:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1431:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1433:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1443:3: warning: passing argument 1 of 'sysfs_remove_bin_file' from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1478:79: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1478:79: warning: (near initialization for 'dev') [enabled by default]
drivers/pci/pci-sysfs.c:1481:8: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/pci/pci-sysfs.c:1497:79: warning: initialization from incompatible pointer type [enabled by default]
drivers/pci/pci-sysfs.c:1497:79: warning: (near initialization for 'dev') [enabled by default]
drivers/scsi/scsi_sysfs.c:416:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/scsi/scsi_sysfs.c:416:2: warning: (near initialization for 'scsi_bus_type.uevent') [enabled by default]
drivers/usb/core/usb.c:374:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/usb/core/usb.c:374:2: warning: (near initialization for 'usb_device_type.uevent') [enabled by default]
drivers/usb/core/hcd.c:2695:2: warning: passing argument 1 of 'sysfs_create_group' from incompatible pointer type [enabled by default]
drivers/usb/core/hcd.c:2764:2: warning: passing argument 1 of 'sysfs_remove_group' from incompatible pointer type [enabled by default]
drivers/usb/core/message.c:1590:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/usb/core/message.c:1590:2: warning: (near initialization for 'usb_if_device_type.uevent') [enabled by default]
drivers/gpu/drm/armada/armada_fbdev.c:108:2: warning: format '%x' expects argument of type 'unsigned int', but argument 8 has type 'phys_addr_t' [-Wformat=]
drivers/gpu/drm/armada/armada_gem.c:175:2: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'phys_addr_t' [-Wformat=]
drivers/gpu/drm/armada/armada_gem.c:175:2: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'resource_size_t' [-Wformat=]
drivers/gpu/drm/armada/armada_gem.c:401:3: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type 'size_t' [-Wformat=]
drivers/gpu/drm/armada/armada_debugfs.c:107:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/drm/armada/armada_debugfs.c:107:2: warning: (near initialization for 'fops_reg_w.write') [enabled by default]

[sparse]
drivers/usb/gadget/zero.c:99:10: sparse: symbol 'max_autoresume' was not declared. Should it be static?
drivers/usb/gadget/zero.c:104:10: sparse: symbol 'autoresume_interval_ms' was not declared. Should it be static?
drivers/gpu/drm/armada/armada_fbdev.c:102:27: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2>*screen_base @@    got noderef] <asn:2>*screen_base @@
drivers/gpu/drm/armada/armada_gem.c:67:37: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/gpu/drm/armada/armada_drm.h:29:31: sparse: not a function <noident>
drivers/gpu/drm/armada/armada_drm.h:29:31: sparse: not a function <noident>
drivers/gpu/drm/armada/armada_drm.h:29:31: sparse: not a function <noident>
drivers/gpu/drm/armada/armada_drm.h:29:31: sparse: not a function <noident>
drivers/gpu/drm/armada/armada_debugfs.c:107:18: sparse: incorrect type in initializer (different type sizes) @@    expected long ( *write )( ... ) @@    got int ( static [toplong ( *write )( ... ) @@
fs/kernfs/dir.c:414:6: sparse: context imbalance in 'sysfs_addrm_start' - wrong count at exit
fs/kernfs/dir.c:532:9: sparse: context imbalance in 'sysfs_addrm_finish' - wrong count at exit
fs/kernfs/file.c:777:32: sparse: cast truncates bits from constant value (10000 becomes 0)
drivers/usb/gadget/configfs.c:994:6: sparse: symbol 'unregister_gadget_item' was not declared. Should it be static?
drivers/gpu/drm/armada/armada_overlay.c:53:9: sparse: undefined identifier 'writel_relaxed'
drivers/gpu/drm/armada/armada_drm.h:29:17: sparse: undefined identifier 'writel_relaxed'
drivers/gpu/drm/armada/armada_drv.c:110:40: sparse: undefined identifier 'SZ_64K'
drivers/gpu/drm/armada/armada_drv.c:281:9: sparse: undefined identifier 'writel_relaxed'
drivers/gpu/drm/armada/armada_crtc.c:96:17: sparse: undefined identifier 'writel_relaxed'
drivers/gpu/drm/armada/armada_gem.c:138:34: sparse: undefined identifier 'SZ_2M'
drivers/spi/spi-omap-100k.c:73:9: sparse: preprocessor token WRITE redefined
drivers/spi/spi-omap-100k.c:74:9: sparse: preprocessor token READ redefined

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
