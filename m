From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Apr 2013 01:55:27 +0000
Subject: build regressions 2013-04-20
Message-Id: <5173470f.1muj9qNU3sg4gfhG%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/net/ethernet/ibm/ehea/ehea_main.c:728:5: error: too few arguments to function '__vlan_hwaccel_put_tag'
drivers/net/ethernet/ibm/ehea/ehea_main.c:3027:9: error: expected expression before '|' token
net/netlink/af_netlink.c:350:40: error: 'NL_MMAP_MSG_HDRLEN' undeclared (first use in this function)
drivers/s390/net/qeth_l3_main.c:1662:3: error: too few arguments to function '__vlan_find_dev_deep'
drivers/s390/net/qeth_l3_main.c:1723:3: error: too few arguments to function '__vlan_find_dev_deep'
drivers/s390/net/qeth_l3_main.c:1767:2: error: too few arguments to function '__vlan_find_dev_deep'
drivers/s390/net/qeth_l3_main.c:1797:2: error: too few arguments to function '__vlan_find_dev_deep'
drivers/s390/net/qeth_l3_main.c:2089:3: error: too few arguments to function '__vlan_find_dev_deep'
drivers/s390/net/qeth_l3_main.c:1980:6: error: too few arguments to function '__vlan_hwaccel_put_tag'
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:188:5: error: too many arguments to function '__vlan_find_dev_deep'
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:3349:3: error: too many arguments to function '__vlan_find_dev_deep'
net/bridge/br_netfilter.c:539:9: error: too many arguments to function '__vlan_find_dev_deep'
drivers/net/team/team.c:1613:3: error: too many arguments to function 'vlan_vid_add'
drivers/net/team/team.c:1623:3: error: too many arguments to function 'vlan_vid_del'
drivers/net/team/team.c:1636:3: error: too many arguments to function 'vlan_vid_del'
drivers/net/bonding/bond_main.c:439:3: error: too many arguments to function 'vlan_vid_add'
drivers/net/bonding/bond_main.c:457:3: error: too many arguments to function 'vlan_vid_del'
drivers/net/bonding/bond_main.c:475:3: error: too many arguments to function 'vlan_vid_del'
drivers/net/bonding/bond_main.c:494:8: error: too many arguments to function 'vlan_vid_add'
drivers/net/bonding/bond_main.c:510:3: error: too many arguments to function 'vlan_vid_del'
drivers/net/bonding/bond_main.c:786:7: error: too many arguments to function '__vlan_find_dev_deep'
drivers/net/bonding/bond_main.c:2516:7: error: too many arguments to function '__vlan_find_dev_deep'
drivers/net/bonding/bond_main.c:2608:8: error: too many arguments to function '__vlan_find_dev_deep'
drivers/net/macvlan.c:575:2: error: too many arguments to function 'vlan_vid_add'
drivers/net/macvlan.c:584:2: error: too many arguments to function 'vlan_vid_del'

[warnings]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:967:7: warning: large integer implicitly truncated to unsigned type [-Woverflow]
arch/x86/boot/compressed/eboot.c:269:2: warning: passing argument 1 of 'efi_call_phys' makes pointer from integer without a cast [enabled by default]
fs/ceph/file.c:750:2: warning: format '%ld' expects argument of type 'long int', but argument 11 has type 'ssize_t' [-Wformat]
fs/ceph/file.c:761:2: warning: format '%ld' expects argument of type 'long int', but argument 11 has type 'ssize_t' [-Wformat]
drivers/tty/rocket.c:153:15: warning: 'upci_aiop_intr_bits' defined but not used [-Wunused-variable]
net/8021q/vlan.h:122:1: warning: control reaches end of non-void function [-Wreturn-type]
net/8021q/vlan.h:122:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/staging/comedi/drivers/ni_labpc.c:1763:6: warning: unused variable 'ret' [-Wunused-variable]
drivers/xen/tmem.c:365:13: warning: 'disable_frontswap_selfshrinking' defined but not used [-Wunused-variable]

