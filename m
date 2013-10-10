From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 10 Oct 2013 21:06:47 +0000
Subject: build regressions 2013-10-10
Message-Id: <525716e7.26LFNFkQglKNFEr5%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/rcu/tree.c:3375:31: error: expected ')' before ';' token
kernel/rcu/tree.c:3419:1: error: expected ';' before '}' token
include/video/vga.h:23:21: error: asm/vga.h: No such file or directory
drivers/gpu/drm/gma500/mdfld_dsi_output.c:305:8: error: too few arguments to function 'drm_object_property_set_value'
drivers/base/regmap/regmap.c:1476:7: error: too many arguments to function '_regmap_raw_write'
(.init.text+0x1307): undefined reference to `boot_cpu_is_bsp_init'
ERROR: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!
include/linux/of_fdt.h:120:20: error: 'of_flat_dt_get_machine_name' defined but not used [-Werror=unused-function]
drivers/target/mlx4_fc/mfc.c:347:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:349:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:427:2: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:1738:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:1790:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:156:2: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:638:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:640:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:116:3: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:941:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:942:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
kernel/rcu/tree.c:3374:2: error: missing terminating " character
kernel/rcu/tree.c:3375:3: error: expected ')' before 'rcu_fanout_leaf'
drivers/gpu/drm/i915/intel_uncore.c:115:17: error: 'dev' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_uncore.c:119:13: error: invalid storage class for function 'gen6_gt_check_fifodbg'
drivers/gpu/drm/i915/intel_uncore.c:129:13: error: invalid storage class for function '__gen6_gt_force_wake_put'
drivers/gpu/drm/i915/intel_uncore.c:137:13: error: invalid storage class for function '__gen6_gt_force_wake_mt_put'
drivers/gpu/drm/i915/intel_uncore.c:146:12: error: invalid storage class for function '__gen6_gt_wait_for_fifo'
drivers/gpu/drm/i915/intel_uncore.c:166:13: error: invalid storage class for function 'vlv_force_wake_reset'
drivers/gpu/drm/i915/intel_uncore.c:174:13: error: invalid storage class for function 'vlv_force_wake_get'
drivers/gpu/drm/i915/intel_uncore.c:198:13: error: invalid storage class for function 'vlv_force_wake_put'
drivers/gpu/drm/i915/intel_uncore.c:208:13: error: invalid storage class for function '__gen8_gt_force_wake_mt_get'
drivers/gpu/drm/i915/intel_uncore.c:223:13: error: invalid storage class for function '__gen8_gt_force_wake_mt_put'
drivers/gpu/drm/i915/intel_uncore.c:230:13: error: invalid storage class for function 'null_wake'
drivers/gpu/drm/i915/intel_uncore.c:295:13: error: invalid storage class for function 'intel_uncore_forcewake_reset'
drivers/gpu/drm/i915/intel_uncore.c:353:1: error: invalid storage class for function 'ilk_dummy_write'
drivers/gpu/drm/i915/intel_uncore.c:362:1: error: invalid storage class for function 'hsw_unclaimed_reg_clear'
drivers/gpu/drm/i915/intel_uncore.c:373:1: error: invalid storage class for function 'hsw_unclaimed_reg_check'
drivers/gpu/drm/i915/intel_uncore.c:480:12: error: invalid storage class for function 'i8xx_do_reset'
drivers/gpu/drm/i915/intel_uncore.c:510:12: error: invalid storage class for function 'i965_reset_complete'
drivers/gpu/drm/i915/intel_uncore.c:517:12: error: invalid storage class for function 'i965_do_reset'
drivers/gpu/drm/i915/intel_uncore.c:545:12: error: invalid storage class for function 'ironlake_do_reset'
drivers/gpu/drm/i915/intel_uncore.c:567:12: error: invalid storage class for function 'gen6_do_reset'
drivers/gpu/drm/i915/intel_uncore.c:636:1: error: expected declaration or statement at end of input
security/integrity/ima/ima_dir.c:78:32: error: 'const struct file_operations' has no member named 'readdir'
security/integrity/ima/ima_dir.c:93:17: error: 'const struct file_operations' has no member named 'readdir'
security/integrity/ima/ima_dir.c:282:17: error: 'struct ima_digest_data' has no member named 'type'
security/integrity/ima/ima_dir.c:284:25: error: 'struct ima_digest_data' has no member named 'type'
drivers/gpu/drm/i915/intel_uncore.c:537:2: error: implicit declaration of function 'HAS_FORCE_WAKE' [-Werror=implicit-function-declaration]

[warnings]
drivers/target/mlx4_fc/mfc.c:866: warning: 'u64_to_wwpn' defined but not used
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344: warning: format '%016lx' expects type 'long unsigned int', but argument 2 has type 'u64'
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344: warning: format '%016lx' expects type 'long unsigned int', but argument 3 has type 'u64'
drivers/target/mlx4_fc/mfc.c:1405: warning: too few arguments for format
drivers/target/mlx4_fc/mfc_rfci.c:862: warning: too few arguments for format
WARNING: drivers/target/mlx4_fc/mlx4_fc.o(.init.text+0x8e): Section mismatch in reference from the function _mfc_init() to the function .exit.text:_mlx4_fc_deregister_configfs()
drivers/target/mlx4_fc/mfc_rfci.c:876:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/target/mlx4_fc/mlx4_fc_configfs.c:305:22: warning: unused variable 'tpg' [-Wunused-variable]
drivers/target/mlx4_fc/mfc_rfci.c:757:22: warning: unused variable 'tpg' [-Wunused-variable]
WARNING: vmlinux.o(.text+0x50d38d): Section mismatch in reference from the function acpi_thermal_add() to the variable .init.data:thermal_dmi_table
drivers/target/mlx4_fc/mfc_exch.c:136:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/target/mlx4_fc/mfc_rfci.c:825:2: warning: #warning FIXME: Fix tag leak [-Wcpp]
drivers/target/mlx4_fc/mfc_rfci.c:872:2: warning: #warning FIXME: Fix tag leak [-Wcpp]
drivers/target/mlx4_fc/mfc_rfci.c:825:2: warning: #warning FIXME: Fix tag leak [-Wcpp]
drivers/target/mlx4_fc/mfc_rfci.c:872:2: warning: #warning FIXME: Fix tag leak [-Wcpp]
drivers/target/mlx4_fc/mlx4_fc_fabric.c:195:2: warning: #warning FIXME: Fill in rest of *ts for RDMA_READ [-Wcpp]
drivers/target/mlx4_fc/mlx4_fc_fabric.c:230:2: warning: #warning FIXME: Fill in rest of *ts for RDMA_WRITE [-Wcpp]
drivers/target/mlx4_fc/mlx4_fc_fabric.c:235:2: warning: #warning FIXME: Fill in rest of *ts for SCSI response [-Wcpp]
drivers/target/mlx4_fc/mlx4_fc_fabric.c:250:2: warning: #warning FIXME: Fill in rest of *ts for SCSI response [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1738:19: warning: assignment makes pointer from integer without a cast [enabled by default]
kernel/rcu/tree.c:3374:10: warning: missing terminating " character [enabled by default]
drivers/gpu/drm/i915/intel_uncore.c:119:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
WARNING: drivers/target/built-in.o(.init.literal+0x398): Section mismatch in reference from the (unknown reference) (unknown) to the function .exit.text:mlx4_fc_deregister_configfs()

[sparse]
drivers/scsi/virtio_scsi.c:688:2: sparse: FIXME: Need to pass nr_hw_queues into scsi-mq
net/ipv6/ip6_vti.c:480:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] flowic_mark @@    got ed int [unsigned] [usertype] flowic_mark @@
net/ipv6/ip6_vti.c:827:30: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] i_key @@    got  [usertype] i_key @@
net/ipv6/ip6_vti.c:830:30: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] o_key @@    got  [usertype] o_key @@
net/ipv6/ip6_vti.c:900:49: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] value @@    got ed int [unsigned] [usertype] value @@
net/ipv6/ip6_vti.c:901:49: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] value @@    got ed int [unsigned] [usertype] value @@
net/ipv6/ip6_vti.c:177:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip6_tnl *<noident> @@    got struct ip6_tnl [nstruct ip6_tnl *<noident> @@
drivers/base/regmap/regmap.c:1472:48: sparse: too many arguments for function _regmap_raw_write
drivers/target/mlx4_fc/mfc_rfci.c:825:2: sparse: FIXME: Fix tag leak
drivers/target/mlx4_fc/mfc_rfci.c:872:2: sparse: FIXME: Fix tag leak
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc_rfci.c:834:23: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc_rfci.c:834:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] data_length @@    got restrunsigned int [unsigned] data_length @@
arch/x86/xen/mmu.c:795:19: sparse: context imbalance in 'xen_pte_lock' - wrong count at exit
drivers/target/mlx4_fc/mlx4_fc_fabric.c:195:2: sparse: FIXME: Fill in rest of *ts for RDMA_READ
drivers/target/mlx4_fc/mlx4_fc_fabric.c:230:2: sparse: FIXME: Fill in rest of *ts for RDMA_WRITE
drivers/target/mlx4_fc/mlx4_fc_fabric.c:235:2: sparse: FIXME: Fill in rest of *ts for SCSI response
drivers/target/mlx4_fc/mlx4_fc_fabric.c:250:2: sparse: FIXME: Fill in rest of *ts for SCSI response
kernel/rcu/tree.c:3375:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3376:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3377:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3378:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3379:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3380:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3381:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3382:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3383:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3384:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3385:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3386:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3387:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3388:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3389:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3390:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3391:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3392:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3393:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3394:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3395:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3396:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3397:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3398:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3399:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3400:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3401:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3402:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3403:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3404:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3405:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3406:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3407:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3408:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3409:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3410:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3411:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3412:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3413:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3414:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3415:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3416:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3417:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3418:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3419:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3420:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3421:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3422:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3423:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3424:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3425:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3426:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3427:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3428:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3429:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3430:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3431:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3432:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3433:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3434:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3435:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3436:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3437:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3438:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3439:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3440:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3441:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3442:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3443:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3444:0: sparse: Newline in string or character constant
kernel/rcu/tree.c:3444:0: sparse: End of file in middle of string
kernel/rcu/tree.c:3374:9: sparse: unterminated argument list invoking macro "pr_info"
net/ipv4/inet_connection_sock.c:679:44: sparse: cast to restricted __be16
net/ipv4/inet_connection_sock.c:679:44: sparse: cast to restricted __be16
net/ipv4/inet_connection_sock.c:679:44: sparse: cast to restricted __be16
net/ipv4/inet_connection_sock.c:679:44: sparse: cast to restricted __be16
net/ipv4/inet_connection_sock.c:680:44: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] inet_sport @@    got unsignedrestricted __be16 [usertype] inet_sport @@
net/ipv4/tcp_output.c:2737:20: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] source @@    got unsignedrestricted __be16 [usertype] source @@
include/net/tcp.h:1113:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] skc_num @@    got  short [unsigned] [usertype] skc_num @@
net/ipv4/syncookies.c:307:41: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] skc_num @@    got signed short [unsigned] [usertype] skc_num @@
include/net/tcp.h:1113:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] skc_num @@    got  short [unsigned] [usertype] skc_num @@
net/ipv6/tcp_ipv6.c:1738:20: sparse: cast to restricted __be16
net/ipv6/tcp_ipv6.c:1738:20: sparse: cast to restricted __be16
net/ipv6/tcp_ipv6.c:1738:20: sparse: cast to restricted __be16
net/ipv6/tcp_ipv6.c:1738:20: sparse: cast to restricted __be16
net/ipv6/inet6_connection_sock.c:86:24: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] sport @@    got unsignedrestricted __be16 [usertype] sport @@
net/ipv6/syncookies.c:197:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] skc_num @@    got signed short [unsigned] [usertype] skc_num @@
net/dccp/minisocks.c:270:43: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] skc_num @@    got  short [unsigned] [usertype] skc_num @@
net/dccp/output.c:427:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] dccph_sport @@    got unsignedrestricted __be16 [usertype] dccph_sport @@
net/dccp/ipv6.c:234:23: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [addressable] [assigned] [usertype] sport @@    got  [addressable] [assigned] [usertype] sport @@
net/dccp/ipv6.c:512:31: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [addressable] [assigned] [usertype] sport @@    got  [addressable] [assigned] [usertype] sport @@
builtin:0:0: sparse: Expected ; at end of statement
builtin:0:0: sparse: got end-of-input
builtin:0:0: sparse: Expected } at end of function
kernel/rcu/tree.c:3374:9: sparse: undefined identifier 'pr_info'

[coccinelle]
drivers/gpu/drm/drm_crtc.c:4455:16-23: WARNING opportunity for memdup_user
kernel/rcu/tree.c:712:9-10: WARNING: return of 0/1 in function 'rcu_lockdep_current_cpu_online' with return type bool
security/integrity/ima/ima_template.c:62:41-47: ERROR: application of sizeof to pointer
drivers/md/dm-integrity.c:835:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 837
drivers/md/dm-integrity.c:144:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 145
drivers/md/dm-integrity.c:152:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 153

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
