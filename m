From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 25 Aug 2013 20:58:52 +0000
Subject: build regressions 2013-08-25
Message-Id: <521a700c.nAERV27hi3Pqzo0w%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:742:3: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
make[6]: *** No rule to make target `drivers/video/xylon/xylonfb/of/../core/xylonfb_core.o', needed by `drivers/video/xylon/xylonfb/of/xylonfb_of.o'.
drivers/media/i2c/adv7511.c:1942:29: error: 'struct v4l2_subdev' has no member named 'entity'
drivers/media/i2c/adv7511.c:1997:26: error: 'struct v4l2_subdev' has no member named 'entity'
drivers/media/i2c/adv7511.c:2024:26: error: 'struct v4l2_subdev' has no member named 'entity'

[warnings]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:742:23: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:752:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:753:4: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:127:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/video/xylon/xylonfb/of/../core/xylonfb.c:135:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/video/xylon/xylonfb/of/../core/logiclk.c:354:7: warning: 'mult_const' may be used uninitialized in this function [-Wmaybe-uninitialized]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
