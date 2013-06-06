From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Jun 2013 16:33:28 +0000
Subject: build regressions 2013-06-06
Message-Id: <51b0b9d8.vLbKx0BlDsjXpbO9%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/page_alloc.c:4801:2: error: implicit declaration of function 'get_pfn_range_for_nid' [-Werror=implicit-function-declaration]
drivers/rtc/class.c:339:18: error: lvalue required as unary '&' operand
cx88-dvb.c:(.text.unlikely+0x6817): undefined reference to `cx22702_attach'
cx88-dvb.c:(.text.unlikely+0x6837): undefined reference to `cx22702_attach'
cx88-dvb.c:(.text.unlikely+0x6859): undefined reference to `cx22702_attach'
cx88-dvb.c:(.text.unlikely+0x6882): undefined reference to `cx22702_attach'
cx88-dvb.c:(.text.unlikely+0x6f8f): undefined reference to `cx22702_attach'
cx88-dvb.c:(.text.unlikely+0x710a): undefined reference to `stv0900_attach'
arch/microblaze/mm/init.c:249:22: error: 'str' undeclared (first use in this function)
drivers/rtc/class.c:339:18: error: lvalue required as unary '&' operand
/c/kernel-tests/src/stable/include/linux/list_bl.h:65:2: error: implicit declaration of function '_xtest' [-Werror=implicit-function-declaration]
lmedm04.c:(.text+0x3746ac): undefined reference to `ts2020_attach'
rtl28xxu.c:(.text+0x377649): undefined reference to `fc0012_attach'
rtl28xxu.c:(.text+0x377782): undefined reference to `tua9001_attach'

[warnings]
drivers/ptp/ptp_pch.c:710:1: warning: data definition has no type or storage class [enabled by default]
drivers/ptp/ptp_pch.c:710:1: warning: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
drivers/ptp/ptp_pch.c:710:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/gpu/drm/i915/intel_dsi.c:159:6: warning: unused variable 'tmp' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dsi.c:158:6: warning: unused variable 'pipe' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dsi.c:156:27: warning: unused variable 'dev_priv' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dsi.c:486:27: warning: unused variable 'dev_priv' [-Wunused-variable]
drivers/gpu/drm/i915/intel_dsi_pll.c:271:20: warning: unused variable 'intel_dsi' [-Wunused-variable]
WARNING: mm/built-in.o(.data+0x140d0): Section mismatch in reference from the variable compute_batch_nb to the function .meminit.text:mm_compute_batch_notifier()

[sparse]
drivers/media/pci/cx25821/cx25821-video-upstream.c:334:25: sparse: incorrect type in argument 2 (different address spaces)
fs/gfs2/./trace_gfs2.h:160:1: sparse: expression using sizeof bool
drivers/scsi/scsi_transport_iscsi.c:677:20: sparse: symbol 'iscsi_flashnode_sess_dev_type' was not declared. Should it be static?
drivers/scsi/scsi_transport_iscsi.c:863:20: sparse: symbol 'iscsi_flashnode_conn_dev_type' was not declared. Should it be static?
drivers/scsi/scsi_transport_iscsi.c:869:17: sparse: symbol 'iscsi_flashnode_bus' was not declared. Should it be static?
drivers/scsi/qla2xxx/qla_iocb.c:1866:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_iocb.c:1867:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:55:21: sparse: restricted pci_channel_state_t degrades to integer
drivers/scsi/qla2xxx/qla_mr.c:55:37: sparse: restricted pci_channel_state_t degrades to integer
drivers/scsi/qla2xxx/qla_mr.c:643:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:644:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:645:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:646:32: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:647:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:648:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:649:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:650:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:883:22: sparse: cast removes address space of expression
drivers/scsi/qla2xxx/qla_mr.c:898:22: sparse: cast removes address space of expression
drivers/scsi/qla2xxx/qla_mr.c:1424:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2200:34: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2222:49: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2223:47: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2224:45: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2227:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2298:23: sparse: cast to restricted __le16
drivers/scsi/qla2xxx/qla_mr.c:2299:23: sparse: cast to restricted __le16
drivers/scsi/qla2xxx/qla_mr.c:2353:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2355:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2357:32: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2652:26: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2720:16: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2723:45: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2774:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3152:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3153:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3173:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2995:48: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3000:38: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3006:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3010:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3038:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3039:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3040:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3230:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3232:25: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3233:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3234:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3241:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3257:25: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3258:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3260:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3261:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3263:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3279:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3283:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3285:32: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3286:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3287:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3288:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3289:40: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3293:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3294:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3296:52: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3298:52: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3300:45: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3305:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3306:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3308:53: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3310:53: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3312:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3317:42: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3334:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3335:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3344:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3346:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3374:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3375:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3376:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3407:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3409:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3437:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3438:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3439:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3464:42: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3473:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:55:21: sparse: restricted pci_channel_state_t degrades to integer
drivers/scsi/qla2xxx/qla_mr.c:55:37: sparse: restricted pci_channel_state_t degrades to integer
drivers/scsi/qla2xxx/qla_mr.c:643:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:644:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:645:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:646:32: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:647:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:648:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:649:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:650:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:883:22: sparse: cast removes address space of expression
drivers/scsi/qla2xxx/qla_mr.c:898:22: sparse: cast removes address space of expression
drivers/scsi/qla2xxx/qla_mr.c:1424:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2200:34: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2222:49: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2223:47: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2224:45: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2227:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2298:23: sparse: cast to restricted __le16
drivers/scsi/qla2xxx/qla_mr.c:2299:23: sparse: cast to restricted __le16
drivers/scsi/qla2xxx/qla_mr.c:2353:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2355:29: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2357:32: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2652:26: sparse: cast to restricted __le32
drivers/scsi/qla2xxx/qla_mr.c:2720:16: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2723:45: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:2774:17: sparse: incorrect type in argument 2 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3152:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3153:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3173:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2995:48: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3000:38: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3006:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3010:39: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3038:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3039:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3040:28: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3230:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3232:25: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3233:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3234:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_inline.h:90:26: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3241:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3257:25: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3258:31: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3260:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3261:29: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3263:17: sparse: incorrect type in argument 1 (different address spaces)
drivers/scsi/qla2xxx/qla_mr.c:3279:24: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3283:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3285:32: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3286:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3287:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3288:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3289:40: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3293:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3294:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3296:52: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3298:52: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3300:45: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3305:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3306:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3308:53: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3310:53: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3312:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3317:42: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3334:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3335:36: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3344:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3346:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3374:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3375:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3376:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3407:44: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3409:34: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:2967:49: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3437:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3438:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3439:46: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3464:42: sparse: incorrect type in assignment (different base types)
drivers/scsi/qla2xxx/qla_mr.c:3473:17: sparse: incorrect type in argument 1 (different address spaces)
kernel/workqueue.c:4435:61: sparse: expression using sizeof bool
include/linux/sched.h:2220:37: sparse: context imbalance in 'zap_threads' - different lock contexts for basic block
arch/x86/kernel/ioport.c:96:1: sparse: symbol 'SyS_iopl' was not declared. Should it be static?
arch/x86/kernel/sys_x86_64.c:70:1: sparse: symbol 'SyS_mmap' was not declared. Should it be static?
fs/signalfd.c:255:1: sparse: symbol 'SyS_signalfd4' was not declared. Should it be static?
fs/signalfd.c:309:1: sparse: symbol 'SyS_signalfd' was not declared. Should it be static?
fs/timerfd.c:251:1: sparse: symbol 'SyS_timerfd_create' was not declared. Should it be static?
fs/timerfd.c:359:1: sparse: symbol 'SyS_timerfd_settime' was not declared. Should it be static?
fs/timerfd.c:377:1: sparse: symbol 'SyS_timerfd_gettime' was not declared. Should it be static?
fs/timerfd.c:387:1: sparse: symbol 'compat_SyS_timerfd_settime' was not declared. Should it be static?
fs/timerfd.c:404:1: sparse: symbol 'compat_SyS_timerfd_gettime' was not declared. Should it be static?
fs/eventfd.c:426:1: sparse: symbol 'SyS_eventfd2' was not declared. Should it be static?
fs/eventfd.c:451:1: sparse: symbol 'SyS_eventfd' was not declared. Should it be static?
fs/aio.c:1233:1: sparse: symbol 'SyS_io_setup' was not declared. Should it be static?
fs/aio.c:1269:1: sparse: symbol 'SyS_io_destroy' was not declared. Should it be static?
fs/aio.c:1681:1: sparse: symbol 'SyS_io_submit' was not declared. Should it be static?
fs/aio.c:1716:1: sparse: symbol 'SyS_io_cancel' was not declared. Should it be static?
fs/aio.c:1779:1: sparse: symbol 'SyS_io_getevents' was not declared. Should it be static?
fs/locks.c:1626:1: sparse: symbol 'SyS_flock' was not declared. Should it be static?
fs/compat.c:1281:1: sparse: symbol 'compat_SyS_open' was not declared. Should it be static?
fs/compat.c:1290:1: sparse: symbol 'compat_SyS_openat' was not declared. Should it be static?
fs/compat.c:1745:1: sparse: symbol 'compat_SyS_open_by_handle_at' was not declared. Should it be static?
fs/fhandle.c:92:1: sparse: symbol 'SyS_name_to_handle_at' was not declared. Should it be static?
fs/fhandle.c:254:1: sparse: symbol 'SyS_open_by_handle_at' was not declared. Should it be static?
fs/dcookies.c:148:1: sparse: symbol 'SyS_lookup_dcookie' was not declared. Should it be static?
fs/open.c:139:1: sparse: symbol 'SyS_truncate' was not declared. Should it be static?
fs/open.c:145:1: sparse: symbol 'compat_SyS_truncate' was not declared. Should it be static?
fs/open.c:198:1: sparse: symbol 'SyS_ftruncate' was not declared. Should it be static?
fs/open.c:207:1: sparse: symbol 'compat_SyS_ftruncate' was not declared. Should it be static?
fs/open.c:288:1: sparse: symbol 'SyS_fallocate' was not declared. Should it be static?
fs/open.c:305:1: sparse: symbol 'SyS_faccessat' was not declared. Should it be static?
fs/open.c:381:1: sparse: symbol 'SyS_access' was not declared. Should it be static?
fs/open.c:386:1: sparse: symbol 'SyS_chdir' was not declared. Should it be static?
fs/open.c:412:1: sparse: symbol 'SyS_fchdir' was not declared. Should it be static?
fs/open.c:437:1: sparse: symbol 'SyS_chroot' was not declared. Should it be static?
fs/open.c:492:1: sparse: symbol 'SyS_fchmod' was not declared. Should it be static?
fs/open.c:506:1: sparse: symbol 'SyS_fchmodat' was not declared. Should it be static?
fs/open.c:524:1: sparse: symbol 'SyS_chmod' was not declared. Should it be static?
fs/open.c:565:1: sparse: symbol 'SyS_fchownat' was not declared. Should it be static?
fs/open.c:597:1: sparse: symbol 'SyS_chown' was not declared. Should it be static?
fs/open.c:602:1: sparse: symbol 'SyS_lchown' was not declared. Should it be static?
fs/open.c:608:1: sparse: symbol 'SyS_fchown' was not declared. Should it be static?
fs/open.c:962:1: sparse: symbol 'SyS_open' was not declared. Should it be static?
fs/open.c:975:1: sparse: symbol 'SyS_openat' was not declared. Should it be static?
fs/open.c:995:1: sparse: symbol 'SyS_creat' was not declared. Should it be static?
fs/open.c:1033:1: sparse: symbol 'SyS_close' was not declared. Should it be static?
fs/read_write.c:233:1: sparse: symbol 'SyS_lseek' was not declared. Should it be static?
fs/read_write.c:252:1: sparse: symbol 'compat_SyS_lseek' was not declared. Should it be static?
fs/read_write.c:259:1: sparse: symbol 'SyS_llseek' was not declared. Should it be static?
fs/read_write.c:460:1: sparse: symbol 'SyS_read' was not declared. Should it be static?
fs/read_write.c:474:1: sparse: symbol 'SyS_write' was not declared. Should it be static?
fs/read_write.c:490:1: sparse: symbol 'SyS_pread64' was not declared. Should it be static?
fs/read_write.c:510:1: sparse: symbol 'SyS_pwrite64' was not declared. Should it be static?
fs/read_write.c:764:1: sparse: symbol 'SyS_readv' was not declared. Should it be static?
fs/read_write.c:783:1: sparse: symbol 'SyS_writev' was not declared. Should it be static?
fs/read_write.c:808:1: sparse: symbol 'SyS_preadv' was not declared. Should it be static?
fs/read_write.c:832:1: sparse: symbol 'SyS_pwritev' was not declared. Should it be static?
fs/read_write.c:946:1: sparse: symbol 'SyS_sendfile' was not declared. Should it be static?
fs/read_write.c:965:1: sparse: symbol 'SyS_sendfile64' was not declared. Should it be static?
fs/stat.c:158:1: sparse: symbol 'SyS_stat' was not declared. Should it be static?
fs/stat.c:171:1: sparse: symbol 'SyS_lstat' was not declared. Should it be static?
fs/stat.c:184:1: sparse: symbol 'SyS_fstat' was not declared. Should it be static?
fs/stat.c:247:1: sparse: symbol 'SyS_newstat' was not declared. Should it be static?
fs/stat.c:258:1: sparse: symbol 'SyS_newlstat' was not declared. Should it be static?
fs/stat.c:272:1: sparse: symbol 'SyS_newfstatat' was not declared. Should it be static?
fs/stat.c:285:1: sparse: symbol 'SyS_newfstat' was not declared. Should it be static?
fs/stat.c:296:1: sparse: symbol 'SyS_readlinkat' was not declared. Should it be static?
fs/stat.c:330:1: sparse: symbol 'SyS_readlink' was not declared. Should it be static?
fs/exec.c:105:1: sparse: symbol 'SyS_uselib' was not declared. Should it be static?
fs/exec.c:1673:1: sparse: symbol 'SyS_execve' was not declared. Should it be static?
fs/pipe.c:1117:1: sparse: symbol 'SyS_pipe2' was not declared. Should it be static?
fs/pipe.c:1139:1: sparse: symbol 'SyS_pipe' was not declared. Should it be static?
fs/fcntl.c:349:1: sparse: symbol 'SyS_fcntl' was not declared. Should it be static?
fs/ioctl.c:604:1: sparse: symbol 'SyS_ioctl' was not declared. Should it be static?
fs/readdir.c:105:1: sparse: symbol 'SyS_old_readdir' was not declared. Should it be static?
fs/readdir.c:189:1: sparse: symbol 'SyS_getdents' was not declared. Should it be static?
fs/readdir.c:269:1: sparse: symbol 'SyS_getdents64' was not declared. Should it be static?
fs/select.c:592:1: sparse: symbol 'SyS_select' was not declared. Should it be static?
fs/select.c:670:1: sparse: symbol 'SyS_pselect6' was not declared. Should it be static?
fs/select.c:904:1: sparse: symbol 'SyS_poll' was not declared. Should it be static?
fs/select.c:938:1: sparse: symbol 'SyS_ppoll' was not declared. Should it be static?
fs/file.c:909:1: sparse: symbol 'SyS_dup3' was not declared. Should it be static?
fs/file.c:943:1: sparse: symbol 'SyS_dup2' was not declared. Should it be static?
fs/file.c:958:1: sparse: symbol 'SyS_dup' was not declared. Should it be static?
fs/file.c:909:1: sparse: context imbalance in 'SyS_dup3' - different lock contexts for basic block
fs/filesystems.c:183:1: sparse: symbol 'SyS_sysfs' was not declared. Should it be static?
fs/namespace.c:1256:1: sparse: symbol 'SyS_umount' was not declared. Should it be static?
fs/namespace.c:1296:1: sparse: symbol 'SyS_oldumount' was not declared. Should it be static?
fs/namespace.c:2451:1: sparse: symbol 'SyS_mount' was not declared. Should it be static?
fs/namespace.c:2542:1: sparse: symbol 'SyS_pivot_root' was not declared. Should it be static?
fs/xattr.c:367:1: sparse: symbol 'SyS_setxattr' was not declared. Should it be static?
fs/xattr.c:391:1: sparse: symbol 'SyS_lsetxattr' was not declared. Should it be static?
fs/xattr.c:415:1: sparse: symbol 'SyS_fsetxattr' was not declared. Should it be static?
fs/xattr.c:484:1: sparse: symbol 'SyS_getxattr' was not declared. Should it be static?
fs/xattr.c:503:1: sparse: symbol 'SyS_lgetxattr' was not declared. Should it be static?
fs/xattr.c:522:1: sparse: symbol 'SyS_fgetxattr' was not declared. Should it be static?
fs/xattr.c:574:1: sparse: symbol 'SyS_listxattr' was not declared. Should it be static?
fs/xattr.c:593:1: sparse: symbol 'SyS_llistxattr' was not declared. Should it be static?
fs/xattr.c:612:1: sparse: symbol 'SyS_flistxattr' was not declared. Should it be static?
fs/xattr.c:643:1: sparse: symbol 'SyS_removexattr' was not declared. Should it be static?
fs/xattr.c:666:1: sparse: symbol 'SyS_lremovexattr' was not declared. Should it be static?
fs/xattr.c:689:1: sparse: symbol 'SyS_fremovexattr' was not declared. Should it be static?
fs/splice.c:1666:1: sparse: symbol 'SyS_vmsplice' was not declared. Should it be static?
fs/splice.c:1691:1: sparse: symbol 'SyS_splice' was not declared. Should it be static?
fs/splice.c:2024:1: sparse: symbol 'SyS_tee' was not declared. Should it be static?
fs/sync.c:149:1: sparse: symbol 'SyS_syncfs' was not declared. Should it be static?
fs/sync.c:212:1: sparse: symbol 'SyS_fsync' was not declared. Should it be static?
fs/sync.c:217:1: sparse: symbol 'SyS_fdatasync' was not declared. Should it be static?
fs/sync.c:286:1: sparse: symbol 'SyS_sync_file_range' was not declared. Should it be static?
fs/sync.c:371:1: sparse: symbol 'SyS_sync_file_range2' was not declared. Should it be static?
fs/utimes.c:27:1: sparse: symbol 'SyS_utime' was not declared. Should it be static?
fs/utimes.c:178:1: sparse: symbol 'SyS_utimensat' was not declared. Should it be static?
fs/utimes.c:196:1: sparse: symbol 'SyS_futimesat' was not declared. Should it be static?
fs/utimes.c:224:1: sparse: symbol 'SyS_utimes' was not declared. Should it be static?
fs/statfs.c:172:1: sparse: symbol 'SyS_statfs' was not declared. Should it be static?
fs/statfs.c:181:1: sparse: symbol 'SyS_statfs64' was not declared. Should it be static?
fs/statfs.c:193:1: sparse: symbol 'SyS_fstatfs' was not declared. Should it be static?
fs/statfs.c:202:1: sparse: symbol 'SyS_fstatfs64' was not declared. Should it be static?
fs/statfs.c:228:1: sparse: symbol 'SyS_ustat' was not declared. Should it be static?
fs/buffer.c:3211:1: sparse: symbol 'SyS_bdflush' was not declared. Should it be static?
fs/ioprio.c:61:1: sparse: symbol 'SyS_ioprio_set' was not declared. Should it be static?
fs/ioprio.c:176:1: sparse: symbol 'SyS_ioprio_get' was not declared. Should it be static?
fs/notify/fanotify/fanotify_user.c:670:1: sparse: symbol 'SyS_fanotify_init' was not declared. Should it be static?
fs/notify/fanotify/fanotify_user.c:758:1: sparse: symbol 'SyS_fanotify_mark' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:714:1: sparse: symbol 'SyS_inotify_init1' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:744:1: sparse: symbol 'SyS_inotify_add_watch' was not declared. Should it be static?
fs/notify/inotify/inotify_user.c:785:1: sparse: symbol 'SyS_inotify_rm_watch' was not declared. Should it be static?
fs/quota/quota.c:366:1: sparse: symbol 'SyS_quotactl' was not declared. Should it be static?
ipc/msg.c:312:1: sparse: symbol 'SyS_msgget' was not declared. Should it be static?
ipc/msg.c:472:1: sparse: symbol 'SyS_msgctl' was not declared. Should it be static?
ipc/msg.c:729:1: sparse: symbol 'SyS_msgsnd' was not declared. Should it be static?
ipc/msg.c:988:1: sparse: symbol 'SyS_msgrcv' was not declared. Should it be static?
ipc/msg.c:577:9: sparse: context imbalance in 'SyS_msgctl' - unexpected unlock
ipc/sem.c:367:1: sparse: symbol 'SyS_semget' was not declared. Should it be static?
ipc/sem.c:1159:17: sparse: symbol 'SyS_semctl' was not declared. Should it be static?
ipc/sem.c:1330:1: sparse: symbol 'SyS_semtimedop' was not declared. Should it be static?
ipc/sem.c:1548:1: sparse: symbol 'SyS_semop' was not declared. Should it be static?
include/linux/rcupdate.h:326:30: sparse: context imbalance in 'SyS_semtimedop' - unexpected unlock
ipc/shm.c:575:1: sparse: symbol 'SyS_shmget' was not declared. Should it be static?
ipc/shm.c:777:1: sparse: symbol 'SyS_shmctl' was not declared. Should it be static?
ipc/shm.c:1112:1: sparse: symbol 'SyS_shmat' was not declared. Should it be static?
ipc/shm.c:1128:1: sparse: symbol 'SyS_shmdt' was not declared. Should it be static?
ipc/shm.c:947:9: sparse: context imbalance in 'SyS_shmctl' - unexpected unlock
ipc/mqueue.c:770:1: sparse: symbol 'SyS_mq_open' was not declared. Should it be static?
ipc/mqueue.c:849:1: sparse: symbol 'SyS_mq_unlink' was not declared. Should it be static?
ipc/mqueue.c:943:1: sparse: symbol 'SyS_mq_timedsend' was not declared. Should it be static?
ipc/mqueue.c:1063:1: sparse: symbol 'SyS_mq_timedreceive' was not declared. Should it be static?
ipc/mqueue.c:1171:1: sparse: symbol 'SyS_mq_notify' was not declared. Should it be static?
ipc/mqueue.c:1303:1: sparse: symbol 'SyS_mq_getsetattr' was not declared. Should it be static?
ipc/mqueue.c:1055:9: sparse: context imbalance in 'SyS_mq_timedsend' - different lock contexts for basic block
ipc/mqueue.c:1161:14: sparse: context imbalance in 'SyS_mq_timedreceive' - different lock contexts for basic block
kernel/futex.c:2442:1: sparse: symbol 'SyS_set_robust_list' was not declared. Should it be static?
kernel/futex.c:2464:1: sparse: symbol 'SyS_get_robust_list' was not declared. Should it be static?
kernel/futex.c:2698:1: sparse: symbol 'SyS_futex' was not declared. Should it be static?
kernel/futex_compat.c:120:1: sparse: symbol 'compat_SyS_set_robust_list' was not declared. Should it be static?
kernel/futex_compat.c:135:1: sparse: symbol 'compat_SyS_get_robust_list' was not declared. Should it be static?
kernel/futex_compat.c:174:1: sparse: symbol 'compat_SyS_futex' was not declared. Should it be static?
kernel/uid16.c:19:1: sparse: symbol 'SyS_chown16' was not declared. Should it be static?
kernel/uid16.c:27:1: sparse: symbol 'SyS_lchown16' was not declared. Should it be static?
kernel/uid16.c:35:1: sparse: symbol 'SyS_fchown16' was not declared. Should it be static?
kernel/uid16.c:43:1: sparse: symbol 'SyS_setregid16' was not declared. Should it be static?
kernel/uid16.c:51:1: sparse: symbol 'SyS_setgid16' was not declared. Should it be static?
kernel/uid16.c:59:1: sparse: symbol 'SyS_setreuid16' was not declared. Should it be static?
kernel/uid16.c:67:1: sparse: symbol 'SyS_setuid16' was not declared. Should it be static?
kernel/uid16.c:75:1: sparse: symbol 'SyS_setresuid16' was not declared. Should it be static?
kernel/uid16.c:84:1: sparse: symbol 'SyS_getresuid16' was not declared. Should it be static?
kernel/uid16.c:101:1: sparse: symbol 'SyS_setresgid16' was not declared. Should it be static?
kernel/uid16.c:111:1: sparse: symbol 'SyS_getresgid16' was not declared. Should it be static?
kernel/uid16.c:128:1: sparse: symbol 'SyS_setfsuid16' was not declared. Should it be static?
kernel/uid16.c:136:1: sparse: symbol 'SyS_setfsgid16' was not declared. Should it be static?
kernel/uid16.c:184:1: sparse: symbol 'SyS_getgroups16' was not declared. Should it be static?
kernel/uid16.c:207:1: sparse: symbol 'SyS_setgroups16' was not declared. Should it be static?
kernel/acct.c:255:1: sparse: symbol 'SyS_acct' was not declared. Should it be static?
kernel/kexec.c:942:1: sparse: symbol 'SyS_kexec_load' was not declared. Should it be static?
kernel/compat.c:293:1: sparse: symbol 'compat_SyS_getitimer' was not declared. Should it be static?
kernel/compat.c:305:1: sparse: symbol 'compat_SyS_setitimer' was not declared. Should it be static?
kernel/compat.c:384:1: sparse: symbol 'compat_SyS_sigprocmask' was not declared. Should it be static?
kernel/compat.c:538:1: sparse: symbol 'compat_SyS_wait4' was not declared. Should it be static?
kernel/compat.c:569:1: sparse: symbol 'compat_SyS_waitid' was not declared. Should it be static?
kernel/compat.c:996:1: sparse: symbol 'compat_SyS_rt_sigtimedwait' was not declared. Should it be static?
kernel/compat.c:1206:1: sparse: symbol 'compat_SyS_sched_rr_get_interval' was not declared. Should it be static?
kernel/groups.c:202:1: sparse: symbol 'SyS_getgroups' was not declared. Should it be static?
kernel/groups.c:231:1: sparse: symbol 'SyS_setgroups' was not declared. Should it be static?
kernel/fork.c:1087:1: sparse: symbol 'SyS_set_tid_address' was not declared. Should it be static?
kernel/fork.c:1671:1: sparse: symbol 'SyS_clone' was not declared. Should it be static?
kernel/fork.c:1797:1: sparse: symbol 'SyS_unshare' was not declared. Should it be static?
kernel/exec_domain.c:182:1: sparse: symbol 'SyS_personality' was not declared. Should it be static?
kernel/printk.c:1255:1: sparse: symbol 'SyS_syslog' was not declared. Should it be static?
kernel/itimer.c:103:1: sparse: symbol 'SyS_getitimer' was not declared. Should it be static?
kernel/itimer.c:278:1: sparse: symbol 'SyS_setitimer' was not declared. Should it be static?
kernel/time.c:62:1: sparse: symbol 'SyS_time' was not declared. Should it be static?
kernel/time.c:81:1: sparse: symbol 'SyS_stime' was not declared. Should it be static?
kernel/time.c:101:1: sparse: symbol 'SyS_gettimeofday' was not declared. Should it be static?
kernel/time.c:187:1: sparse: symbol 'SyS_settimeofday' was not declared. Should it be static?
kernel/time.c:208:1: sparse: symbol 'SyS_adjtimex' was not declared. Should it be static?
kernel/sysctl_binary.c:1419:1: sparse: symbol 'SyS_sysctl' was not declared. Should it be static?
kernel/capability.c:158:1: sparse: symbol 'SyS_capget' was not declared. Should it be static?
kernel/capability.c:232:1: sparse: symbol 'SyS_capset' was not declared. Should it be static?
kernel/timer.c:1391:1: sparse: symbol 'SyS_alarm' was not declared. Should it be static?
kernel/sys.c:173:1: sparse: symbol 'SyS_setpriority' was not declared. Should it be static?
kernel/sys.c:242:1: sparse: symbol 'SyS_getpriority' was not declared. Should it be static?
kernel/sys.c:434:1: sparse: symbol 'SyS_reboot' was not declared. Should it be static?
kernel/sys.c:560:1: sparse: symbol 'SyS_setregid' was not declared. Should it be static?
kernel/sys.c:617:1: sparse: symbol 'SyS_setgid' was not declared. Should it be static?
kernel/sys.c:693:1: sparse: symbol 'SyS_setreuid' was not declared. Should it be static?
kernel/sys.c:764:1: sparse: symbol 'SyS_setuid' was not declared. Should it be static?
kernel/sys.c:811:1: sparse: symbol 'SyS_setresuid' was not declared. Should it be static?
kernel/sys.c:876:1: sparse: symbol 'SyS_getresuid' was not declared. Should it be static?
kernel/sys.c:896:1: sparse: symbol 'SyS_setresgid' was not declared. Should it be static?
kernel/sys.c:948:1: sparse: symbol 'SyS_getresgid' was not declared. Should it be static?
kernel/sys.c:972:1: sparse: symbol 'SyS_setfsuid' was not declared. Should it be static?
kernel/sys.c:1011:1: sparse: symbol 'SyS_setfsgid' was not declared. Should it be static?
kernel/sys.c:1061:1: sparse: symbol 'SyS_times' was not declared. Should it be static?
kernel/sys.c:1086:1: sparse: symbol 'SyS_setpgid' was not declared. Should it be static?
kernel/sys.c:1157:1: sparse: symbol 'SyS_getpgid' was not declared. Should it be static?
kernel/sys.c:1194:1: sparse: symbol 'SyS_getsid' was not declared. Should it be static?
kernel/sys.c:1296:1: sparse: symbol 'SyS_newuname' was not declared. Should it be static?
kernel/sys.c:1316:1: sparse: symbol 'SyS_uname' was not declared. Should it be static?
kernel/sys.c:1335:1: sparse: symbol 'SyS_olduname' was not declared. Should it be static?
kernel/sys.c:1370:1: sparse: symbol 'SyS_sethostname' was not declared. Should it be static?
kernel/sys.c:1396:1: sparse: symbol 'SyS_gethostname' was not declared. Should it be static?
kernel/sys.c:1421:1: sparse: symbol 'SyS_setdomainname' was not declared. Should it be static?
kernel/sys.c:1445:1: sparse: symbol 'SyS_getrlimit' was not declared. Should it be static?
kernel/sys.c:1463:1: sparse: symbol 'SyS_old_getrlimit' was not declared. Should it be static?
kernel/sys.c:1604:1: sparse: symbol 'SyS_prlimit64' was not declared. Should it be static?
kernel/sys.c:1646:1: sparse: symbol 'SyS_setrlimit' was not declared. Should it be static?
kernel/sys.c:1779:1: sparse: symbol 'SyS_getrusage' was not declared. Should it be static?
kernel/sys.c:1787:1: sparse: symbol 'SyS_umask' was not declared. Should it be static?
kernel/sys.c:2004:1: sparse: symbol 'SyS_prctl' was not declared. Should it be static?
kernel/sys.c:2174:1: sparse: symbol 'SyS_getcpu' was not declared. Should it be static?
kernel/posix-timers.c:535:1: sparse: symbol 'SyS_timer_create' was not declared. Should it be static?
kernel/posix-timers.c:720:1: sparse: symbol 'SyS_timer_gettime' was not declared. Should it be static?
kernel/posix-timers.c:756:1: sparse: symbol 'SyS_timer_getoverrun' was not declared. Should it be static?
kernel/posix-timers.c:824:1: sparse: symbol 'SyS_timer_settime' was not declared. Should it be static?
kernel/posix-timers.c:887:1: sparse: symbol 'SyS_timer_delete' was not declared. Should it be static?
kernel/posix-timers.c:955:1: sparse: symbol 'SyS_clock_settime' was not declared. Should it be static?
kernel/posix-timers.c:970:1: sparse: symbol 'SyS_clock_gettime' was not declared. Should it be static?
kernel/posix-timers.c:988:1: sparse: symbol 'SyS_clock_adjtime' was not declared. Should it be static?
kernel/posix-timers.c:1011:1: sparse: symbol 'SyS_clock_getres' was not declared. Should it be static?
kernel/posix-timers.c:1040:1: sparse: symbol 'SyS_clock_nanosleep' was not declared. Should it be static?
kernel/hrtimer.c:1623:1: sparse: symbol 'SyS_nanosleep' was not declared. Should it be static?
kernel/nsproxy.c:239:1: sparse: symbol 'SyS_setns' was not declared. Should it be static?
kernel/kcmp.c:96:1: sparse: symbol 'SyS_kcmp' was not declared. Should it be static?
mm/mempolicy.c:1345:1: sparse: symbol 'SyS_mbind' was not declared. Should it be static?
mm/mempolicy.c:1367:1: sparse: symbol 'SyS_set_mempolicy' was not declared. Should it be static?
mm/mempolicy.c:1386:1: sparse: symbol 'SyS_migrate_pages' was not declared. Should it be static?
mm/mempolicy.c:1482:1: sparse: symbol 'SyS_get_mempolicy' was not declared. Should it be static?
mm/fadvise.c:28:1: sparse: symbol 'SyS_fadvise64_64' was not declared. Should it be static?
mm/fadvise.c:151:1: sparse: symbol 'SyS_fadvise64' was not declared. Should it be static?
mm/readahead.c:579:1: sparse: symbol 'SyS_readahead' was not declared. Should it be static?
mm/fremap.c:124:1: sparse: symbol 'SyS_remap_file_pages' was not declared. Should it be static?
mm/madvise.c:459:1: sparse: symbol 'SyS_madvise' was not declared. Should it be static?
mm/mincore.c:267:1: sparse: symbol 'SyS_mincore' was not declared. Should it be static?
mm/mlock.c:448:1: sparse: symbol 'SyS_mlock' was not declared. Should it be static?
mm/mlock.c:478:1: sparse: symbol 'SyS_munlock' was not declared. Should it be static?
mm/mlock.c:515:1: sparse: symbol 'SyS_mlockall' was not declared. Should it be static?
mm/mmap.c:253:1: sparse: symbol 'SyS_brk' was not declared. Should it be static?
mm/mmap.c:1314:1: sparse: symbol 'SyS_mmap_pgoff' was not declared. Should it be static?
mm/mmap.c:2528:1: sparse: symbol 'SyS_munmap' was not declared. Should it be static?
mm/mprotect.c:321:1: sparse: symbol 'SyS_mprotect' was not declared. Should it be static?
mm/mremap.c:449:1: sparse: symbol 'SyS_mremap' was not declared. Should it be static?
mm/msync.c:31:1: sparse: symbol 'SyS_msync' was not declared. Should it be static?
mm/process_vm_access.c:398:1: sparse: symbol 'SyS_process_vm_readv' was not declared. Should it be static?
mm/process_vm_access.c:405:1: sparse: symbol 'SyS_process_vm_writev' was not declared. Should it be static?
mm/swapfile.c:1562:1: sparse: symbol 'SyS_swapoff' was not declared. Should it be static?
mm/swapfile.c:2018:1: sparse: symbol 'SyS_swapon' was not declared. Should it be static?
net/socket.c:1382:1: sparse: symbol 'SyS_socket' was not declared. Should it be static?
net/socket.c:1423:1: sparse: symbol 'SyS_socketpair' was not declared. Should it be static?
net/socket.c:1519:1: sparse: symbol 'SyS_bind' was not declared. Should it be static?
net/socket.c:1548:1: sparse: symbol 'SyS_listen' was not declared. Should it be static?
net/socket.c:1581:1: sparse: symbol 'SyS_accept4' was not declared. Should it be static?
net/socket.c:1662:1: sparse: symbol 'SyS_accept' was not declared. Should it be static?
net/socket.c:1680:1: sparse: symbol 'SyS_connect' was not declared. Should it be static?
net/socket.c:1712:1: sparse: symbol 'SyS_getsockname' was not declared. Should it be static?
net/socket.c:1743:1: sparse: symbol 'SyS_getpeername' was not declared. Should it be static?
net/socket.c:1775:1: sparse: symbol 'SyS_sendto' was not declared. Should it be static?
net/socket.c:1822:1: sparse: symbol 'SyS_send' was not declared. Should it be static?
net/socket.c:1834:1: sparse: symbol 'SyS_recvfrom' was not declared. Should it be static?
net/socket.c:1890:1: sparse: symbol 'SyS_setsockopt' was not declared. Should it be static?
net/socket.c:1924:1: sparse: symbol 'SyS_getsockopt' was not declared. Should it be static?
net/socket.c:1954:1: sparse: symbol 'SyS_shutdown' was not declared. Should it be static?
net/socket.c:2096:1: sparse: symbol 'SyS_sendmsg' was not declared. Should it be static?
net/socket.c:2171:1: sparse: symbol 'SyS_sendmmsg' was not declared. Should it be static?
net/socket.c:2269:1: sparse: symbol 'SyS_recvmsg' was not declared. Should it be static?
net/socket.c:2393:1: sparse: symbol 'SyS_recvmmsg' was not declared. Should it be static?
net/socket.c:2435:1: sparse: symbol 'SyS_socketcall' was not declared. Should it be static?
security/keys/keyctl.c:57:1: sparse: symbol 'SyS_add_key' was not declared. Should it be static?
security/keys/keyctl.c:157:1: sparse: symbol 'SyS_request_key' was not declared. Should it be static?
security/keys/keyctl.c:1569:1: sparse: symbol 'SyS_keyctl' was not declared. Should it be static?

[coccinelle]
drivers/pci/pci.c:946:2-8: SUGGESTION: printk + WARN_ON can be just WARN

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
