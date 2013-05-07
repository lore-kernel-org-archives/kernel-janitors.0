From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 07 May 2013 20:51:04 +0000
Subject: build regressions 2013-05-07
Message-Id: <51896938.4k4P8GwtdtxRZ6M7%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
security/integrity/ima/ima_main.c:156:1: error: expected identifier or '(' before '<<' token
security/integrity/ima/ima_main.c:196:1: error: expected declaration specifiers before '>>' token
security/integrity/ima/ima_main.c:196:9: error: exponent has no digits
security/integrity/ima/ima_main.c:299:9: error: exponent has no digits
security/integrity/ima/ima_main.c:319:9: error: exponent has no digits
security/integrity/ima/ima_main.c:339:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:355:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:375:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:393:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:402:31: error: storage class specified for parameter 'ima_file_check'
security/integrity/ima/ima_main.c:402:60: error: storage class specified for parameter '__crc_ima_file_check'
security/integrity/ima/ima_main.c:402:131: error: storage class specified for parameter '__kcrctab_ima_file_check'
security/integrity/ima/ima_main.c:402:1: error: parameter '__kcrctab_ima_file_check' is initialized
security/integrity/ima/ima_main.c:402:131: error: section attribute not allowed for '__kcrctab_ima_file_check'
security/integrity/ima/ima_main.c:402:316: error: storage class specified for parameter '__kstrtab_ima_file_check'
security/integrity/ima/ima_main.c:402:1: error: parameter '__kstrtab_ima_file_check' is initialized
security/integrity/ima/ima_main.c:402:316: error: section attribute not allowed for '__kstrtab_ima_file_check'
security/integrity/ima/ima_main.c:402:316: error: alignment may not be specified for '__kstrtab_ima_file_check'
security/integrity/ima/ima_main.c:402:458: error: storage class specified for parameter '__ksymtab_ima_file_check'
security/integrity/ima/ima_main.c:402:444: error: parameter '__ksymtab_ima_file_check' is initialized
security/integrity/ima/ima_main.c:402:458: error: section attribute not allowed for '__ksymtab_ima_file_check'
security/integrity/ima/ima_main.c:414:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:427:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
security/integrity/ima/ima_main.c:436:19: error: storage class specified for parameter '__initcall_init_ima7'
security/integrity/ima/ima_main.c:436:1: error: parameter '__initcall_init_ima7' is initialized
security/integrity/ima/ima_main.c:436:19: error: section attribute not allowed for '__initcall_init_ima7'
security/integrity/ima/ima_main.c:436:122: error: 'init_ima' undeclared (first use in this function)
security/integrity/ima/ima_main.c:193:5: error: old-style parameter declarations in prototyped function definition
security/integrity/ima/ima_main.c:439:8: error: expected '{' at end of input
security/integrity/ima/ima_dir.c:45:1: error: expected expression before '<<' token
security/integrity/ima/ima_dir.c:48:1: error: expected expression before '=' token
security/integrity/ima/ima_dir.c:49:9: error: exponent has no digits
security/integrity/ima/ima_dir.c:54:1: error: expected expression before '<<' token
security/integrity/ima/ima_dir.c:99:2: error: 'rc' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:99:31: error: 'iint' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:99:44: error: 'xattr_value' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:103:2: error: 'pathname' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:103:31: error: 'pathbuf' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:116:1: error: expected expression before '=' token
security/integrity/ima/ima_dir.c:118:1: error: expected expression before '>>' token
security/integrity/ima/ima_dir.c:118:9: error: exponent has no digits
security/integrity/ima/ima_dir.c:170:1: error: expected expression before '<<' token
security/integrity/ima/ima_dir.c:174:1: error: expected expression before '=' token
security/integrity/ima/ima_dir.c:176:51: error: 'hash' undeclared (first use in this function)
security/integrity/ima/ima_dir.c:176:2: error: too few arguments to function 'ima_collect_measurement'
security/integrity/ima/ima_dir.c:178:1: error: expected expression before '>>' token
security/integrity/ima/ima_dir.c:178:9: error: exponent has no digits
kernel/compat.c:55:5: error: conflicting types for 'compat_get_timex'
kernel/compat.c:85:5: error: conflicting types for 'compat_put_timex'
net/ipv4/sysctl_net_ipv4.c:758:15: error: 'two' undeclared here (not in a function)
drivers/gpu/drm/qxl/qxl_fb.c:162:8: error: variable 'qxl_defio' has initializer but incomplete type
drivers/gpu/drm/qxl/qxl_fb.c:163:2: error: unknown field 'delay' specified in initializer
drivers/gpu/drm/qxl/qxl_fb.c:164:2: error: unknown field 'deferred_io' specified in initializer
drivers/gpu/drm/qxl/qxl_fb.c:456:6: error: 'struct fb_info' has no member named 'fbdefio'
drivers/scsi/mpt3sas/mpt3sas.mod.c:8:1: error: variable '__this_module' has initializer but incomplete type
drivers/scsi/mpt3sas/mpt3sas.mod.c:9:2: error: unknown field 'name' specified in initializer
drivers/scsi/mpt3sas/mpt3sas.mod.c:10:2: error: unknown field 'init' specified in initializer
drivers/scsi/mpt3sas/mpt3sas.mod.c:14:2: error: unknown field 'arch' specified in initializer
drivers/scsi/mpt3sas/mpt3sas.mod.c:14:10: error: 'MODULE_ARCH_INIT' undeclared here (not in a function)

