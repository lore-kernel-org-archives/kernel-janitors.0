From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Jul 2013 19:38:02 +0000
Subject: build regressions 2013-07-04
Message-Id: <51d5cf1a.zCYHB2/fH8BDNJxi%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "_restvr_20" [lib/raid6/raid6_pq.ko] undefined!
ERROR: "_savevr_20" [lib/raid6/raid6_pq.ko] undefined!
arch/powerpc/mm/mmap_64.c:95:5: error: 'struct mm_struct' has no member named 'unmap_area'
arch/powerpc/mm/mmap_64.c:95:20: error: 'arch_unmap_area' undeclared (first use in this function)
arch/powerpc/mm/mmap_64.c:99:5: error: 'struct mm_struct' has no member named 'unmap_area'
arch/powerpc/mm/mmap_64.c:99:20: error: 'arch_unmap_area_topdown' undeclared (first use in this function)

[warnings]
WARNING: kernel/built-in.o(.data+0x14e614): Section mismatch in reference from the variable _function_trace to the function .init.text:_trace_selftest_startup_function()
WARNING: kernel/built-in.o(.data+0x14f3b4): Section mismatch in reference from the variable _graph_trace to the function .init.text:_trace_selftest_startup_function_graph()
drivers/irqchip/percpu-mux.c:71:24: warning: 'percpu_mux' defined but not used [-Wunused-variable]
sound/soc/codecs/arizona.c:233:2: warning: enumeration value 'WM5102' not handled in switch [-Wswitch]
drivers/gpu/drm/radeon/cik.c:306:5: warning: 'rlc_req_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/radeon/si.c:1677:5: warning: 'smc_req_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (PCH_GBE) selects PTP_1588_CLOCK_PCH which has unmet direct dependencies (X86 || COMPILE_TEST)
warning: (PCH_GBE) selects PTP_1588_CLOCK_PCH which has unmet direct dependencies (X86 || COMPILE_TEST)
warning: (PCH_GBE) selects PTP_1588_CLOCK_PCH which has unmet direct dependencies (X86 || COMPILE_TEST)
warning: (PCH_GBE) selects PTP_1588_CLOCK_PCH which has unmet direct dependencies (X86 || COMPILE_TEST)
warning: (PCH_GBE) selects PTP_1588_CLOCK_PCH which has unmet direct dependencies (X86 || COMPILE_TEST)
drivers/media/tuners/mxl5005s.c:1660:1: warning: the frame size of 6176 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/net/ethernet/neterion/vxge/vxge-ethtool.c:576:1: warning: the frame size of 3488 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/staging/rtl8192e/rtl8192e/rtl_dm.c:1345:1: warning: the frame size of 3136 bytes is larger than 2048 bytes [-Wframe-larger-than=]
drivers/net/wireless/cw1200/debug.c:255:6: warning: format '%td' expects argument of type 'ptrdiff_t', but argument 4 has type 'size_t' [-Wformat=]
drivers/net/wireless/ath/ath10k/mac.c:1264:8: warning: format '%zd' expects argument of type 'signed size_t', but argument 4 has type 'long int' [-Wformat=]
WARNING: kernel/trace/built-in.o(.data+0x6ac8): Section mismatch in reference from the variable function_trace to the function .init.text:trace_selftest_startup_function()
WARNING: kernel/trace/built-in.o(.data+0x85d8): Section mismatch in reference from the variable graph_trace to the function .init.text:trace_selftest_startup_function_graph()
WARNING: vmlinux.o(.text.unlikely+0x26): Section mismatch in reference from the function .prom_rtas_call.constprop.1() to the variable .init.data:prom_rtas_data
WARNING: vmlinux.o(.text.unlikely+0x4a): Section mismatch in reference from the function .prom_rtas_call.constprop.1() to the variable .init.data:prom_rtas_entry
drivers/gpu/drm/radeon/cik.c:313:10: warning: 'chip_name' may be used uninitialized in this function [-Wmaybe-uninitialized]
include/linux/compiler.h:134:26: warning: 'smc_req_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/radeon/si_smc.c:207:6: warning: 'ucode_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/gpu/drm/radeon/cypress_dpm.c:305:31: warning: unused variable 'eg_pi' [-Wunused-variable]
drivers/gpu/drm/radeon/ni_dpm.c:3420:31: warning: unused variable 'eg_pi' [-Wunused-variable]

