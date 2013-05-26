From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 26 May 2013 18:37:33 +0000
Subject: build regressions 2013-05-26
Message-Id: <51a2566d.W5Mefni3AqNCfHl1%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
zcache-main.c:(.text+0xb1c8a): undefined reference to `ramster_pampd_free'
zcache-main.c:(.text+0xb1cbc): undefined reference to `ramster_count_foreign_pages'
zcache-main.c:(.text+0xb1f05): undefined reference to `ramster_count_foreign_pages'
zcache-main.c:(.text+0xb228d): undefined reference to `ramster_cpu_up'
zcache-main.c:(.text+0xb2339): undefined reference to `ramster_cpu_down'
(.text+0xb26ce): undefined reference to `ramster_count_foreign_pages'
(.text+0xb27ef): undefined reference to `ramster_count_foreign_pages'
(.text+0xb299f): undefined reference to `ramster_do_preload_flnode'
(.text+0xb2ea3): undefined reference to `ramster_do_preload_flnode'
(.text+0xb307c): undefined reference to `ramster_do_preload_flnode'
zcache-main.c:(.text+0xb3629): undefined reference to `ramster_register_pamops'
zcache-main.c:(.text+0xb3868): undefined reference to `ramster_init'
drivers/built-in.o:(.rodata+0x15058): undefined reference to `ramster_foreign_eph_pages'
drivers/built-in.o:(.rodata+0x15078): undefined reference to `ramster_foreign_pers_pages'
(.text+0x2ea46d): undefined reference to `crc32_le'

[coccinelle]
drivers/mfd/wm8994-irq.c:244:8-28: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
drivers/mfd/wm8994-irq.c:244:8-28: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
drivers/usb/gadget/f_eem.c:619:9-16: WARNING: ERR_CAST can be used with opts -> net
drivers/usb/gadget/f_eem.c:619:9-16: WARNING: ERR_CAST can be used with opts -> net
drivers/usb/gadget/f_subset.c:278:8-14: WARNING: PTR_RET can be used
drivers/usb/gadget/f_subset.c:278:8-14: WARNING: PTR_RET can be used
drivers/usb/gadget/f_subset.c:550:2-8: preceding lock on line 543
drivers/usb/gadget/f_subset.c:550:2-8: preceding lock on line 543

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