[warnings]
security/integrity/ima/ima_main.c:439: warning: no return statement in function returning non-void
arch/x86/boot/compressed/misc.c:450:27: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/scsi/pm8001/pm8001_init.c:379:204: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
security/integrity/ima/ima_main.c:402:1: warning: 'weak' attribute ignored [-Wattributes]
security/integrity/ima/ima_main.c:402:1: warning: '__used__' attribute ignored [-Wattributes]
security/integrity/ima/ima_main.c:402:444: warning: '__used__' attribute ignored [-Wattributes]
security/integrity/ima/ima_main.c:436:1: warning: '__used__' attribute ignored [-Wattributes]
security/integrity/ima/ima_main.c:438:1: warning: empty declaration [enabled by default]
security/integrity/ima/ima_main.c:439:1: warning: empty declaration [enabled by default]
security/integrity/ima/ima_main.c:439:8: warning: control reaches end of non-void function [-Wreturn-type]
security/integrity/ima/ima_dir.c:47:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
security/integrity/ima/ima_dir.c:112:1: warning: label 'out_unlocked' defined but not used [-Wunused-label]
security/integrity/ima/ima_dir.c:176:2: warning: passing argument 4 of 'ima_collect_measurement' from incompatible pointer type [enabled by default]
security/integrity/ima/ima_dir.c:176:2: warning: passing argument 5 of 'ima_collect_measurement' from incompatible pointer type [enabled by default]
block/blk-throttle.c:456:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:481:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:497:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:565:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:906:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:917:3: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:1026:2: warning: unused variable '__td' [-Wunused-variable]
block/blk-throttle.c:1186:2: warning: unused variable '__td' [-Wunused-variable]
drivers/scsi/pm8001/pm80xx_hwi.c:809:3: warning: 'ret' may be used uninitialized in this function [-Wuninitialized]
arch/mips/kernel/crash_dump.c:67:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/s390/block/dasd.c:3040:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/s390/block/dasd.c:3040:2: warning: (near initialization for 'dasd_device_operations.release') [enabled by default]
security/integrity/ima/ima_crypto.c:109:1: warning: 'ima_calc_dir_hash' uses dynamic stack allocation [enabled by default]
include/linux/compat.h:164:52: warning: 'struct timex' declared inside parameter list [enabled by default]
include/linux/compat.h:164:52: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/compat.h:165:66: warning: 'struct timex' declared inside parameter list [enabled by default]
include/linux/compat.h:164:52: warning: 'struct timex' declared inside parameter list [enabled by default]
include/linux/compat.h:164:52: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/compat.h:165:66: warning: 'struct timex' declared inside parameter list [enabled by default]
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
warning: (VIDEO_GO7007) selects VIDEO_OV7640 which has unmet direct dependencies (MEDIA_SUPPORT && I2C && VIDEO_V4L2 && MEDIA_CAMERA_SUPPORT)
fs/notify/fanotify/fanotify_user.c:874:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/gpu/drm/qxl/qxl_fb.c:163:2: warning: excess elements in struct initializer [enabled by default]
drivers/gpu/drm/qxl/qxl_fb.c:163:2: warning: (near initialization for 'qxl_defio') [enabled by default]
drivers/gpu/drm/qxl/qxl_fb.c:164:2: warning: excess elements in struct initializer [enabled by default]
drivers/gpu/drm/qxl/qxl_fb.c:164:2: warning: (near initialization for 'qxl_defio') [enabled by default]