[sparse]
drivers/phy/phy-exynos-mipi-video.c:121:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *ptr @@    got void [nodervoid const *ptr @@
drivers/phy/phy-exynos-mipi-video.c:122:37: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const *ptr @@    got void [nodervoid const *ptr @@
drivers/irqchip/percpu-mux.c:109:17: sparse: symbol 'alloc_percpu_irq_mux' was not declared. Should it be static?
net/9p/trans_fd.c:918:28: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [addressable] [assigned] [usertype] s_addr @@    got e] [assigned] [usertype] s_addr @@
drivers/block/rbd.c:2188:32: sparse: Using plain integer as NULL pointer
drivers/block/rbd.c:2190:31: sparse: Using plain integer as NULL pointer
drivers/md/dm.c:521:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/md/dm.c:542:16: sparse: incompatible types in comparison expression (different address spaces)
drivers/thermal/x86_pkg_temp_thermal.c:74:8: sparse: symbol 'pkg_temp_thermal_threshold_work' was not declared. Should it be static?
drivers/thermal/x86_pkg_temp_thermal.c:216:5: sparse: symbol 'sys_set_trip_temp' was not declared. Should it be static?
drivers/tty/serial/8250/8250_dw.c:187:46: sparse: restricted upf_t degrades to integer
drivers/tty/serial/8250/8250_dw.c:187:62: sparse: restricted upf_t degrades to integer
drivers/tty/serial/8250/8250_dw.c:187:26: sparse: incorrect type in assignment (different base types) @@    expected restricted upf_t [usertype] flags @@    got  [usertype] flags @@
kernel/posix-cpu-timers.c:984:27: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1002:44: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1003:30: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1106:38: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1107:40: sparse: implicit cast from nocast type
kernel/posix-cpu-timers.c:1348:29: sparse: implicit cast from nocast type
ipc/sem.c:1332:9: sparse: context imbalance in 'semctl_down' - different lock contexts for basic block
include/linux/rcupdate.h:799:9: sparse: context imbalance in 'shmctl_down' - different lock contexts for basic block
ipc/msg.c:466:9: sparse: context imbalance in 'msgctl_down' - different lock contexts for basic block
lib/lz4/lz4hc_compress.c:52:15: sparse: memset with byte count of 131072
lib/lz4/lz4hc_compress.c:53:15: sparse: memset with byte count of 131072
sound/soc/soc-fw.c:1258:44: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:374:20: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] numid @@    got restrunsigned int [unsigned] numid @@
sound/soc/soc-fw.c:375:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] length @@    got restrunsigned int [unsigned] length @@
sound/soc/soc-fw.c:376:44: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] len @@    got d long [unsigned] [usertype] len @@
sound/soc/soc-fw.c:424:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [addressable] [assigned] access @@    got ed] [addressable] [assigned] access @@
sound/soc/soc-fw.c:426:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] reg @@    got restrunsigned int [unsigned] reg @@
sound/soc/soc-fw.c:427:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] rreg @@    got restrunsigned int [unsigned] rreg @@
sound/soc/soc-fw.c:428:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] shift @@    got restrunsigned int [unsigned] shift @@
sound/soc/soc-fw.c:429:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] rshift @@    got restrunsigned int [unsigned] rshift @@
sound/soc/soc-fw.c:432:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] invert @@    got restrunsigned int [unsigned] invert @@
sound/soc/soc-fw.c:438:54: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:442:62: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:448:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:449:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:450:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:465:52: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] tlv_size @@    got ed int [unsigned] [usertype] tlv_size @@
sound/soc/soc-fw.c:497:49: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:501:27: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:528:15: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:531:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:535:43: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:574:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [addressable] [assigned] access @@    got ed] [addressable] [assigned] access @@
sound/soc/soc-fw.c:576:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] reg @@    got resunsigned short [unsigned] reg @@
sound/soc/soc-fw.c:577:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] reg2 @@    got resunsigned short [unsigned] reg2 @@
sound/soc/soc-fw.c:578:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] shift_l @@    got restunsigned char [unsigned] shift_l @@
sound/soc/soc-fw.c:579:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] shift_r @@    got restunsigned char [unsigned] shift_r @@
sound/soc/soc-fw.c:580:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] max @@    got restrunsigned int [unsigned] max @@
sound/soc/soc-fw.c:581:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] mask @@    got restrunsigned int [unsigned] mask @@
sound/soc/soc-fw.c:585:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:620:54: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:624:62: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:629:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:630:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:631:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:668:69: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:677:29: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:678:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:689:57: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got d long [unsigned] [usertype] size @@
sound/soc/soc-fw.c:698:56: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got d long [unsigned] [usertype] size @@
sound/soc/soc-fw.c:702:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:703:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:704:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:720:30: sparse: incorrect type in initializer (different base types) @@    expected int [signed] count @@    got restricted __le3int [signed] count @@
sound/soc/soc-fw.c:723:71: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:730:70: sparse: incorrect type in argument 4 (different base types) @@    expected unsigned long [unsigned] [usertype] bytes @@    got d long [unsigned] [usertype] bytes @@
sound/soc/soc-fw.c:798:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] access @@    got restrunsigned int [unsigned] access @@
sound/soc/soc-fw.c:800:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] reg @@    got restrunsigned int [unsigned] reg @@
sound/soc/soc-fw.c:801:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] rreg @@    got restrunsigned int [unsigned] rreg @@
sound/soc/soc-fw.c:802:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] shift @@    got restrunsigned int [unsigned] shift @@
sound/soc/soc-fw.c:803:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] rshift @@    got restrunsigned int [unsigned] rshift @@
sound/soc/soc-fw.c:806:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] invert @@    got restrunsigned int [unsigned] invert @@
sound/soc/soc-fw.c:812:54: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:816:62: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:822:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:823:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:824:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:877:20: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] access @@    got restrunsigned int [unsigned] access @@
sound/soc/soc-fw.c:879:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] reg @@    got resunsigned short [unsigned] reg @@
sound/soc/soc-fw.c:880:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] reg2 @@    got resunsigned short [unsigned] reg2 @@
sound/soc/soc-fw.c:881:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] shift_l @@    got restunsigned char [unsigned] shift_l @@
sound/soc/soc-fw.c:882:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] shift_r @@    got restunsigned char [unsigned] shift_r @@
sound/soc/soc-fw.c:883:17: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] max @@    got restrunsigned int [unsigned] max @@
sound/soc/soc-fw.c:884:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] mask @@    got restrunsigned int [unsigned] mask @@
sound/soc/soc-fw.c:887:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:916:46: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:920:54: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] io_type @@    got ed int [unsigned] [usertype] io_type @@
sound/soc/soc-fw.c:926:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:927:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:928:33: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:947:27: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:974:19: sparse: incorrect type in assignment (different base types) @@    expected int enum snd_soc_dapm_type [signed] [addressable] id @@    got _type [signed] [addressable] id @@
sound/soc/soc-fw.c:984:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [addressable] [assigned] shift @@    got ed] [addressable] [assigned] shift @@
sound/soc/soc-fw.c:985:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [addressable] [assigned] mask @@    got ed] [addressable] [assigned] mask @@
sound/soc/soc-fw.c:1000:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1010:38: sparse: incorrect type in assignment (different base types) @@    expected int [signed] [addressable] [assigned] num_kcontrols @@    got ed] [addressable] [assigned] num_kcontrols @@
sound/soc/soc-fw.c:1041:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1042:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1043:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1068:35: sparse: incorrect type in initializer (different base types) @@    expected int [signed] count @@    got restricted __le3int [signed] count @@
sound/soc/soc-fw.c:1076:70: sparse: incorrect type in argument 4 (different base types) @@    expected unsigned long [unsigned] [usertype] bytes @@    got d long [unsigned] [usertype] bytes @@
sound/soc/soc-fw.c:1129:17: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1133:54: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got d long [unsigned] [usertype] size @@
sound/soc/soc-fw.c:1142:25: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1154:41: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1173:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1173:27: sparse: restricted __be32 degrades to integer
sound/soc/soc-fw.c:1181:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1189:16: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1203:29: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
sound/soc/soc-fw.c:1216:20: sparse: restricted __le32 degrades to integer
lib/clz_ctz.c:16:12: sparse: symbol '__ctzsi2' was not declared. Should it be static?
lib/clz_ctz.c:22:12: sparse: symbol '__clzsi2' was not declared. Should it be static?
lib/clz_ctz.c:44:12: sparse: symbol '__clzdi2' was not declared. Should it be static?
lib/clz_ctz.c:50:12: sparse: symbol '__ctzdi2' was not declared. Should it be static?
kernel/reboot.c:192:1: sparse: symbol 'SyS_reboot' was not declared. Should it be static?
drivers/base/dd.c:139:6: sparse: symbol 'driver_deferred_probe_trigger' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb.c:972:39: sparse: undefined identifier 'dma_alloc_writecombine'
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:36:5: sparse: symbol 'xylonfb_hw_pixclk_set_zynq_ps' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:130:5: sparse: symbol 'xylonfb_hw_pixclk_set_logiclk' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:197:5: sparse: symbol 'xylonfb_hw_pixclk_set_si570' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:212:6: sparse: symbol 'xylonfb_hw_pixclk_supported' was not declared. Should it be static?
drivers/video/xylon/xylonfb/platform/../core/xylonfb-pixclk.c:243:5: sparse: symbol 'xylonfb_hw_pixclk_set' was not declared. Should it be static?
drivers/media/i2c/adv7604.c:143:9: sparse: unknown field name in initializer
drivers/staging/video/axivdma/xvdma.c:43:17: sparse: symbol 'chan_buf' was not declared. Should it be static?
drivers/staging/video/axivdma/xvdma.c:44:5: sparse: symbol 'num_devices' was not declared. Should it be static?
drivers/staging/video/axivdma/xvdma.c:45:19: sparse: symbol 'cmp' was not declared. Should it be static?
drivers/dma/xilinx/xilinx_axidma.c:952:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/dma/xilinx/xilinx_axivdma.c:1044:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/dma/xilinx/xilinx_axicdma.c:850:9: sparse: undefined identifier 'irq_dispose_mapping'
drivers/net/ethernet/cadence/macb.c:1566:15: sparse: undefined identifier 'of_get_mac_address'
drivers/net/ethernet/cadence/macb.c:1572:15: sparse: undefined identifier 'of_get_phy_mode'
kernel/resource.c:365:12: sparse: symbol 'page_is_ram' was not declared. Should it be static?
fs/drop_caches.c:14:5: sparse: symbol 'sysctl_drop_caches' was not declared. Should it be static?

[coccinelle]
drivers/acpi/ipmi_test.c:82:9-13: ERROR: did is NULL but dereferenced.
drivers/acpi/ipmi_test.c:82:20-27: ERROR: did is NULL but dereferenced.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
