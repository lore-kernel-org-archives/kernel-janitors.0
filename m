From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 04 Feb 2013 18:46:17 +0000
Subject: build regressions 2013-02-04
Message-Id: <511001f9.2RMdolGP45xLHSGA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/frv/kernel/setup.c:187:47: error: expected '=', ',', ';', 'asm' or '__attribute__' before '*' token
arch/frv/kernel/setup.c:386:2: error: 'clock_cmodes' undeclared (first use in this function)
arch/frv/kernel/setup.c:571:6: error: 'clock_cmodes' undeclared (first use in this function)
drivers/mfd/intel_msic.c:428:2: error: implicit declaration of function 'devm_ioremap_resource' [-Werror=implicit-function-declaration]
drivers/mfd/sec-core.c:178:3: error: implicit declaration of function 'sec_pmic_i2c_parse_dt_pdata' [-Werror=implicit-function-declaration]
ERROR: "regmap_async_complete_cb" [drivers/base/regmap/regmap-spi.ko] undefined!
drivers/staging/dgrp/dgrp_mon_ops.c:304:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:1284:4: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2267:2: error: implicit declaration of function 'put_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2283:2: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2283:20: error: 'VERIFY_READ' undeclared (first use in this function)
drivers/staging/dgrp/dgrp_tty.c:2287:2: error: implicit declaration of function 'get_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2474:2: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
drivers/staging/dgrp/dgrp_tty.c:2618:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
drivers/staging/dgrp/dgrp_specproc.c:469:2: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]
arch/mips/kernel/signal.c:262:16: error: conflicting types for 'sys_rt_sigsuspend'
drivers/vhost/tcm_vhost.c:595:17: error: 'struct vhost_virtqueue' has no member named 'num'
arch/sparc/kernel/sys_sparc32.c:255:1: error: conflicting types for 'C_SYSC_rt_sigaction'
arch/sparc/kernel/sys_sparc32.c:269:9: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:269:9: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:269:9: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:271:39: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:273:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:273:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:273:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:274:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:274:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:274:10: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:284:9: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:284:9: error: dereferencing pointer to incomplete type
arch/sparc/kernel/sys_sparc32.c:284:9: error: dereferencing pointer to incomplete type
arch/x86/kernel/cpu/common.c:1227:2: error: implicit declaration of function 'load_ucode_ap' [-Werror=implicit-function-declaration]
make[2]: *** No rule to make target `kernel/sched.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/base/sys.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `include/linux/gen_stats.h', needed by `Documentation/DocBook/networking.xml'.
drivers/target/iscsi/iscsi_target.c:782:12: error: conflicting types for 'iscsit_handle_scsi_cmd'
drivers/target/iscsi/iscsi_target.c:1407:12: error: conflicting types for 'iscsit_handle_nop_out'
drivers/target/iscsi/iscsi_target.c:2094:12: error: conflicting types for 'iscsit_handle_logout_cmd'
arch/x86/mm/init_64.c:913:3: error: implicit declaration of function 'map_low_page' [-Werror=implicit-function-declaration]
arch/x86/mm/init_64.c:916:3: error: implicit declaration of function 'unmap_low_page' [-Werror=implicit-function-declaration]
drivers/block/drbd/drbd_receiver.c:4057:10: error: 'mdev' undeclared (first use in this function)
microcode_intel.c:(.text+0x27cba): undefined reference to `microcode_sanity_check'
microcode_intel.c:(.text+0x27cd4): undefined reference to `get_matching_microcode'
(.text+0x27fe7): undefined reference to `get_matching_microcode'
ERROR: "get_matching_microcode" [arch/x86/kernel/microcode.ko] undefined!
ERROR: "microcode_sanity_check" [arch/x86/kernel/microcode.ko] undefined!
/c/kernel-tests/src/x86/include/linux/signal.h:261:2: error: unknown type name '__sigrestore_t'
/c/kernel-tests/src/blackfin/include/linux/signal.h:261:2: error: unknown type name '__sigrestore_t'

[warnings]
drivers/mfd/intel_msic.c:428:17: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mfd/sec-core.c:178:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/gpu/drm/nouveau/core/subdev/therm/ic.c:116:1: warning: the frame size of 1028 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/target/iscsi/iscsi_target_login.c:1073:2: warning: #warning FIXME: iscsi_login_init_conn failure OOPs............ [-Wcpp]
drivers/target/iscsi/iscsi_target_login.c:1022:22: warning: unused variable 'sock_in6' [-Wunused-variable]
drivers/target/iscsi/iscsi_target_login.c:1021:21: warning: unused variable 'sock_in' [-Wunused-variable]
drivers/target/iscsi/iscsi_target_login.c:1019:14: warning: unused variable 'iov' [-Wunused-variable]
drivers/target/iscsi/iscsi_target_login.c:1015:6: warning: unused variable 'err' [-Wunused-variable]
drivers/target/iscsi/iscsi_target_login.c:1014:14: warning: unused variable 'iscsi_opcode' [-Wunused-variable]
drivers/target/iscsi/iscsi_target_util.c:1420:2: warning: #warning FIXME: conn->sock access in iscsit_collect_login_stats [-Wcpp]
drivers/target/iscsi/iscsi_target_login.c:641:2: warning: #warning FIXME: iscsit_start_nopin_timer disabled [-Wcpp]
drivers/target/iscsi/iscsi_target_login.c:640:24: warning: unused variable 'sess' [-Wunused-variable]
arch/x86/mm/init_64.c:913:14: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/mm/init_64.c:970:14: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
arch/x86/mm/init_64.c:996:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

[sparse]
drivers/xen/xen-pciback/pci_stub.c:547:21: sparse: incorrect type in assignment (different base types)
drivers/xen/xen-pciback/pci_stub.c:586:37: sparse: incorrect type in assignment (different base types)
drivers/xen/xen-pciback/pci_stub.c:599:16: sparse: cast to restricted pci_ers_result_t
drivers/xen/xen-pciback/pci_stub.c:644:40: sparse: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/pci_stub.c:702:40: sparse: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/pci_stub.c:815:31: sparse: incorrect type in argument 2 (different base types)
drivers/xen/xen-pciback/conf_space_capability.c:124:22: sparse: cast to restricted pci_power_t
drivers/xen/xen-pciback/conf_space_capability.c:125:22: sparse: cast to restricted pci_power_t
drivers/mfd/abx500-core.c:159:38: sparse: Using plain integer as NULL pointer
drivers/edac/amd64_edac.c:37:3: sparse: symbol 'scrubrates' was not declared. Should it be static?
fs/quota/compat.c:43:17: sparse: symbol 'sys32_quotactl' was not declared. Should it be static?
drivers/block/xen-blkback/common.h:141:39: sparse: Expected } at end of struct-union-enum-specifier
drivers/block/xen-blkback/common.h:141:39: sparse: got 1
drivers/block/xen-blkback/common.h:142:1: sparse: Expected ; at the end of type declaration
drivers/block/xen-blkback/blkback.c:788:52: sparse: Expected member name
drivers/block/xen-blkback/blkback.c:788:52: sparse: Expected ) in expression
drivers/block/xen-blkback/blkback.c:788:52: sparse: got 1
drivers/block/xen-blkback/xenbus.c:157:17: sparse: Expected member name
drivers/block/xen-blkback/xenbus.c:157:17: sparse: Expected ) in expression
drivers/block/xen-blkback/xenbus.c:157:17: sparse: got 1
arch/x86/pci/numachip.c:111:12: sparse: symbol 'pci_numachip_init' was not declared. Should it be static?
drivers/base/memory.c:106:22: sparse: symbol 'memory_block_size_bytes' was not declared. Should it be static?
drivers/gpu/drm/r128/r128_ioc32.c:196:6: sparse: symbol 'r128_compat_ioctl' was not declared. Should it be static?
arch/x86/lib/insn.c:53:58: sparse: Expected ) in function declarator
arch/x86/lib/insn.c:53:58: sparse: got 1
arch/x86/lib/insn.c:56:13: sparse: Expected ; at end of declaration
arch/x86/lib/insn.c:63:17: sparse: got insn
arch/x86/lib/insn.c:64:1: sparse: Expected ; at the end of type declaration
arch/x86/lib/insn.c:88:37: sparse: got (
arch/x86/lib/insn.c:128:21: sparse: Expected ) in nested declarator
drivers/xen/events.c:1188:13: sparse: symbol 'xen_debug_interrupt' was not declared. Should it be static?
drivers/xen/events.c:1785:6: sparse: symbol 'xen_callback_vector' was not declared. Should it be static?
arch/x86/kernel/apic/apic_flat_64.c:46:6: sparse: symbol 'flat_init_apic_ldr' was not declared. Should it be static?
arch/x86/kernel/apic/x2apic_uv_x.c:55:5: sparse: symbol 'uv_min_hub_revision_id' was not declared. Should it be static?
arch/x86/kernel/apic/x2apic_cluster.c:13:8: sparse: symbol 'x86_cpu_to_logical_apicid' was not declared. Should it be static?
arch/x86/kernel/apic/x2apic_cluster.c:15:8: sparse: symbol 'ipi_mask' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:65:11: sparse: symbol 'camellia_sp10011110' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:154:11: sparse: symbol 'camellia_sp22000222' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:243:11: sparse: symbol 'camellia_sp03303033' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:332:11: sparse: symbol 'camellia_sp00444404' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:421:11: sparse: symbol 'camellia_sp02220222' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:510:11: sparse: symbol 'camellia_sp30333033' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:599:11: sparse: symbol 'camellia_sp44044404' was not declared. Should it be static?
arch/x86/crypto/camellia_glue.c:688:11: sparse: symbol 'camellia_sp11101110' was not declared. Should it be static?
arch/x86/ia32/nosyscall.c:4:6: sparse: symbol 'compat_ni_syscall' was not declared. Should it be static?
arch/x86/ia32/audit.c:3:10: sparse: symbol 'ia32_dir_class' was not declared. Should it be static?
arch/x86/ia32/audit.c:8:10: sparse: symbol 'ia32_chattr_class' was not declared. Should it be static?
arch/x86/ia32/audit.c:13:10: sparse: symbol 'ia32_write_class' was not declared. Should it be static?
arch/x86/ia32/audit.c:18:10: sparse: symbol 'ia32_read_class' was not declared. Should it be static?
arch/x86/ia32/audit.c:23:10: sparse: symbol 'ia32_signal_class' was not declared. Should it be static?
arch/x86/ia32/audit.c:28:5: sparse: symbol 'ia32_classify_syscall' was not declared. Should it be static?
arch/x86/kernel/amd_gart_64.c:88:15: sparse: symbol 'agp_memory_reserved' was not declared. Should it be static?
arch/x86/kernel/amd_gart_64.c:89:17: sparse: symbol 'agp_gatt_table' was not declared. Should it be static?
arch/x86/kernel/kprobes.c:335:26: sparse: no member 'kaddr' in struct insn
arch/x86/kernel/kprobes-opt.c:224:37: sparse: no member 'next_byte' in struct insn
arch/x86/kernel/kprobes-opt.c:267:21: sparse: no member 'kaddr' in struct insn
arch/x86/vdso/vclock_gettime.c:236:13: sparse: symbol '__vdso_clock_gettime' was not declared. Should it be static?
arch/x86/vdso/vclock_gettime.c:260:13: sparse: symbol '__vdso_gettimeofday' was not declared. Should it be static?
arch/x86/vdso/vclock_gettime.c:288:16: sparse: symbol '__vdso_time' was not declared. Should it be static?
arch/x86/vdso/vgetcpu.c:16:1: sparse: symbol '__vdso_getcpu' was not declared. Should it be static?
arch/x86/xen/irq.c:20:6: sparse: symbol 'xen_force_evtchn_callback' was not declared. Should it be static?
arch/x86/xen/time.c:34:8: sparse: symbol 'xen_runstate' was not declared. Should it be static?
arch/x86/xen/smp.c:42:8: sparse: symbol 'xen_resched_irq' was not declared. Should it be static?
arch/x86/xen/smp.c:534:6: sparse: symbol 'xen_send_IPI_mask' was not declared. Should it be static?
arch/x86/xen/smp.c:543:6: sparse: symbol 'xen_send_IPI_all' was not declared. Should it be static?
arch/x86/xen/smp.c:551:6: sparse: symbol 'xen_send_IPI_self' was not declared. Should it be static?
arch/x86/xen/smp.c:559:6: sparse: symbol 'xen_send_IPI_mask_allbutself' was not declared. Should it be static?
arch/x86/xen/smp.c:576:6: sparse: symbol 'xen_send_IPI_allbutself' was not declared. Should it be static?
kernel/context_tracking.c:21:8: sparse: symbol 'context_tracking' was not declared. Should it be static?
arch/x86/platform/uv/tlb_uv.c:120:8: sparse: symbol 'ptcstats' was not declared. Should it be static?
arch/x86/platform/uv/tlb_uv.c:1219:6: sparse: symbol 'uv_bau_message_interrupt' was not declared. Should it be static?
drivers/misc/sgi-xp/xp_main.c:68:25: sparse: symbol 'xpc_registrations' was not declared. Should it be static?
drivers/iommu/intel_irq_remapping.c:49:5: sparse: symbol 'get_irte' was not declared. Should it be static?

[smatch]
arch/x86/kernel/microcode_intel_early.c:110 load_microcode() warn: 'mc_saved_tmp' puts 512 bytes on stack
arch/x86/kernel/microcode_intel_early.c:320 get_matching_model_microcode() warn: 'mc_saved_tmp' puts 512 bytes on stack
arch/x86/kernel/microcode_intel_early.c:499 save_mc_for_early() warn: 'mc_saved_tmp' puts 512 bytes on stack
arch/x86/kernel/microcode_intel_early.c:704 save_microcode_in_initrd() warn: 'mc_saved' puts 512 bytes on stack

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