[sparse]
drivers/input/keyreset.c:39:5: sparse: symbol 'restart_requested' was not declared. Should it be static?
drivers/input/keyreset.c:213:5: sparse: symbol 'keyreset_remove' was not declared. Should it be static?
drivers/input/keyreset.c:222:24: sparse: symbol 'keyreset_driver' was not declared. Should it be static?
drivers/input/keyreset.c:39:5: sparse: symbol 'restart_requested' was not declared. Should it be static?
drivers/input/keyreset.c:213:5: sparse: symbol 'keyreset_remove' was not declared. Should it be static?
drivers/input/keyreset.c:222:24: sparse: symbol 'keyreset_driver' was not declared. Should it be static?
drivers/input/misc/keychord.c:230:44: sparse: Using plain integer as NULL pointer
drivers/input/misc/keychord.c:256:27: sparse: Using plain integer as NULL pointer
drivers/input/misc/keychord.c:300:35: sparse: Using plain integer as NULL pointer
drivers/net/ppp/pppopns.c:80:34: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pppopns.c:81:46: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pppopns.c:81:64: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pppopns.c:86:46: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pppopns.c:87:46: sparse: restricted __be16 degrades to integer
drivers/net/ppp/pppopns.c:91:33: sparse: cast to restricted __be16
drivers/net/ppp/pppopns.c:91:33: sparse: cast to restricted __be16
drivers/net/ppp/pppopns.c:91:33: sparse: cast to restricted __be16
drivers/net/ppp/pppopns.c:91:33: sparse: cast to restricted __be16
drivers/net/ppp/pppopns.c:133:19: sparse: incorrect type in assignment (different base types)
drivers/net/ppp/pppopns.c:134:19: sparse: incorrect type in assignment (different base types)
drivers/net/ppp/pppopns.c:135:21: sparse: incorrect type in assignment (different base types)
drivers/net/ppp/pppopns.c:137:23: sparse: incorrect type in assignment (different base types)
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
drivers/net/ppp/pppopns.c:103:34: sparse: cast to restricted __be32
net/netfilter/xt_socket.c:283:24: sparse: Using plain integer as NULL pointer
drivers/hid/hid-magicmouse.c:561:29: sparse: incorrect type in initializer (different base types)
drivers/hid/hid-magicmouse.c:561:29: sparse: incorrect type in initializer (different base types)
drivers/hid/hid-ntrig.c:1025:29: sparse: incorrect type in initializer (different base types)
drivers/hid/hid-ntrig.c:1025:29: sparse: incorrect type in initializer (different base types)
drivers/base/sw_sync.c:72:26: sparse: symbol 'sw_sync_timeline_ops' was not declared. Should it be static?
drivers/base/sw_sync.c:105:5: sparse: symbol 'sw_sync_open' was not declared. Should it be static?
drivers/base/sw_sync.c:121:5: sparse: symbol 'sw_sync_release' was not declared. Should it be static?
drivers/base/sw_sync.c:128:6: sparse: symbol 'sw_sync_ioctl_create_fence' was not declared. Should it be static?
drivers/base/sw_sync.c:169:6: sparse: symbol 'sw_sync_ioctl_inc' was not declared. Should it be static?
drivers/base/sw_sync.c:181:6: sparse: symbol 'sw_sync_ioctl' was not declared. Should it be static?
drivers/base/sw_sync.c:210:12: sparse: symbol 'sw_sync_device_init' was not declared. Should it be static?
drivers/base/sw_sync.c:215:13: sparse: symbol 'sw_sync_device_remove' was not declared. Should it be static?
drivers/base/sw_sync.c:72:26: sparse: symbol 'sw_sync_timeline_ops' was not declared. Should it be static?
drivers/base/sw_sync.c:105:5: sparse: symbol 'sw_sync_open' was not declared. Should it be static?
drivers/base/sw_sync.c:121:5: sparse: symbol 'sw_sync_release' was not declared. Should it be static?
drivers/base/sw_sync.c:128:6: sparse: symbol 'sw_sync_ioctl_create_fence' was not declared. Should it be static?
drivers/base/sw_sync.c:169:6: sparse: symbol 'sw_sync_ioctl_inc' was not declared. Should it be static?
drivers/base/sw_sync.c:181:6: sparse: symbol 'sw_sync_ioctl' was not declared. Should it be static?
drivers/base/sw_sync.c:210:12: sparse: symbol 'sw_sync_device_init' was not declared. Should it be static?
drivers/base/sw_sync.c:215:13: sparse: symbol 'sw_sync_device_remove' was not declared. Should it be static?
drivers/base/sync.c:923:6: sparse: symbol 'sync_dump' was not declared. Should it be static?
drivers/base/sync.c:923:6: sparse: symbol 'sync_dump' was not declared. Should it be static?
mm/vmscan.c:164:21: sparse: incorrect type in assignment (different base types)
drivers/gator/gator_events_irq.c:21:8: sparse: symbol 'irqCnt' was not declared. Should it be static?
drivers/gator/gator_events_irq.c:22:8: sparse: symbol 'irqGet' was not declared. Should it be static?
drivers/gator/gator_events_irq.c:156:5: sparse: symbol 'gator_events_irq_init' was not declared. Should it be static?
drivers/gator/gator_events_sched.c:18:8: sparse: symbol 'schedCnt' was not declared. Should it be static?
drivers/gator/gator_events_sched.c:19:8: sparse: symbol 'schedGet' was not declared. Should it be static?
drivers/gator/gator_events_sched.c:106:5: sparse: symbol 'gator_events_sched_init' was not declared. Should it be static?
drivers/gator/gator_events_net.c:48:1: sparse: symbol 'wq_get_stats' was not declared. Should it be static?
drivers/gator/gator_events_net.c:97:27: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_net.c:160:5: sparse: symbol 'gator_events_net_init' was not declared. Should it be static?
drivers/gator/gator_events_block.c:144:5: sparse: symbol 'gator_events_block_init' was not declared. Should it be static?
drivers/gator/gator_events_meminfo.c:227:5: sparse: symbol 'gator_events_meminfo_init' was not declared. Should it be static?
drivers/gator/gator_events_perf_pmu.c:121:60: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_perf_pmu.c:134:83: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_perf_pmu.c:134:95: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_perf_pmu.c:455:74: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_perf_pmu.c:455:92: sparse: Using plain integer as NULL pointer
drivers/gator/gator_events_perf_pmu.c:424:5: sparse: symbol 'gator_events_perf_pmu_init' was not declared. Should it be static?
drivers/gator/gator_events_mmaped.c:211:12: sparse: symbol 'gator_events_mmaped_init' was not declared. Should it be static?
drivers/gator/gator_events_mali_common.c:16:19: sparse: function 'gator_mali_get_mali_name' with external linkage has definition
drivers/gator/gator_events_mali_common.c:31:12: sparse: function 'gator_mali_create_file_system' with external linkage has definition
drivers/gator/gator_events_mali_common.c:64:13: sparse: function 'gator_mali_initialise_counters' with external linkage has definition
drivers/staging/android/binder.c:1477:46: sparse: incorrect type in argument 2 (different address spaces)
drivers/staging/android/binder.c:1483:35: sparse: incorrect type in argument 2 (different address spaces)
drivers/staging/android/binder.c:1703:5: sparse: symbol 'binder_thread_write' was not declared. Should it be static?
drivers/staging/android/binder.c:2070:6: sparse: symbol 'binder_stat_br' was not declared. Should it be static?
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/binder.c:2680:21: sparse: cast removes address space of expression
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:268:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:147:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:171:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:147:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:171:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/binder.c:1456:35: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2670:68: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2671:33: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2678:57: sparse: dereference of noderef expression
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:268:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:87:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:268:1: sparse: expression using sizeof bool
drivers/staging/android/./binder_trace.h:147:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:171:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:147:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/./binder_trace.h:171:1: sparse: incorrect type in assignment (different base types)
drivers/staging/android/binder.c:1456:35: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2670:68: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2671:33: sparse: dereference of noderef expression
drivers/staging/android/binder.c:2678:57: sparse: dereference of noderef expression
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:87:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/staging/android/./binder_trace.h:268:1: sparse: odd constant _Bool cast (ffffffffffffffff becomes 1)
drivers/ata/sata_phy.c:45:5: sparse: context imbalance in 'sata_add_phy' - different lock contexts for basic block
drivers/ata/sata_phy.c:72:6: sparse: context imbalance in 'sata_remove_phy' - different lock contexts for basic block
drivers/ata/sata_phy.c:91:6: sparse: context imbalance in 'sata_put_phy' - different lock contexts for basic block
security/integrity/ima/ima_api.c:231:47: sparse: bad constant expression
security/integrity/ima/ima.h:34:24: sparse: duplicate const
security/integrity/ima/ima.h:34:24: sparse: duplicate const
security/integrity/ima/ima.h:34:24: sparse: duplicate const
include/crypto/hash_info.h:57:24: sparse: duplicate const
crypto/hash_info.c:37:17: sparse: duplicate const
include/crypto/hash_info.h:57:24: sparse: duplicate const
include/crypto/hash_info.h:57:24: sparse: duplicate const
include/crypto/hash_info.h:57:24: sparse: duplicate const
include/crypto/hash_info.h:57:24: sparse: duplicate const
security/integrity/ima/ima_main.c:156:1: sparse: missing identifier in declaration
security/integrity/ima/ima_main.c:169:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:178:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:180:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:184:17: sparse: Trying to use reserved word 'return' as identifier
security/integrity/ima/ima_main.c:190:9: sparse: Trying to use reserved word 'return' as identifier
security/integrity/ima/ima_main.c:207:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:215:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:223:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:226:17: sparse: Trying to use reserved word 'do' as identifier
security/integrity/ima/ima_main.c:228:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:237:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:240:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:253:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:255:25: sparse: Trying to use reserved word 'goto' as identifier
security/integrity/ima/ima_main.c:281:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_main.c:288:9: sparse: too many errors
security/integrity/ima/ima_dir.c:67:11: sparse: Trying to use reserved word 'else' as identifier
security/integrity/ima/ima_dir.c:72:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:75:17: sparse: Trying to use reserved word 'do' as identifier
security/integrity/ima/ima_dir.c:80:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:82:25: sparse: Trying to use reserved word 'goto' as identifier
security/integrity/ima/ima_dir.c:92:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:94:17: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:100:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:104:9: sparse: Trying to use reserved word 'if' as identifier
security/integrity/ima/ima_dir.c:115:9: sparse: Trying to use reserved word 'return' as identifier
security/integrity/ima/ima_dir.c:131:9: sparse: Trying to use reserved word 'return' as identifier
security/integrity/ima/ima_dir.c:61:25: sparse: label 'out_unlocked' was not declared
security/integrity/ima/ima_dir.c:159:17: sparse: too many arguments for function mutex_lock_nested
security/integrity/ima/ima_dir.c:205:9: sparse: too many arguments for function __builtin_expect
security/integrity/ima/ima_dir.c:205:9: sparse: too many arguments for function __builtin_expect
security/integrity/ima/ima_dir.c:207:13: sparse: too many arguments for function __builtin_expect
security/integrity/ima/ima_dir.c:217:17: sparse: too many arguments for function __builtin_expect
security/integrity/ima/ima_template_info.c:16:12: sparse: symbol 'IMA_TEMPLATE_NAME' was not declared. Should it be static?
security/integrity/ima/ima_template_info.c:17:12: sparse: symbol 'IMA_NG_TEMPLATE_NAME' was not declared. Should it be static?
security/integrity/ima/ima_template_info.c:19:12: sparse: symbol 'template_hash_name' was not declared. Should it be static?
security/integrity/ima/ima_main.c:156:1: sparse: Expected ; at the end of type declaration
security/integrity/ima/ima_main.c:156:1: sparse: got <<
security/integrity/ima/ima_main.c:169:13: sparse: Expected ) in function declarator
security/integrity/ima/ima_main.c:179:17: sparse: Expected ; at end of declaration
security/integrity/ima/ima_main.c:179:17: sparse: got mm_populate
security/integrity/ima/ima_main.c:180:13: sparse: got (
security/integrity/ima/ima_main.c:184:24: sparse: got addr
security/integrity/ima/ima_main.c:255:30: sparse: got out
security/integrity/ima/ima_main.c:281:17: sparse: Expected ) in nested declarator
security/integrity/ima/ima_dir.c:45:1: sparse: Expected ; at end of statement
security/integrity/ima/ima_dir.c:45:1: sparse: got <<
security/integrity/ima/ima_dir.c:67:16: sparse: Expected ; at end of declaration
security/integrity/ima/ima_dir.c:72:21: sparse: Expected ) in function declarator
security/integrity/ima/ima_dir.c:75:17: sparse: Expected ; at the end of type declaration
security/integrity/ima/ima_dir.c:82:30: sparse: got out_locked
security/integrity/ima/ima_dir.c:92:13: sparse: got (
security/integrity/ima/ima_dir.c:94:17: sparse: Expected ) in nested declarator
security/integrity/ima/ima_dir.c:101:17: sparse: got goto
security/integrity/ima/ima_dir.c:110:11: sparse: got :
security/integrity/ima/ima_dir.c:131:16: sparse: got dir_measurement
security/integrity/ima/ima_dir.c:58:17: sparse: undefined identifier 'iint'
security/integrity/ima/ima_dir.c:71:44: sparse: undefined identifier 'inode'
security/integrity/ima/ima_dir.c:103:31: sparse: undefined identifier 'path'
security/integrity/ima/ima_dir.c:107:39: sparse: undefined identifier 'func'
security/integrity/ima/ima_dir.c:176:51: sparse: undefined identifier 'hash'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
