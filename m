From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 08 Jan 2013 18:18:54 +0000
Subject: build regressions 2013-01-08
Message-Id: <50ec630e.xKKYfuGlUHq52h9T%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpu/drm/drm_mm.c:629:3: error: implicit declaration of function '__drm_mm_hole_node_end' [-Werror=implicit-function-declaration]

[warnings]
drivers/scsi/mpt3sas/mpt3sas_scsih.c:5488:2: warning: 'query_count' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/scsi/mpt3sas/mpt3sas_scsih.c:5488:2: warning: 'termination_count' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/i915/intel_display.c:5122:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/net/wireless/ath/ath9k/mci.c:478:22: warning: unused variable 'buf' [-Wunused-variable]
arch/x86/kvm/paging_tmpl.h:154:57: warning: unused variable 'shift' [-Wunused-variable]
kernel/sched/fair.c:2121:13: warning: unused variable 'rq' [-Wunused-variable]

[sparse]
net/sunrpc/xprt.c:1142:22: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c:101:5: sparse: symbol 'bnx2x_send_msg2pf' was not declared. Should it be static?
drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c:144:5: sparse: symbol 'bnx2x_get_vf_id' was not declared. Should it be static?
drivers/staging/ft1000/ft1000-usb/ft1000_hw.c:857:5: sparse: symbol 'ft1000_reset' was not declared. Should it be static?

[smatch]
drivers/md/raid1.c:2861 run() warn: variable dereferenced before check 'mddev->queue' (see line 2823)
drivers/md/raid10.c:3583 run() error: we previously assumed 'mddev->queue' could be null (see line 3572)
drivers/md/raid10.c:3626 run() warn: variable dereferenced before check 'mddev->queue' (see line 3583)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
