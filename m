From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 28 May 2013 17:48:56 +0000
Subject: build regressions 2013-05-28
Message-Id: <51a4ee08.1MKymB/LuABBW8Uz%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/time/clocksource.c:831:3: error: implicit declaration of function 'clocksource_select_fallback' [-Werror=implicit-function-declaration]
drivers/hid/hid-sony.c:375:2: error: implicit declaration of function 'buzz_set_leds' [-Werror=implicit-function-declaration]
arch/s390/mm/pgtable.c:789:22: error: 'PGSTE_GR_BIT' undeclared (first use in this function)
arch/s390/mm/pgtable.c:789:37: error: 'PGSTE_GC_BIT' undeclared (first use in this function)
arch/s390/mm/pgtable.c:790:8: error: 'PGSTE_ACC_BITS' undeclared (first use in this function)
arch/s390/mm/pgtable.c:790:25: error: 'PGSTE_FP_BIT' undeclared (first use in this function)
arch/s390/mm/pgtable.c:813:21: error: 'PGSTE_UC_BIT' undeclared (first use in this function)
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:633:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
drivers/scsi/virtio_scsi.c:634:2: error: invalid type argument of unary '*' (have 'u32')
ERROR: "virtio_pci_freeze" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_set_vq_affinity" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_synchronize_vectors" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_find_vqs" [drivers/virtio/virtio_pci.ko] undefined!
ERROR: "virtio_pci_del_vqs" [drivers/virtio/virtio_pci.ko] undefined!

