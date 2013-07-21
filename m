From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Jul 2013 22:15:23 +0000
Subject: build regressions 2013-07-21
Message-Id: <51ec5d7b.JI4Tuzy7nYRKldDB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
clkdev.c:(.text+0xb4730): undefined reference to `shdma_chan_filter'
ERROR: "of_get_next_parent" [drivers/mtd/devices/m25p80.ko] undefined!
ERROR: "blk_mq_alloc_request" undefined!
samsung-laptop.c:(.init.text+0x19f80): undefined reference to `acpi_video_unregister'
crypto/built-in.o:(.rodata+0x12328): undefined reference to `RSA_public_key_algorithm'
crypto/built-in.o:(.rodata+0x12328): undefined reference to `RSA_public_key_algorithm'
hest.c:(.init.text+0x4651): undefined reference to `mce_disable_bank'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
