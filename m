From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 15 Oct 2013 16:45:40 +0000
Subject: build regressions 2013-10-15
Message-Id: <525d7134.4C4C5VgtRmQc1XqV%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
Error(drivers/base/fence.c:35): cannot understand prototype: 'atomic_t fence_context_counter = ATOMIC_INIT(0); '
arch/x86/platform/uv/uv_nmi.c:74:17: warning: 'uv_nmi_kexec_failed' defined but not used [-Wunused-variable]

[sparse]
include/linux/spinlock.h:348:9: sparse: context imbalance in 'nouveau_event_put' - different lock contexts for basic block
include/linux/spinlock.h:348:9: sparse: context imbalance in 'nouveau_event_get' - different lock contexts for basic block
include/linux/spinlock.h:348:9: sparse: context imbalance in 'nouveau_event_trigger' - different lock contexts for basic block
arch/x86/mm/pageattr.c:1754:40: sparse: Using plain integer as NULL pointer
arch/x86/mm/pageattr.c:1773:40: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/drm_atomic_helper.c:192:6: sparse: symbol '_drm_atomic_helper_state_free' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
