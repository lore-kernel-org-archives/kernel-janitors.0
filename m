From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 04 Aug 2013 16:49:44 +0000
Subject: build regressions 2013-08-04
Message-Id: <51fe8628.off+qwN3LYZuy6FJ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x82b8): undefined reference to `__compiletime_assert_1842'
swap.c:(.text+0x8260): undefined reference to `__compiletime_assert_1842'
kernel/sched/fair.c:1134:9: error: 'struct mm_struct' has no member named 'numa_next_reset'
kernel/sched/fair.c:1137:5: error: 'struct mm_struct' has no member named 'numa_next_reset'
kernel/sched/fair.c:1138:21: error: 'sysctl_numa_balancing_scan_period_reset' undeclared (first use in this function)
(.text+0x30aadd): undefined reference to `__divdi3'
(.text+0x30ac85): undefined reference to `__divdi3'
include/linux/mm.h:1842:2: error: call to '__compiletime_assert_1842' declared with attribute error: BUILD_BUG failed
mm/migrate.c:134:3: error: implicit declaration of function 'pmd_trans_huge' [-Werror=implicit-function-declaration]
mm/migrate.c:149:2: error: implicit declaration of function 'is_swap_pte' [-Werror=implicit-function-declaration]
mm/migrate.c:173:4: error: implicit declaration of function 'hugepage_add_anon_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:175:4: error: implicit declaration of function 'page_dup_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:177:3: error: implicit declaration of function 'page_add_anon_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:179:3: error: implicit declaration of function 'page_add_file_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:195:2: error: implicit declaration of function 'rmap_walk' [-Werror=implicit-function-declaration]
mm/migrate.c:479:2: error: implicit declaration of function 'ksm_migrate_page' [-Werror=implicit-function-declaration]
mm/migrate.c:778:3: error: implicit declaration of function 'page_get_anon_vma' [-Werror=implicit-function-declaration]
mm/migrate.c:847:3: error: implicit declaration of function 'put_anon_vma' [-Werror=implicit-function-declaration]
net/netfilter/xt_TPROXY.c:178:4: error: implicit declaration of function 'inet6_lookup_listener' [-Werror=implicit-function-declaration]
net/netfilter/xt_TPROXY.c:190:4: error: implicit declaration of function '__inet6_lookup_established' [-Werror=implicit-function-declaration]