[warnings]
include/linux/skbuff.h:1583: warning: comparison is always true due to limited range of data type
include/linux/skbuff.h:1626: warning: comparison is always true due to limited range of data type
include/linux/skbuff.h:1583: warning: comparison is always true due to limited range of data type
include/linux/skbuff.h:1626: warning: comparison is always true due to limited range of data type
include/linux/skbuff.h:1583: warning: comparison is always true due to limited range of data type
include/linux/skbuff.h:1626: warning: comparison is always true due to limited range of data type
net/ipv4/tcp.c:2991:2: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
net/ipv4/icmp.c:506:46: warning: comparison between pointer and integer [enabled by default]
net/ipv6/output_core.c:43:28: warning: initialization makes integer from pointer without a cast [enabled by default]
Warning(kernel/wait.c:374): No description found for parameter 'p'
Warning(kernel/wait.c:374): Excess function parameter 'word' description in 'wake_up_atomic_t'
Warning(kernel/wait.c:374): Excess function parameter 'bit' description in 'wake_up_atomic_t'
kernel/sched/fair.c:2159:13: warning: unused variable 'rq' [-Wunused-variable]
sound/soc/codecs/wm8994.c:3134:20: warning: unused variable 'mask' [-Wunused-variable]
sound/soc/codecs/wm8994.c:3134:15: warning: unused variable 'val' [-Wunused-variable]
sound/soc/codecs/wm8994.c:3132:17: warning: unused variable 'control' [-Wunused-variable]
net/core/dev.c:1704:29: warning: comparison between pointer and integer [enabled by default]
net/core/dev.c:3872:22: warning: comparison between pointer and integer [enabled by default]
include/net/inet_ecn.h:137:50: warning: comparison between pointer and integer [enabled by default]
include/net/inet_ecn.h:142:52: warning: comparison between pointer and integer [enabled by default]
net/ipv6/exthdrs_core.c:118:19: warning: initialization makes integer from pointer without a cast [enabled by default]
net/ipv6/route.c:1652:9: warning: assignment makes integer from pointer without a cast [enabled by default]
net/ipv6/ndisc.c:696:17: warning: initialization makes integer from pointer without a cast [enabled by default]
net/ipv6/ndisc.c:856:17: warning: initialization makes integer from pointer without a cast [enabled by default]
net/ipv6/ndisc.c:1072:9: warning: assignment makes integer from pointer without a cast [enabled by default]
net/ipv6/ndisc.c:1349:17: warning: initialization makes integer from pointer without a cast [enabled by default]
net/ipv6/raw.c:1135:11: warning: assignment makes integer from pointer without a cast [enabled by default]
net/ipv6/icmp.c:402:43: warning: comparison between pointer and integer [enabled by default]
net/ipv6/mcast.c:1412:14: warning: assignment makes integer from pointer without a cast [enabled by default]
net/ipv6/mcast.c:1413:9: warning: assignment makes integer from pointer without a cast [enabled by default]
net/netfilter/nf_nat_helper.c:108:9: warning: passing argument 3 of 'memmove' makes integer from pointer without a cast [enabled by default]
net/sctp/input.c:602:9: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sctp/input.c:603:11: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sctp/input.c:608:22: warning: assignment makes integer from pointer without a cast [enabled by default]
net/sctp/input.c:609:24: warning: assignment makes integer from pointer without a cast [enabled by default]
net/sctp/ipv6.c:163:10: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sctp/ipv6.c:164:11: warning: assignment makes pointer from integer without a cast [enabled by default]
net/sctp/ipv6.c:169:24: warning: assignment makes integer from pointer without a cast [enabled by default]
net/sctp/ipv6.c:170:24: warning: assignment makes integer from pointer without a cast [enabled by default]
net/core/pktgen.c:2711:22: warning: assignment makes integer from pointer without a cast [enabled by default]
net/core/pktgen.c:2825:22: warning: assignment makes integer from pointer without a cast [enabled by default]
net/core/netpoll.c:704:31: warning: assignment makes integer from pointer without a cast [enabled by default]
net/ipv4/ipmr.c:983:22: warning: assignment makes integer from pointer without a cast [enabled by default]
warning: (VIDEO_VIVI && USB_SISUSBVGA && SOLO6X10) selects FONT_SUPPORT which has unmet direct dependencies (HAS_IOMEM && VT)
warning: (VIDEO_VIVI && FB_VGA16 && FB_S3 && FB_VT8623 && FB_ARK && USB_SISUSBVGA_CON && SOLO6X10) selects FONT_8x16 which has unmet direct dependencies (HAS_IOMEM && VT && FONT_SUPPORT)
warning: (VIDEO_VIVI && USB_SISUSBVGA && SOLO6X10) selects FONT_SUPPORT which has unmet direct dependencies (HAS_IOMEM && VT)
warning: (VIDEO_VIVI && FB_VGA16 && FB_S3 && FB_VT8623 && FB_ARK && USB_SISUSBVGA_CON && SOLO6X10) selects FONT_8x16 which has unmet direct dependencies (HAS_IOMEM && VT && FONT_SUPPORT)
warning: (VIDEO_VIVI && USB_SISUSBVGA && SOLO6X10) selects FONT_SUPPORT which has unmet direct dependencies (HAS_IOMEM && VT)
warning: (VIDEO_VIVI && FB_VGA16 && FB_S3 && FB_VT8623 && FB_ARK && USB_SISUSBVGA_CON && SOLO6X10) selects FONT_8x16 which has unmet direct dependencies (HAS_IOMEM && VT && FONT_SUPPORT)
drivers/isdn/i4l/isdn_net.c:888:2: warning: comparison between pointer and integer [enabled by default]
drivers/isdn/i4l/isdn_net.c:888:2: warning: comparison between pointer and integer [enabled by default]
drivers/isdn/i4l/isdn_net.c:888:2: warning: comparison between pointer and integer [enabled by default]
net/ipv6/mip6.c:271:28: warning: initialization makes integer from pointer without a cast [enabled by default]
net/ipv6/mip6.c:407:28: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1589:6: warning: passing argument 3 of 'pci_unmap_single' makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1651:9: warning: passing argument 4 of 'write_sgl' makes integer from pointer without a cast [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1677:2: warning: comparison between pointer and integer [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1677:2: warning: comparison between pointer and integer [enabled by default]
drivers/net/ethernet/chelsio/cxgb3/sge.c:1677:2: warning: comparison between pointer and integer [enabled by default]
drivers/net/ethernet/chelsio/cxgb4/sge.c:1297:2: warning: comparison between pointer and integer [enabled by default]
drivers/net/ethernet/chelsio/cxgb4/sge.c:1297:2: warning: comparison between pointer and integer [enabled by default]
drivers/net/ethernet/chelsio/cxgb4/sge.c:1297:2: warning: comparison between pointer and integer [enabled by default]
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:361:2: warning: comparison between pointer and integer [enabled by default]
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:361:2: warning: comparison between pointer and integer [enabled by default]
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:361:2: warning: comparison between pointer and integer [enabled by default]
drivers/gpu/drm/i915/intel_display.c:5834:6: warning: unused variable 'pipe' [-Wunused-variable]
net/ipv4/igmp.c:366:22: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/s390/kvm/virtio_ccw.c:598:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/s390/kvm/virtio_ccw.c:598:2: warning: (near initialization for 'virtio_ccw_config_ops.get_features') [enabled by default]
drivers/scsi/virtio_scsi.c:633:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/virtio_scsi.c:634:2: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/core/skbuff.c:203:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
net/core/skbuff.c:279:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
net/core/skbuff.c:280:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
net/core/skbuff.c:348:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
net/core/skbuff.c:349:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/virtio/virtio_pci.c:772:4: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' [-Wformat]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
