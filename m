From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 19 Aug 2013 18:36:07 +0000
Subject: build regressions 2013-08-19
Message-Id: <52126597.l0QHmKHcg9Z9/9/r%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/fsl/imx-pcm-dma.c:77:16: error: expected declaration specifiers or '...' before string constant
arch/s390/mm/pgtable.c:1175:2: error: too few arguments to function 'tlb_gather_mmu'
fs/f2fs/segment.c:556:1: error: label at end of compound statement

[warnings]
drivers/gpu/drm/i2c/tda998x_drv.c:561:18: warning: 'clksel_aip' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i2c/tda998x_drv.c:561:30: warning: 'clksel_fs' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i2c/tda998x_drv.c:408:1: warning: 'reg_write_range' uses dynamic stack allocation [enabled by default]
warning: (SND_ES1968_RADIO && SND_FM801_TEA575X_BOOL) selects RADIO_TEA575X which has unmet direct dependencies (MEDIA_SUPPORT && RADIO_ADAPTERS && VIDEO_V4L2)
warning: (SND_ES1968_RADIO && SND_FM801_TEA575X_BOOL) selects RADIO_TEA575X which has unmet direct dependencies (MEDIA_SUPPORT && RADIO_ADAPTERS && VIDEO_V4L2)
warning: (SND_ES1968_RADIO && SND_FM801_TEA575X_BOOL) selects RADIO_TEA575X which has unmet direct dependencies (MEDIA_SUPPORT && RADIO_ADAPTERS && VIDEO_V4L2)
kernel/rcutiny.c:277:3: warning: passing argument 3 of 'trace_rcu_batch_end' makes integer from pointer without a cast [enabled by default]

[sparse]
drivers/media/platform/vsp1/vsp1_drv.c:434:21: sparse: cast removes address space of expression
drivers/media/platform/vsp1/vsp1_drv.c:435:33: sparse: cast removes address space of expression
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
include/media/v4l2-common.h:89:17: sparse: duplicate const
drivers/gpu/drm/i2c/tda998x_drv.c:397:24: sparse: Variable length array is used.
drivers/regulator/core.c:639:10: sparse: undefined identifier 'dev_attr_name'
drivers/regulator/core.c:640:10: sparse: undefined identifier 'dev_attr_num_users'
drivers/regulator/core.c:641:10: sparse: undefined identifier 'dev_attr_type'
drivers/regulator/core.c:655:10: sparse: unknown field name in initializer
drivers/media/v4l2-core/v4l2-dv-timings.c:30:9: sparse: unknown field name in initializer

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