[sparse]
drivers/scsi/scsi_transport_iscsi.c:677:20: sparse: symbol 'iscsi_flashnode_sess_dev_type' was not declared. Should it be static?
drivers/scsi/scsi_transport_iscsi.c:863:20: sparse: symbol 'iscsi_flashnode_conn_dev_type' was not declared. Should it be static?
drivers/scsi/scsi_transport_iscsi.c:869:17: sparse: symbol 'iscsi_flashnode_bus' was not declared. Should it be static?
drivers/scsi/qla2xxx/qla_os.c:648:1: sparse: symbol 'qla2x00_sp_compl' was not declared. Should it be static?
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
arch/x86/crypto/sha256_ssse3_glue.c:56:17: sparse: symbol 'sha256_transform_asm' was not declared. Should it be static?
arch/x86/crypto/sha512_ssse3_glue.c:55:17: sparse: symbol 'sha512_transform_asm' was not declared. Should it be static?
arch/x86/crypto/sha512_ssse3_glue.c:144:19: sparse: restricted __be64 degrades to integer
arch/x86/crypto/sha512_ssse3_glue.c:144:17: sparse: incorrect type in assignment (different base types)
drivers/pps/kc.c:37:1: sparse: symbol 'pps_kc_hardpps_lock' was not declared. Should it be static?
drivers/pps/kc.c:39:19: sparse: symbol 'pps_kc_hardpps_dev' was not declared. Should it be static?
drivers/pps/kc.c:40:5: sparse: symbol 'pps_kc_hardpps_mode' was not declared. Should it be static?
kernel/time/tick-sched.c:32:1: sparse: symbol '__pcpu_scope_tick_cpu_sched' was not declared. Should it be static?
kernel/trace/trace.c:493:6: sparse: symbol 'free_snapshot' was not declared. Should it be static?
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
mm/swapfile.c:2018:1: sparse: symbol 'SyS_swapon' was not declared. Should it be static?
kernel/sys.c:1788:1: sparse: symbol 'compat_SyS_getrusage' was not declared. Should it be static?
fs/read_write.c:974:1: sparse: symbol 'compat_SyS_readv' was not declared. Should it be static?
fs/read_write.c:991:1: sparse: symbol 'compat_SyS_preadv64' was not declared. Should it be static?
fs/read_write.c:1010:1: sparse: symbol 'compat_SyS_preadv' was not declared. Should it be static?
fs/read_write.c:1040:1: sparse: symbol 'compat_SyS_writev' was not declared. Should it be static?
fs/read_write.c:1057:1: sparse: symbol 'compat_SyS_pwritev64' was not declared. Should it be static?
fs/read_write.c:1076:1: sparse: symbol 'compat_SyS_pwritev' was not declared. Should it be static?
mm/mmap.c:3199:15: sparse: symbol 'init_reserve_notifier' was not declared. Should it be static?
mm/huge_memory.c:189:24: sparse: Using plain integer as NULL pointer
kernel/sys.c:2396:1: sparse: symbol 'SyS_sysinfo' was not declared. Should it be static?
kernel/sys.c:2426:1: sparse: symbol 'compat_SyS_sysinfo' was not declared. Should it be static?
drivers/rtc/rtc-ds1286.c:343:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/rtc/rtc-ds1286.c:344:36: sparse: incorrect type in argument 1 (different address spaces)
fs/fat/inode.c:169:25: sparse: incompatible types in comparison expression (different type sizes)
drivers/md/bcache/debug.c:208:33: sparse: incorrect type in assignment (different argument counts)
net/irda/irlmp.c:61:12: sparse: symbol 'irlmp_reasons' was not declared. Should it be static?
arch/x86/net/bpf_jit_comp.c:42:24: sparse: cast truncates bits from constant value (b047b70f becomes f)
arch/x86/net/bpf_jit_comp.c:44:31: sparse: cast truncates bits from constant value (b047b70f becomes b70f)
arch/x86/net/bpf_jit_comp.c:42:24: sparse: cast truncates bits from constant value (aa47b70f becomes f)
arch/x86/net/bpf_jit_comp.c:44:31: sparse: cast truncates bits from constant value (aa47b70f becomes b70f)
net/netlink/af_netlink.c:115:39: sparse: incorrect type in return expression (different modifiers)
net/netlink/af_netlink.c:117:24: sparse: incorrect type in return expression (different modifiers)
net/netlink/af_netlink.c:318:38: sparse: incorrect type in assignment (different modifiers)

[smatch]
drivers/scsi/sd.c:2108 sd_read_cache_type() error: buffer overflow 'buffer' 512 <= 513
drivers/scsi/sd.c:2109 sd_read_cache_type() error: buffer overflow 'buffer' 512 <= 514
drivers/scsi/sd.c:2111 sd_read_cache_type() error: buffer overflow 'buffer' 512 <= 512

[coccinelle]
mm/hugetlb.c:2278:2-8: preceding lock on line 2316
mm/hugetlb.c:2278:2-8: preceding lock on line 2316

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
