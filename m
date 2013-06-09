From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 09 Jun 2013 23:13:54 +0000
Subject: build regressions 2013-06-09
Message-Id: <51b50c32.lFRbQaPKDwcxFW3t%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[sparse]
drivers/scsi/pm8001/pm80xx_hwi.c:627:27: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:629:27: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:751:33: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:2049:63: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3179:46: sparse: incorrect type in argument 1 (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3358:35: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3472:47: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3473:48: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3477:47: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3478:48: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm80xx_hwi.c:3488:41: sparse: incorrect type in assignment (different base types)
drivers/scsi/pm8001/pm8001_hwi.c:1820:36: sparse: invalid assignment: |drivers/scsi/pm8001/pm80xx_hwi.c:1144:40: sparse: invalid assignment: |drivers/scsi/pm8001/pm80xx_hwi.c:674:26: sparse: restricted __le32 degrades to integer
drivers/acpi/processor_idle.c:217:5: sparse: symbol 'acpi_processor_suspend' was not declared. Should it be static?
drivers/acpi/processor_idle.c:223:6: sparse: symbol 'acpi_processor_resume' was not declared. Should it be static?
drivers/net/macvlan.c:232:24: sparse: incompatible types in comparison expression (different address spaces)
drivers/net/usb/rtl8150.c:196:22: sparse: incorrect type in assignment (different base types)
drivers/rapidio/rio-scan.c:1143:5: sparse: symbol 'rio_enum_mport' was not declared. Should it be static?
drivers/rapidio/rio-scan.c:1246:5: sparse: symbol 'rio_disc_mport' was not declared. Should it be static?
drivers/dma/acpi-dma.c:76:21: sparse: cast to restricted __le32
net/ipv4/ping.c:286:5: sparse: symbol 'ping_check_bind_addr' was not declared. Should it be static?
net/ipv4/ping.c:355:6: sparse: symbol 'ping_set_saddr' was not declared. Should it be static?
net/ipv4/ping.c:370:6: sparse: symbol 'ping_clear_saddr' was not declared. Should it be static?
net/ipv6/icmp.c:99:47: sparse: incorrect type in argument 3 (different base types)
net/ipv6/ping.c:60:5: sparse: symbol 'dummy_ipv6_recv_error' was not declared. Should it be static?
net/ipv6/ping.c:64:5: sparse: symbol 'dummy_ip6_datagram_recv_ctl' was not declared. Should it be static?
net/ipv6/ping.c:69:5: sparse: symbol 'dummy_icmpv6_err_convert' was not declared. Should it be static?
net/ipv6/ping.c:73:6: sparse: symbol 'dummy_ipv6_icmp_error' was not declared. Should it be static?
net/ipv6/ping.c:75:5: sparse: symbol 'dummy_ipv6_chk_addr' was not declared. Should it be static?
net/ipv6/ping.c:201:5: sparse: symbol 'ping_v6_seq_show' was not declared. Should it be static?
kernel/sched/proc.c:505:15: sparse: symbol 'get_rq_runnable_load' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_request.c:2429:6: sparse: symbol 'osc_update_enqueue' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_request.c:3670:12: sparse: symbol 'osc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_dev.c:60:22: sparse: symbol 'osc_caches' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_dev.c:101:23: sparse: symbol 'osc_ast_guard_class' was not declared. Should it be static?
drivers/staging/lustre/lustre/osc/osc_cl_internal.h:493:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/osc/osc_object.c:62:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/osc/osc_page.c:224:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/osc/osc_lock.c:192:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/osc/osc_io.c:58:9: sparse: expression using sizeof bool
kernel/time/timekeeping_debug.c:68:6: sparse: symbol 'tk_debug_account_sleep_time' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:342:5: sparse: symbol 'ldlm_lock_destroy_internal' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:437:27: sparse: symbol 'lock_handle_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:690:6: sparse: symbol 'ldlm_add_bl_work_item' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:711:6: sparse: symbol 'ldlm_add_cp_work_item' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lock.c:2104:5: sparse: symbol 'ldlm_cancel_locks_for_export_cb' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:49:19: sparse: symbol 'ldlm_resource_slab' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:49:40: sparse: symbol 'ldlm_lock_slab' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:61:18: sparse: symbol 'ldlm_ns_proc_dir' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:68:14: sparse: symbol 'ldlm_dump_granted_max' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:78:1: sparse: symbol 'ldlm_dump_ns_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:80:1: sparse: symbol 'ldlm_rw_uint_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:81:1: sparse: symbol 'ldlm_uint_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:166:1: sparse: symbol 'lprocfs_ns_resources_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:177:1: sparse: symbol 'lprocfs_ns_locks_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:275:1: sparse: symbol 'lprocfs_lru_size_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:302:1: sparse: symbol 'lprocfs_elc_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:304:6: sparse: symbol 'ldlm_namespace_proc_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:324:5: sparse: symbol 'ldlm_namespace_proc_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:477:16: sparse: symbol 'ldlm_ns_hash_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:488:16: sparse: symbol 'ldlm_ns_fid_hash_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_resource.c:509:20: sparse: symbol 'ldlm_ns_hash_defs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_lib.c:653:5: sparse: symbol 'target_send_reply_msg' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_request.c:75:14: sparse: symbol 'ldlm_cancel_unused_locks_before_replay' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:556:22: sparse: symbol 'ldlm_srv_pool_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:562:22: sparse: symbol 'ldlm_cli_pool_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:687:1: sparse: symbol 'lprocfs_pool_state_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:703:1: sparse: symbol 'lprocfs_grant_plan_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:706:1: sparse: symbol 'lprocfs_wr_recalc_period' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:714:1: sparse: symbol 'lprocfs_recalc_period_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:716:1: sparse: symbol 'ldlm_pool_u64_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:717:1: sparse: symbol 'ldlm_pool_atomic_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:718:1: sparse: symbol 'ldlm_pool_rw_atomic_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/../../lustre/ldlm/ldlm_pool.c:720:1: sparse: symbol 'lprocfs_grant_speed_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:281:27: sparse: symbol 'lustre_get_emerg_rs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:317:6: sparse: symbol 'lustre_put_emerg_rs' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:648:5: sparse: symbol 'lustre_unpack_req_ptlrpc_body' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pack_generic.c:660:5: sparse: symbol 'lustre_unpack_rep_ptlrpc_body' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/service.c:68:1: sparse: symbol 'ptlrpc_all_services' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/pinger.c:50:14: sparse: symbol 'pinger_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c:88:14: sparse: symbol 'ptlrpcd_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/ptlrpcd.c:398:25: sparse: undefined identifier 'set_cpus_allowed'
drivers/staging/lustre/lustre/ptlrpc/wiretest.c:48:6: sparse: symbol 'lustre_assert_wire_constants' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_gc.c:217:5: sparse: symbol 'sptlrpc_gc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_gc.c:241:6: sparse: symbol 'sptlrpc_gc_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_null.c:444:5: sparse: symbol 'sptlrpc_null_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_null.c:457:6: sparse: symbol 'sptlrpc_null_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_plain.c:999:5: sparse: symbol 'sptlrpc_plain_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/sec_plain.c:1014:6: sparse: symbol 'sptlrpc_plain_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/nrs.c:57:17: sparse: symbol 'nrs_core' was not declared. Should it be static?
drivers/staging/lustre/lustre/ptlrpc/nrs_fifo.c:260:28: sparse: symbol 'nrs_conf_fifo' was not declared. Should it be static?
net/netfilter/core.c:33:32: sparse: symbol 'nf_ipv6_ops' was not declared. Should it be static?
drivers/net/wireless/rtlwifi/rtl8192cu/hw.c:2212:6: sparse: symbol 'rtl92cu_update_hal_rate_tbl' was not declared. Should it be static?
drivers/net/ethernet/emulex/benet/be_main.c:475:6: sparse: symbol 'populate_erx_stats' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:156:1: sparse: symbol 'dev_attr_beiscsi_fw_ver' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:157:1: sparse: symbol 'dev_attr_beiscsi_active_cid_count' was not declared. Should it be static?
drivers/staging/lustre/lnet/klnds/socklnd/socklnd_cb.c:186:1: sparse: symbol 'ksocknal_transmit' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-module.c:179:9: sparse: symbol 'libcfs_dev' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-crc32.c:139:5: sparse: symbol 'cfs_crypto_crc32_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-crc32.c:145:6: sparse: symbol 'cfs_crypto_crc32_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-adler.c:134:5: sparse: symbol 'cfs_crypto_adler32_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-adler.c:140:6: sparse: symbol 'cfs_crypto_adler32_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-crc32pclmul.c:179:5: sparse: symbol 'cfs_crypto_crc32_pclmul_register' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-crypto-crc32pclmul.c:190:6: sparse: symbol 'cfs_crypto_crc32_pclmul_unregister' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/debug.c:60:14: sparse: symbol 'libcfs_debug_mb' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/debug.c:96:14: sparse: symbol 'portal_enter_debugger' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/nidstrings.c:63:6: sparse: symbol 'libcfs_init_nidstrings' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/module.c:354:22: sparse: symbol 'libcfs_psdev_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/tracefile.c:55:14: sparse: symbol 'cfs_trace_thread_mutex' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/hash.c:119:21: sparse: symbol 'cfs_sched_rehash' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-tracefile.c:52:21: sparse: symbol 'cfs_tracefile_sem' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:69:6: sparse: symbol 'lnet_upcall' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:70:6: sparse: symbol 'lnet_debug_log_upcall' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-debug.c:161:6: sparse: symbol 'lbug_with_loc' redeclared with different type (originally declared at drivers/staging/lustre/include//linux/libcfs/libcfs_private.h:79) - different modifiers
drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c:240:1: sparse: symbol 'libcfs_arch_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-prim.c:246:1: sparse: symbol 'libcfs_arch_cleanup' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-cpu.c:630:22: sparse: undefined identifier 'set_cpus_allowed'
drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c:563:5: sparse: symbol 'insert_proc' was not declared. Should it be static?
drivers/staging/lustre/lustre/libcfs/linux/linux-proc.c:572:6: sparse: symbol 'remove_proc' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_pm.c:5055:6: sparse: symbol 'i915_request_power_well' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_pm.c:5069:6: sparse: symbol 'i915_release_power_well' was not declared. Should it be static?
arch/x86/kernel/rtm-test.c:5:5: sparse: symbol 'x' was not declared. Should it be static?
drivers/staging/lustre/lnet/lnet/lib-ptl.c:42:9: sparse: symbol 'portal_rotor' was not declared. Should it be static?
drivers/staging/lustre/lnet/lnet/router.c:784:1: sparse: symbol 'lnet_update_ni_status_locked' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:213:23: sparse: symbol 'ping_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:214:6: sparse: symbol 'ping_init_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:222:16: sparse: symbol 'ping_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/ping_test.c:223:6: sparse: symbol 'ping_init_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:481:23: sparse: symbol 'brw_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:482:6: sparse: symbol 'brw_init_test_client' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:490:16: sparse: symbol 'brw_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/brw_test.c:491:6: sparse: symbol 'brw_init_test_service' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/console.c:1968:1: sparse: symbol 'lstcon_console_init' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/console.c:2038:1: sparse: symbol 'lstcon_console_fini' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/conctl.c:818:1: sparse: symbol 'lstcon_ioctl_entry' was not declared. Should it be static?
drivers/staging/lustre/lnet/selftest/timer.c:68:3: sparse: symbol 'stt_data' was not declared. Should it be static?
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:222:24: sparse: symbol 'lmv_proc_target_fops' was not declared. Should it be static?
drivers/staging/lustre/lustre/lmv/lproc_lmv.c:231:6: sparse: symbol 'lprocfs_lmv_init_vars' was not declared. Should it be static?
drivers/leds/trigger/ledtrig-cpu.c:38:8: sparse: symbol 'cpu_trig' was not declared. Should it be static?
drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd_cb.c:3022:1: sparse: symbol 'kiblnd_check_conns' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/../include/obd_lov.h:66:25: sparse: Initializer entry defined twice
drivers/staging/lustre/lustre/lov/lov_dev.c:63:22: sparse: symbol 'lov_caches' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_dev.c:158:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/lov/lov_cl_internal.h:666:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/lov/lov_object.c:882:22: sparse: symbol 'lov_lsm_get' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_object.c:898:6: sparse: symbol 'lov_lsm_put' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_object.c:905:5: sparse: symbol 'lov_read_and_clear_async_rc' was not declared. Should it be static?
drivers/staging/lustre/lustre/lov/lov_page.c:71:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/mdc/lproc_mdc.c:206:6: sparse: symbol 'lprocfs_mdc_init_vars' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:263:5: sparse: symbol 'mdc_getattr_name' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:922:5: sparse: symbol 'mdc_done_writing' was not declared. Should it be static?
drivers/staging/lustre/lustre/mdc/mdc_request.c:990:5: sparse: symbol 'mdc_readpage' was not declared. Should it be static?
drivers/staging/lustre/lustre/mgc/mgc_request.c:1824:16: sparse: symbol 'mgc_obd_ops' was not declared. Should it be static?
drivers/staging/lustre/lustre/mgc/mgc_request.c:1844:12: sparse: symbol 'mgc_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-sysctl.c:430:6: sparse: symbol 'obd_sysctl_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-sysctl.c:438:6: sparse: symbol 'obd_sysctl_clean' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/llog.c:78:6: sparse: symbol 'llog_free_handle' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/llog_cat.c:769:5: sparse: symbol 'cat_cancel_cb' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:53:18: sparse: symbol 'obd_types' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:56:7: sparse: symbol 'obd_max_pages' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/class_obd.c:57:7: sparse: symbol 'obd_max_alloc' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/genops.c:48:12: sparse: symbol 'obd_types_lock' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c:203:5: sparse: symbol 'lprocfs_wr_uint' redeclared with different type (originally declared at drivers/staging/lustre/lustre/obdclass/../include/lprocfs_status.h:618) - incompatible argument 2 (different address spaces)
drivers/staging/lustre/lustre/obdclass/lprocfs_status.c:237:5: sparse: symbol 'lprocfs_wr_atomic' redeclared with different type (originally declared at drivers/staging/lustre/lustre/obdclass/../include/lprocfs_status.h:615) - incompatible argument 2 (different address spaces)
drivers/staging/lustre/lustre/obdclass/local_storage.c:665:5: sparse: symbol 'lastid_compat_check' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obdo.c:160:5: sparse: symbol 'obdo_cmp_md' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_config.c:966:6: sparse: symbol 'lustre_register_client_process_config' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_config.c:1045:6: sparse: symbol 'lustre_register_quota_process_config' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:813:5: sparse: symbol 'lustre_check_exclusion' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:1313:5: sparse: symbol 'lustre_register_fs' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/obd_mount.c:1318:5: sparse: symbol 'lustre_unregister_fs' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lu_object.c:1354:25: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/obdclass/lu_object.c:1686:7: sparse: symbol 'lu_context_tags_default' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lu_object.c:1687:7: sparse: symbol 'lu_session_tags_default' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/lu_object.c:1923:6: sparse: symbol 'lu_context_keys_dump' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:389:17: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/obdclass/cl_page.c:831:6: sparse: symbol 'cl_page_disown0' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:1598:6: sparse: symbol 'cl_page_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_page.c:1603:6: sparse: symbol 'cl_page_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_lock.c:209:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/obdclass/cl_lock.c:2296:5: sparse: symbol 'cl_lock_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_lock.c:2301:6: sparse: symbol 'cl_lock_fini' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/cl_io.c:107:9: sparse: expression using sizeof bool
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:214:9: sparse: symbol 'obd_psdev' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:386:5: sparse: symbol 'class_procfs_init' was not declared. Should it be static?
drivers/staging/lustre/lustre/obdclass/linux/linux-module.c:401:5: sparse: symbol 'class_procfs_clean' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