[warnings]
drivers/regulator/max8660.c:393:3: warning: passing argument 3 of 'max8660_pdata_from_dt' from incompatible pointer type [enabled by default]
mm/migrate.c:778:12: warning: assignment makes pointer from integer without a cast [enabled by default]
mm/migrate.c:960:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/regulator/max8660.c:398:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
Warning(mm/filemap.c:1604): No description found for parameter 'thp'
net/netfilter/xt_TPROXY.c:178:7: warning: assignment makes pointer from integer without a cast [enabled by default]
net/netfilter/xt_TPROXY.c:190:7: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
fs/f2fs/data.c:781:27: sparse: incorrect type in initializer (incompatible argument 2 (different type sizes)) @@    expected void ( *invalidatepage )( ... ) @@    got void ( static [topvoid ( *invalidatepage )( ... ) @@
fs/f2fs/node.c:1233:27: sparse: incorrect type in initializer (incompatible argument 2 (different type sizes)) @@    expected void ( *invalidatepage )( ... ) @@    got void ( static [topvoid ( *invalidatepage )( ... ) @@
fs/f2fs/acl.c:341:36: sparse: incorrect type in argument 1 (different base types) @@    expected struct user_namespace *user_ns @@    got structstruct user_namespace *user_ns @@
fs/f2fs/acl.c:341:49: sparse: incorrect type in argument 3 (different base types) @@    expected void *buffer @@    got unsigned long [unsigned] [uservoid *buffer @@
fs/f2fs/acl.c:341:35: sparse: not enough arguments for function posix_acl_to_xattr
fs/f2fs/acl.c:363:43: sparse: not enough arguments for function posix_acl_from_xattr
drivers/net/bonding/bond_main.c:1041:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *curr_active_slave @@    got struct slave [nodstruct slave *curr_active_slave @@
drivers/net/bonding/bond_main.c:1755:25: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *curr_active_slave @@    got struct slave [nodstruct slave *curr_active_slave @@
drivers/net/bonding/bond_main.c:1955:17: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *curr_active_slave @@    got void [nodstruct slave *curr_active_slave @@
drivers/net/bonding/bond_main.c:3853:25: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/bonding/bond_main.c:3875:17: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/bonding/bond_alb.c:1668:9: sparse: incorrect type in assignment (different address spaces) @@    expected struct slave *curr_active_slave @@    got struct slave [nodstruct slave *curr_active_slave @@
drivers/net/bonding/bond_sysfs.c:1251:16: sparse: incompatible types in comparison expression (different address spaces)
mm/huge_memory.c:1496:28: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
drivers/regulator/max8660.c:393:60: sparse: incorrect type in argument 3 (different base types) @@    expected struct max8660_platform_data **pdata @@    got truct max8660_platform_data **pdata @@
kernel/trace/trace.c:246:9: sparse: symbol 'buffer_ftrace_now' was not declared. Should it be static?
mm/vmscan.c:3581:35: sparse: Using plain integer as NULL pointer
fs/hugetlbfs/inode.c:130:36: sparse: implicit cast to nocast type
mm/fremap.c:235:33: sparse: implicit cast from nocast type
mm/madvise.c:101:30: sparse: constant 0x100000000 is so big it is long
mm/madvise.c:105:25: sparse: constant 0x100000000 is so big it is long
mm/madvise.c:109:31: sparse: constant 0x100000000 is so big it is long
mm/memory.c:3231:37: sparse: constant 0x100000000 is so big it is long
mm/memory.c:3261:29: sparse: constant 0x100000000 is so big it is long
mm/memory.c:795:48: sparse: implicit cast to nocast type
mm/memory.c:858:52: sparse: implicit cast to nocast type
mm/memory.c:876:28: sparse: implicit cast to nocast type
mm/memory.c:1065:36: sparse: implicit cast to nocast type
mm/memory.c:2214:9: sparse: implicit cast to nocast type
mm/memory.c:2357:31: sparse: implicit cast to nocast type
mm/mlock.c:289:50: sparse: implicit cast from nocast type
mm/mlock.c:324:33: sparse: implicit cast from nocast type
mm/mmap.c:1446:13: sparse: implicit cast from nocast type
mm/mmap.c:1524:53: sparse: implicit cast from nocast type
mm/mmap.c:1542:25: sparse: implicit cast from nocast type
mm/mmap.c:1543:46: sparse: implicit cast from nocast type
mm/mmap.c:1607:29: sparse: implicit cast from nocast type
mm/huge_memory.c:732:37: sparse: constant 0x100000000 is so big it is long
mm/huge_memory.c:817:53: sparse: constant 0x100000000 is so big it is long
ipc/shm.c:518:53: sparse: implicit cast from nocast type
mm/swapfile.c:681:35: sparse: context imbalance in 'swp_entry_swapcount' - unexpected unlock
mm/fremap.c:434:7: sparse: symbol 'mm_alloc_pmd' was not declared. Should it be static?
mm/fremap.c:513:1: sparse: symbol 'SyS_remap_anon_pages' was not declared. Should it be static?
mm/fremap.c:276:9: sparse: context imbalance in 'double_pt_lock' - different lock contexts for basic block
mm/fremap.c:286:9: sparse: context imbalance in 'double_pt_unlock' - different lock contexts for basic block
mm/fremap.c:588:44: sparse: context imbalance in 'SyS_remap_anon_pages' - unexpected unlock
mm/huge_memory.c:1522:28: sparse: context imbalance in 'remap_anon_pages_huge_pmd' - unexpected unlock
kernel/cgroup_freezer.c:115:12: sparse: context imbalance in 'freezer_css_online' - different lock contexts for basic block
kernel/cgroup.c:2804:13: sparse: context imbalance in 'cgroup_cfts_prepare' - wrong count at exit
kernel/cgroup.c:2816:12: sparse: context imbalance in 'cgroup_cfts_commit' - wrong count at exit
fs/exec.c:1399:17: sparse: context imbalance in 'search_binary_handler' - different lock contexts for basic block
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:221:24: sparse: symbol 'lmv_proc_target_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:230:6: sparse: symbol 'lprocfs_lmv_init_vars' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/../include/obd_lov.h:56:25: sparse: Initializer entry defined twice
drivers/staging/lustre/lustre/lov/lov_dev.c:63:22: sparse: symbol 'lov_caches' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_object.c:934:22: sparse: symbol 'lov_lsm_get' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_object.c:950:6: sparse: symbol 'lov_lsm_put' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_object.c:957:5: sparse: symbol 'lov_read_and_clear_async_rc' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/console.c:1968:1: sparse: symbol 'lstcon_console_init' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/console.c:2038:1: sparse: symbol 'lstcon_console_fini' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/conctl.c:818:1: sparse: symbol 'lstcon_ioctl_entry' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/timer.c:68:3: sparse: symbol 'stt_data' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:213:23: sparse: symbol 'ping_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:214:6: sparse: symbol 'ping_init_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:222:16: sparse: symbol 'ping_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:223:6: sparse: symbol 'ping_init_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:481:23: sparse: symbol 'brw_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:482:6: sparse: symbol 'brw_init_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:490:16: sparse: symbol 'brw_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:491:6: sparse: symbol 'brw_init_test_service' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:263:5: sparse: symbol 'mdc_getattr_name' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:918:5: sparse: symbol 'mdc_done_writing' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:986:5: sparse: symbol 'mdc_readpage' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/lproc_mdc.c:213:6: sparse: symbol 'lprocfs_mdc_init_vars' was not declared. Should it be static?
drivers/staging/lustre/lustre/mgc/mgc_request.c:1828:16: sparse: symbol 'mgc_obd_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/mgc/mgc_request.c:1848:12: sparse: symbol 'mgc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:214:19: sparse: symbol 'obd_psdev' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:386:5: sparse: symbol 'class_procfs_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:408:5: sparse: symbol 'class_procfs_clean' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-sysctl.c:428:6: sparse: symbol 'obd_sysctl_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-sysctl.c:436:6: sparse: symbol 'obd_sysctl_clean' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/llog.c:78:6: sparse: symbol 'llog_free_handle' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/llog_cat.c:769:5: sparse: symbol 'cat_cancel_cb' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:53:18: sparse: symbol 'obd_types' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:56:7: sparse: symbol 'obd_max_pages' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:57:7: sparse: symbol 'obd_max_alloc' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/genops.c:48:12: sparse: symbol 'obd_types_lock' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c:207:5: sparse: symbol 'lprocfs_wr_uint' redeclared with different type (originally declared at drivers/staging/lustre/lustre/obdclass/../include/lprocfs_status.h:606) - incompatible argument 2 (different address spaces)
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c:241:5: sparse: symbol 'lprocfs_wr_atomic' redeclared with different type (originally declared at drivers/staging/lustre/lustre/obdclass/../include/lprocfs_status.h:603) - incompatible argument 2 (different address spaces)
drivers/staging/lustre/lustre/obdclass/local_storage.c:665:5: sparse: symbol 'lastid_compat_check' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obdo.c:160:5: sparse: symbol 'obdo_cmp_md' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_config.c:966:6: sparse: symbol 'lustre_register_client_process_config' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_config.c:1045:6: sparse: symbol 'lustre_register_quota_process_config' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:817:5: sparse: symbol 'lustre_check_exclusion' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:1319:5: sparse: symbol 'lustre_register_fs' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:1324:5: sparse: symbol 'lustre_unregister_fs' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lu_object.c:1686:7: sparse: symbol 'lu_context_tags_default' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lu_object.c:1687:7: sparse: symbol 'lu_session_tags_default' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:390:17: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/obdclass/cl_page.c:832:6: sparse: symbol 'cl_page_disown0' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:1599:6: sparse: symbol 'cl_page_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:1604:6: sparse: symbol 'cl_page_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_lock.c:2296:5: sparse: symbol 'cl_lock_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_lock.c:2301:6: sparse: symbol 'cl_lock_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_request.c:2431:6: sparse: symbol 'osc_update_enqueue' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_request.c:3672:12: sparse: symbol 'osc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_dev.c:60:22: sparse: symbol 'osc_caches' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_dev.c:101:23: sparse: symbol 'osc_ast_guard_class' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:342:5: sparse: symbol 'ldlm_lock_destroy_internal' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:437:27: sparse: symbol 'lock_handle_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:690:6: sparse: symbol 'ldlm_add_bl_work_item' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:711:6: sparse: symbol 'ldlm_add_cp_work_item' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:2102:5: sparse: symbol 'ldlm_cancel_locks_for_export_cb' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:49:19: sparse: symbol 'ldlm_resource_slab' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:49:40: sparse: symbol 'ldlm_lock_slab' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:66:18: sparse: symbol 'ldlm_ns_proc_dir' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:73:14: sparse: symbol 'ldlm_dump_granted_max' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:83:1: sparse: symbol 'ldlm_dump_ns_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:85:1: sparse: symbol 'ldlm_rw_uint_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:86:1: sparse: symbol 'ldlm_uint_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:171:1: sparse: symbol 'lprocfs_ns_resources_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:182:1: sparse: symbol 'lprocfs_ns_locks_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:280:1: sparse: symbol 'lprocfs_lru_size_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:307:1: sparse: symbol 'lprocfs_elc_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:309:6: sparse: symbol 'ldlm_namespace_proc_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:329:5: sparse: symbol 'ldlm_namespace_proc_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:482:16: sparse: symbol 'ldlm_ns_hash_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:493:16: sparse: symbol 'ldlm_ns_fid_hash_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:514:20: sparse: symbol 'ldlm_ns_hash_defs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:962:5: sparse: symbol 'ldlm_namespace_get_return' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lib.c:653:5: sparse: symbol 'target_send_reply_msg' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_request.c:75:14: sparse: symbol 'ldlm_cancel_unused_locks_before_replay' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:552:22: sparse: symbol 'ldlm_srv_pool_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:558:22: sparse: symbol 'ldlm_cli_pool_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:683:1: sparse: symbol 'lprocfs_pool_state_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:699:1: sparse: symbol 'lprocfs_grant_plan_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:702:1: sparse: symbol 'lprocfs_wr_recalc_period' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:710:1: sparse: symbol 'lprocfs_recalc_period_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:712:1: sparse: symbol 'ldlm_pool_u64_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:713:1: sparse: symbol 'ldlm_pool_atomic_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:714:1: sparse: symbol 'ldlm_pool_rw_atomic_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:716:1: sparse: symbol 'lprocfs_grant_speed_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:281:27: sparse: symbol 'lustre_get_emerg_rs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:317:6: sparse: symbol 'lustre_put_emerg_rs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:651:5: sparse: symbol 'lustre_unpack_req_ptlrpc_body' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:663:5: sparse: symbol 'lustre_unpack_rep_ptlrpc_body' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/service.c:68:1: sparse: symbol 'ptlrpc_all_services' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pinger.c:50:14: sparse: symbol 'pinger_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c:88:14: sparse: symbol 'ptlrpcd_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/wiretest.c:48:6: sparse: symbol 'lustre_assert_wire_constants' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_gc.c:217:5: sparse: symbol 'sptlrpc_gc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_gc.c:241:6: sparse: symbol 'sptlrpc_gc_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_null.c:444:5: sparse: symbol 'sptlrpc_null_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_null.c:457:6: sparse: symbol 'sptlrpc_null_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_plain.c:999:5: sparse: symbol 'sptlrpc_plain_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_plain.c:1014:6: sparse: symbol 'sptlrpc_plain_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/nrs.c:57:17: sparse: symbol 'nrs_core' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c:260:28: sparse: symbol 'nrs_conf_fifo' was not declared. Should it be static?
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:3022:1: sparse: symbol 'kiblnd_check_conns' was not declared. Should it be static?
drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c:186:1: sparse: symbol 'ksocknal_transmit' was not declared. Should it be static?
drivers/staging/gdm724x/gdm_lte.c:113:5: sparse: symbol 'gdm_lte_emulate_arp' was not declared. Should it be static?
drivers/staging/lustre/lnet/lnet/lib-ptl.c:42:9: sparse: symbol 'portal_rotor' was not declared. Should it be static?
drivers/staging/lustre/lnet/lnet/router.c:784:1: sparse: symbol 'lnet_update_ni_status_locked' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c:561:5: sparse: symbol 'insert_proc' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c:570:6: sparse: symbol 'remove_proc' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-module.c:179:19: sparse: symbol 'libcfs_dev' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-adler.c:134:5: sparse: symbol 'cfs_crypto_adler32_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-adler.c:140:6: sparse: symbol 'cfs_crypto_adler32_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/debug.c:60:14: sparse: symbol 'libcfs_debug_mb' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/debug.c:96:14: sparse: symbol 'portal_enter_debugger' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/nidstrings.c:63:6: sparse: symbol 'libcfs_init_nidstrings' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/module.c:354:22: sparse: symbol 'libcfs_psdev_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/tracefile.c:55:14: sparse: symbol 'cfs_trace_thread_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/hash.c:119:21: sparse: symbol 'cfs_sched_rehash' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c:52:21: sparse: symbol 'cfs_tracefile_sem' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:65:6: sparse: symbol 'lnet_upcall' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:66:6: sparse: symbol 'lnet_debug_log_upcall' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:157:6: sparse: symbol 'lbug_with_loc' redeclared with different type (originally declared at drivers/staging/lustre/include//linux/libcfs/libcfs_private.h:88) - different modifiers
drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c:240:1: sparse: symbol 'libcfs_arch_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c:246:1: sparse: symbol 'libcfs_arch_cleanup' was not declared. Should it be static?

[coccinelle]
drivers/net/wireless/ath/ath10k/mac.c:2962:1-7: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
