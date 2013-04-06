From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 06 Apr 2013 22:15:33 +0000
Subject: build regressions 2013-04-06
Message-Id: <51609e85.aCSkSf7QBJqZFUjD%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mm/ioremap.c:222:2: error: 'vmlist_lock' undeclared (first use in this function)
arch/arm/mm/ioremap.c:223:14: error: 'vmlist' undeclared (first use in this function)
arch/arm/mm/ioremap.c:351:2: error: 'vmlist_lock' undeclared (first use in this function)
arch/arm/mm/ioremap.c:352:12: error: 'vmlist' undeclared (first use in this function)
arch/arm/mm/mmu.c:818:12: error: 'vmlist' undeclared (first use in this function)
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2963:2: error: assignment of member 'owner' in read-only object
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2964:2: error: assignment of member 'owner' in read-only object
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2965:2: error: assignment of member 'owner' in read-only object
drivers/tty/serial/xilinx_uartps.c:438:7: error: 'PRE_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:446:36: error: dereferencing pointer to incomplete type
drivers/tty/serial/xilinx_uartps.c:451:7: error: 'POST_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:460:24: error: dereferencing pointer to incomplete type
drivers/tty/serial/xilinx_uartps.c:493:7: error: 'ABORT_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:1263:3: error: implicit declaration of function 'clk_get_sys' [-Werror=implicit-function-declaration]
drivers/tty/serial/xilinx_uartps.c:1295:2: error: implicit declaration of function 'clk_notifier_register' [-Werror=implicit-function-declaration]
drivers/tty/serial/xilinx_uartps.c:1329:2: error: implicit declaration of function 'clk_notifier_unregister' [-Werror=implicit-function-declaration]
make[6]: *** No rule to make target `drivers/video/xylon/xylonfb/platform/../core/xylonfb_core.o', needed by `drivers/video/xylon/xylonfb/platform/xylonfb_platform.o'.
arch/s390/kvm/../../../virt/kvm/kvm_main.c:2963:2: error: assignment of member 'owner' in read-only object
arch/s390/kvm/../../../virt/kvm/kvm_main.c:2964:2: error: assignment of member 'owner' in read-only object
arch/s390/kvm/../../../virt/kvm/kvm_main.c:2965:2: error: assignment of member 'owner' in read-only object

[warnings]
include/generated/utsrelease.h:1:1: warning: this is the location of the previous definition
include/generated/utsrelease.h:1:1: warning: this is the location of the previous definition
include/linux/version.h:1:1: warning: this is the location of the previous definition
drivers/block/virtio_blk.c:827:19: warning: 'opt_io_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:821:19: warning: 'min_io_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:815:29: warning: 'alignment_offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/block/virtio_blk.c:808:32: warning: 'physical_block_exp' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/inode.c:1375:18: warning: 'ram_bytes' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/tty/serial/xilinx_uartps.c:1263:20: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/tty/serial/xilinx_uartps.c:1265:20: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/tty/serial/xilinx_uartps.c:1272:19: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/tty/serial/xilinx_uartps.c:1274:19: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:127:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:135:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:47:1: sparse: incorrect type in argument 3 (different base types)
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:81:1: sparse: incorrect type in argument 3 (different base types)
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:115:1: sparse: incorrect type in argument 3 (different base types)
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: cast from restricted gfp_t
include/trace/events/kmem.h:153:1: sparse: incorrect type in argument 3 (different base types)
include/trace/events/kmem.h:153:1: sparse: too many warnings

[smatch]
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:1771 xylonfb_init_driver() error: potential NULL dereference 'ld'.
drivers/input/input-mt.c:265 input_mt_sync_frame() warn: maybe use && instead of &

[coccinelle]
drivers/gpu/drm/nouveau/nouveau_drm.c:558:7-8: date: first occurrence line 600, second occurrence line 602
drivers/gpu/drm/nouveau/nouveau_drm.c:558:7-8: date: first occurrence line 600, second occurrence line 602
fs/nfsd/nfs4state.c:1509:3-30: code aligned with following code on line 1514

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
