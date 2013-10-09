From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 09 Oct 2013 16:06:25 +0000
Subject: build regressions 2013-10-09
Message-Id: <52557f01.Cyqw1sf1KWMnVOsp%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/core/hub.c:3974:35: error: 'value' undeclared (first use in this function)
docproc: kernel/rcupdate.c: No such file or directory
include/net/sock.h:324:36: error: 'const struct sock_common' has no member named 'skc_v6_rcv_saddr'
include/net/sock.h:324:36: error: 'struct sock_common' has no member named 'skc_v6_rcv_saddr'
include/net/sock.h:323:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/inet_timewait_sock.h:119:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/inet_timewait_sock.h:119:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/sock.h:323:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/sock.h:323:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/sock.h:323:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/sock.h:324:36: error: 'struct sock_common' has no member named 'skc_v6_rcv_saddr'
tree.c:(.text+0x37431): undefined reference to `resched_cpu'
arch/ia64/kernel/signal.c:356:29: error: 'sig' undeclared (first use in this function)
ERROR: "ib_attach_mcast" undefined!
ERROR: "ib_query_gid" undefined!
ERROR: "ib_dealloc_pd" undefined!
ERROR: "ib_find_pkey" undefined!
ERROR: "ib_sa_join_multicast" undefined!
ERROR: "ib_destroy_qp" undefined!
ERROR: "ib_query_pkey" undefined!
ERROR: "ib_destroy_ah" undefined!
ERROR: "ib_modify_qp" undefined!
ERROR: "ib_sa_free_multicast" undefined!
ERROR: "ib_create_qp" undefined!
ERROR: "ib_alloc_pd" undefined!
ERROR: "ib_get_dma_mr" undefined!
ERROR: "ib_query_device" undefined!
ERROR: "ib_get_client_data" undefined!
ERROR: "ib_query_port" undefined!
ERROR: "ib_set_client_data" undefined!
ERROR: "ib_sa_unregister_client" undefined!
ERROR: "ib_destroy_cq" undefined!
ERROR: "ib_register_client" undefined!
ERROR: "ib_create_ah" undefined!
ERROR: "ib_unregister_event_handler" undefined!
ERROR: "ib_detach_mcast" undefined!
ERROR: "ib_register_event_handler" undefined!
ERROR: "rdma_node_get_transport" undefined!
ERROR: "ib_query_qp" undefined!
ERROR: "ib_dereg_mr" undefined!
ERROR: "ib_sa_register_client" undefined!
ERROR: "ib_create_cq" undefined!
ERROR: "ib_unregister_client" undefined!
ERROR: "mlx4_fmr_free" undefined!
ERROR: "mlx4_fmr_alloc" undefined!
ERROR: "mlx4_map_phys_fmr" undefined!
ERROR: "mlx4_fmr_enable" undefined!
ERROR: "mlx4_fmr_unmap" undefined!
ERROR: "mlx4_mr_enable" undefined!
ERROR: "mlx4_pd_free" undefined!
ERROR: "mlx4_qp_reserve_range" undefined!
ERROR: "mlx4_qp_alloc" undefined!
ERROR: "mlx4_INIT_PORT" undefined!
ERROR: "mlx4_alloc_hwq_res" undefined!
ERROR: "mlx4_register_interface" undefined!
ERROR: "mlx4_mr_release_range" undefined!
ERROR: "mlx4_qp_free" undefined!
ERROR: "mlx4_qp_remove" undefined!
ERROR: "mlx4_register_vlan" undefined!
ERROR: "mlx4_mr_free" undefined!
ERROR: "mlx4_uar_alloc" undefined!
ERROR: "mlx4_alloc_cmd_mailbox" undefined!
ERROR: "mlx4_CLOSE_PORT" undefined!
ERROR: "mlx4_cq_free" undefined!
ERROR: "mlx4_free_hwq_res" undefined!
ERROR: "mlx4_mr_alloc" undefined!
ERROR: "__mlx4_cmd" undefined!
ERROR: "mlx4_uar_free" undefined!
ERROR: "mlx4_free_cmd_mailbox" undefined!
ERROR: "mlx4_qp_to_ready" undefined!
ERROR: "mlx4_get_protocol_dev" undefined!
ERROR: "mlx4_cq_alloc" undefined!
ERROR: "mlx4_qp_release_range" undefined!
ERROR: "mlx4_qp_detach_common" undefined!
ERROR: "mlx4_mr_reserve_range" undefined!
ERROR: "mlx4_register_mac" undefined!
ERROR: "mlx4_unregister_vlan" undefined!
ERROR: "mlx4_pd_alloc" undefined!
ERROR: "mlx4_SET_PORT_general" undefined!
ERROR: "mlx4_unregister_interface" undefined!
ERROR: "mlx4_qp_attach_common" undefined!
ERROR: "mlx4_unregister_mac" undefined!
drivers/misc/crossbar.c:250:21: error: 'crossbar_match' undeclared here (not in a function)
security/lsm_audit.c:308:41: error: 'struct sock_common' has no member named 'skc_v6_rcv_saddr'
security/lsm_audit.c:311:41: error: 'struct sock_common' has no member named 'skc_v6_daddr'
include/net/ip6_checksum.h:73:55: error: 'struct sock_common' has no member named 'skc_v6_daddr'
net/ipv4/tcp_metrics.c:255:53: error: 'struct sock_common' has no member named 'skc_v6_daddr'
net/ipv4/tcp_metrics.c:256:41: error: 'struct sock_common' has no member named 'skc_v6_daddr'
net/ipv4/tcp_metrics.c:290:53: error: 'struct sock_common' has no member named 'skc_v6_daddr'
net/ipv4/tcp_metrics.c:291:41: error: 'struct sock_common' has no member named 'skc_v6_daddr'
net/ipv4/ping.c:420:38: error: 'struct sock_common' has no member named 'skc_v6_rcv_saddr'
net/sunrpc/svcsock.c:297:21: error: 'const struct sock_common' has no member named 'skc_v6_rcv_saddr'
drivers/gpu/drm/i915/intel_pm.c:5406:3: error: implicit declaration of function 'intel_flush_display_plane' [-Werror=implicit-function-declaration]
arch/x86/xen/mmu.c:800:25: error: expected ')' before ';' token
arch/x86/xen/mmu.c:805:1: error: expected ';' before '}' token
(.text+0x161c8d): undefined reference to `cpufreq_cpu_get'
(.text+0x161ca2): undefined reference to `cpufreq_cpu_put'
kernel/rcu/tree_plugin.h:1136:28: fatal error: rtmutex_common.h: No such file or directory

[warnings]
drivers/target/mlx4_fc/mfc_rfci.c:862:16: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat]
drivers/target/mlx4_fc/mfc.c:1232: warning: integer constant is too large for 'long' type
drivers/target/mlx4_fc/fcoib_discover.c:1812: warning: integer constant is too large for 'long' type
drivers/scsi/sd.c:595: warning: 'sd_prot_op' defined but not used
Warning(kernel/rcu/srcu.c:496): No description found for parameter 'sp'
include/net/inet_sock.h:148:39: warning: 'sk' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/rcu/tree.c:3247:13: warning: array subscript is above array bounds [-Warray-bounds]
kernel/rcu/tiny.c:70:23: warning: unused variable 'idle' [-Wunused-variable]
kernel/rcu/tiny.c:131:23: warning: unused variable 'idle' [-Wunused-variable]
arch/microblaze/include/asm/pgalloc.h:168:2: warning: 'pgtable_page_dtor' is static but used in inline function 'pte_free' which is not static [enabled by default]
arch/microblaze/include/asm/pgalloc.h:168:2: warning: 'pgtable_page_dtor' is static but used in inline function 'pte_free' which is not static [enabled by default]
arch/microblaze/include/asm/pgalloc.h:168:2: warning: 'pgtable_page_dtor' is static but used in inline function 'pte_free' which is not static [enabled by default]
arch/microblaze/include/asm/pgalloc.h:168:2: warning: 'pgtable_page_dtor' is static but used in inline function 'pte_free' which is not static [enabled by default]
kernel/lockdep_proc.c:424:23: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/scsi/scsi.c:856:7: warning: unused variable 'old_good_bytes' [-Wunused-variable]
drivers/scsi/scsi.c:826:22: warning: unused variable 'drv' [-Wunused-variable]
drivers/scsi/virtio_scsi.c:688:2: warning: #warning FIXME: Need to pass nr_hw_queues into scsi-mq [-Wcpp]
WARNING: drivers/target/mlx4_fc/mlx4_fc.o(.init.text+0xee): Section mismatch in reference from the function init_module() to the function .exit.text:mlx4_fc_deregister_configfs()
drivers/target/mlx4_fc/mfc_exch.c:450:2: warning: #warning FIXME: Missing exch_base + exch_size in mlx4_qp_context [-Wcpp]
drivers/target/mlx4_fc/mfc_exch.c:450:2: warning: #warning FIXME: Missing exch_base + exch_size in mlx4_qp_context [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:204:2: warning: #warning FIXME: mfc_vhba_fcoe_default_attrs + mfc_vhba_fcoib_default_attrs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:267:2: warning: #warning FIXME: mfc_vhba_fcoe_type + mfc_vhba_fcoib_type disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:355:2: warning: #warning FIXME: mfc_port_default_attrs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:403:2: warning: #warning FIXME: mfc_port_type disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:424:2: warning: #warning FIXME: mfc_port_register_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:443:2: warning: #warning FIXME: mfc_port_deregister_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:454:2: warning: #warning FIXME: mfc_dev sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:488:2: warning: #warning FIXME: mfc_device_register_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:204:2: warning: #warning FIXME: mfc_vhba_fcoe_default_attrs + mfc_vhba_fcoib_default_attrs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:267:2: warning: #warning FIXME: mfc_vhba_fcoe_type + mfc_vhba_fcoib_type disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:355:2: warning: #warning FIXME: mfc_port_default_attrs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:403:2: warning: #warning FIXME: mfc_port_type disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:424:2: warning: #warning FIXME: mfc_port_register_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:443:2: warning: #warning FIXME: mfc_port_deregister_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:454:2: warning: #warning FIXME: mfc_dev sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc_sysfs.c:488:2: warning: #warning FIXME: mfc_device_register_sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/fcoib_main.c:1094:2: warning: #warning FIXME: fcf sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1750:2: warning: #warning mlx4_get_fc_t11_settings() missing... [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1750:2: warning: #warning mlx4_get_fc_t11_settings() missing... [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1823:2: warning: #warning FIXME: Single port usage in mfc_add_dev() [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1823:2: warning: #warning FIXME: Single port usage in mfc_add_dev() [-Wcpp]
WARNING: vmlinux.o(.init.text+0xc6982): Section mismatch in reference from the function mfc_init() to the function .exit.text:mlx4_fc_deregister_configfs()
drivers/target/mlx4_fc/mfc_exch.c:836:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mfc_exch.c:887:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mfc_exch.c:925:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat=]
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat=]
drivers/target/mlx4_fc/mfc.c:1236:2: warning: #warning FIXME: Hardcoded mtu"20 [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1507:1: warning: label 'err_out' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1503:1: warning: label 'err_host_put' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1344:28: warning: unused variable 'tmp_sht' [-Wunused-variable]
drivers/target/mlx4_fc/mfc.c:1343:20: warning: unused variable 'shost' [-Wunused-variable]
drivers/target/mlx4_fc/mfc.c:1587:2: warning: #warning FIXME: Release of fc_exch_mgr_free for mfc_destroy_vhba() [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1236:2: warning: #warning FIXME: Hardcoded mtu"20 [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1587:2: warning: #warning FIXME: Release of fc_exch_mgr_free for mfc_destroy_vhba() [-Wcpp]
drivers/target/mlx4_fc/mfc_rfci.c:886:23: warning: unused variable 'msg' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:299:14: warning: unused variable 'fcf' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:335:2: warning: #warning FIXME: Setup lport bits >>>>>>>>>>>>>>>>>>>> [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1405:2: warning: format '%u' expects a matching 'unsigned int' argument [-Wformat=]
drivers/target/mlx4_fc/fcoe_main.c:295:5: warning: unused variable 'fh_d_id' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:468:2: warning: #warning FIXME: schedule_delayed_work disabled in link_state_changed [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:534:2: warning: #warning FIXME: schedule_delayed_work disabled in add_port [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1129:1: warning: label 'err' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1540:1: warning: label 'err_free_fexch_bulk' defined but not used [-Wunused-label]
include/linux/dynamic_debug.h:64:16: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
include/net/sock.h:311:37: warning: 'sk' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/xen/mmu.c:805:1: warning: no return statement in function returning non-void [-Wreturn-type]
drivers/target/loopback/tcm_loop.c:82:23: warning: unused variable 'tl_cmd' [-Wunused-variable]

[sparse]
drivers/usb/core/hub.c:3971:32: sparse: restricted __le32 degrades to integer
drivers/target/mlx4_fc/mlx4_fc_configfs.c:25:31: sparse: symbol 'mlx4_fc_fabric_configfs' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:1750:2: sparse: mlx4_get_fc_t11_settings() missing...
drivers/target/mlx4_fc/mfc.c:1233:62: sparse: constant 0xFFFFFFFFFFFFFFF0 is so big it is unsigned long
drivers/target/mlx4_fc/mfc.c:64:5: sparse: symbol 'mfc_payload_size' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:76:5: sparse: symbol 'mfc_log_exch_per_vhba' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:82:5: sparse: symbol 'max_vhba_per_port' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:99:1: sparse: symbol 'mfc_dev_list' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:100:1: sparse: symbol 'mfc_dev_list_lock' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:102:32: sparse: symbol 'mfc_transport_template' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:120:32: sparse: symbol 'mlx4_libfc_fcn_templ' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:127:27: sparse: symbol 'mfc_driver_template' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:605:5: sparse: symbol 'mfc_create_fip' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:714:6: sparse: symbol 'mfc_destroy_fip' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:741:5: sparse: symbol 'mfc_init_fip' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:834:5: sparse: symbol 'mfc_deinit_fip' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:937:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [char] [usertype] <noident> @@    got [unsigned] [char] [usertype] <noident> @@
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long long [unsigned] [usertype] val @@    got g long [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:937:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:941:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] ind @@    got ed int [unsigned] [usertype] ind @@
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:943:9: sparse: restricted __be32 degrades to integer
drivers/target/mlx4_fc/mfc.c:946:9: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [char] [usertype] <noident> @@    got [unsigned] [char] [usertype] <noident> @@
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got  short [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int [unsigned] [usertype] val @@    got ed int [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned long long [unsigned] [usertype] val @@    got g long [unsigned] [usertype] val @@
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: cast from restricted __be32
drivers/target/mlx4_fc/mfc.c:946:9: sparse: too many warnings
drivers/target/mlx4_fc/mfc_rfci.c:55:4: sparse: symbol 'fc_fid_flogi' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_rfci.c:552:5: sparse: symbol 'mlx4_do_rfci_xmit' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_exch.c:450:2: sparse: FIXME: Missing exch_base + exch_size in mlx4_qp_context
drivers/target/mlx4_fc/mfc_exch.c:284:5: sparse: symbol 'wait_for_fexch_tx_comp' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_exch.c:401:5: sparse: symbol 'mfc_init_fexch' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_exch.c:484:5: sparse: symbol 'mfc_fill_abort_hdr' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_exch.c:274:9: sparse: context imbalance in 'wait_for_q_comp' - unexpected unlock
drivers/target/mlx4_fc/mfc_sysfs.c:204:2: sparse: FIXME: mfc_vhba_fcoe_default_attrs + mfc_vhba_fcoib_default_attrs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:267:2: sparse: FIXME: mfc_vhba_fcoe_type + mfc_vhba_fcoib_type disabled
drivers/target/mlx4_fc/mfc_sysfs.c:355:2: sparse: FIXME: mfc_port_default_attrs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:403:2: sparse: FIXME: mfc_port_type disabled
drivers/target/mlx4_fc/mfc_sysfs.c:424:2: sparse: FIXME: mfc_port_register_sysfs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:443:2: sparse: FIXME: mfc_port_deregister_sysfs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:454:2: sparse: FIXME: mfc_dev sysfs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:488:2: sparse: FIXME: mfc_device_register_sysfs disabled
drivers/target/mlx4_fc/mfc_sysfs.c:189:1: sparse: symbol 'mfc_vhba_attr_vhba_debug_info' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:190:1: sparse: symbol 'mfc_vhba_attr_protocol' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:191:1: sparse: symbol 'mfc_vhba_attr_lport_state' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:192:1: sparse: symbol 'mfc_vhba_attr_fc_payload_size' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:195:1: sparse: symbol 'mfc_vhba_attr_gw_mac' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:196:1: sparse: symbol 'mfc_vhba_attr_vlan_id' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:197:1: sparse: symbol 'mfc_vhba_attr_priority' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:198:1: sparse: symbol 'mfc_vhba_attr_my_mac' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:201:1: sparse: symbol 'mfc_vhba_attr_gw_lid' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:202:1: sparse: symbol 'mfc_vhba_attr_gw_data_qpn' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_sysfs.c:260:6: sparse: symbol 'mfc_vhba_release' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoe_main.c:110:21: sparse: restricted __be16 degrades to integer
drivers/target/mlx4_fc/fcoe_main.c:110:35: sparse: restricted __be16 degrades to integer
drivers/target/mlx4_fc/fcoe_main.c:141:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoe_main.c:141:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoe_main.c:141:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoe_main.c:141:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoe_main.c:347:6: sparse: symbol 'vlan_req_work' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_umem.c:87:16: sparse: symbol 'mfc_umem_get' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_umem.c:232:6: sparse: symbol 'mfc_umem_release' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc_umem.c:255:5: sparse: symbol 'mfc_umem_page_count' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:1094:2: sparse: FIXME: fcf sysfs disabled
drivers/target/mlx4_fc/fcoib_main.c:59:25: sparse: symbol 'fip_mng_workqueue' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:60:21: sparse: symbol 'fip_sa_client' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:272:6: sparse: symbol 'fip_qp_to_err' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:392:5: sparse: symbol 'fip_init_ring' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:501:6: sparse: symbol 'fip_event' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:695:71: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_main.c:772:52: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_main.c:1021:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [addressable] [usertype] guid @@    got ed] [addressable] [usertype] guid @@
drivers/target/mlx4_fc/fcoib_main.c:1068:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [addressable] [usertype] guid @@    got ed] [addressable] [usertype] guid @@
drivers/target/mlx4_fc/fcoib_main.c:1227:6: sparse: symbol 'mfc_fcf_release' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_main.c:1296:6: sparse: symbol 'fip_discover_restart' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:1812:45: sparse: constant 0xffffff0000000000 is so big it is unsigned long
drivers/target/mlx4_fc/fcoib_discover.c:419:12: sparse: symbol 'FIP_DISCOVER_MGID' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:426:12: sparse: symbol 'FIP_SOLICIT_MGID' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:562:28: sparse: symbol 'base_fcoib_solicit_pkt' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:579:34: sparse: symbol 'base_flogi_request_pkt' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:592:27: sparse: symbol 'base_logo_request_pkt' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:605:24: sparse: symbol 'base_ioa_alive_pkt' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:616:25: sparse: symbol 'base_vhba_alive_pkt' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:640:23: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:640:23: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:640:23: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:640:23: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:642:29: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:642:29: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:642:29: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:642:29: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:646:14: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:646:14: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:646:14: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:646:14: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:649:13: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:649:13: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:649:13: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:649:13: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:673:37: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:675:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:675:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:675:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:675:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:676:33: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:676:33: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:676:33: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:676:33: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:677:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:677:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:677:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:677:37: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:685:45: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:686:35: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:686:35: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:686:35: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:686:35: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:689:17: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:689:17: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:689:17: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:689:17: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:631:5: sparse: symbol 'fcoib_advertise_parse' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:717:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] opcode @@    got  short [unsigned] [usertype] opcode @@
drivers/target/mlx4_fc/fcoib_discover.c:718:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] list_length @@    got  short [unsigned] [usertype] list_length @@
drivers/target/mlx4_fc/fcoib_discover.c:720:22: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] qpn @@    got ed int [unsigned] [usertype] qpn @@
drivers/target/mlx4_fc/fcoib_discover.c:721:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_discover.c:728:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] max_fcoe_size @@    got  short [unsigned] [usertype] max_fcoe_size @@
drivers/target/mlx4_fc/fcoib_discover.c:698:5: sparse: symbol 'fcoib_solicit_send' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:779:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] opcode @@    got  short [unsigned] [usertype] opcode @@
drivers/target/mlx4_fc/fcoib_discover.c:780:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] list_length @@    got  short [unsigned] [usertype] list_length @@
drivers/target/mlx4_fc/fcoib_discover.c:783:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] qpn @@    got ed int [unsigned] [usertype] qpn @@
drivers/target/mlx4_fc/fcoib_discover.c:784:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] sl_gwportid @@    got  short [unsigned] [usertype] sl_gwportid @@
drivers/target/mlx4_fc/fcoib_discover.c:785:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_discover.c:824:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] opcode @@    got  short [unsigned] [usertype] opcode @@
drivers/target/mlx4_fc/fcoib_discover.c:825:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] list_length @@    got  short [unsigned] [usertype] list_length @@
drivers/target/mlx4_fc/fcoib_discover.c:828:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] qpn @@    got ed int [unsigned] [usertype] qpn @@
drivers/target/mlx4_fc/fcoib_discover.c:829:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] sl_gwportid @@    got  short [unsigned] [usertype] sl_gwportid @@
drivers/target/mlx4_fc/fcoib_discover.c:830:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_discover.c:866:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] opcode @@    got  short [unsigned] [usertype] opcode @@
drivers/target/mlx4_fc/fcoib_discover.c:867:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] list_length @@    got  short [unsigned] [usertype] list_length @@
drivers/target/mlx4_fc/fcoib_discover.c:869:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] qpn @@    got ed int [unsigned] [usertype] qpn @@
drivers/target/mlx4_fc/fcoib_discover.c:870:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] sl_gwportid @@    got  short [unsigned] [usertype] sl_gwportid @@
drivers/target/mlx4_fc/fcoib_discover.c:871:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_discover.c:849:5: sparse: symbol 'fcoib_ioa_alive_send' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:910:25: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] opcode @@    got  short [unsigned] [usertype] opcode @@
drivers/target/mlx4_fc/fcoib_discover.c:911:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] list_length @@    got  short [unsigned] [usertype] list_length @@
drivers/target/mlx4_fc/fcoib_discover.c:914:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] qpn @@    got ed int [unsigned] [usertype] qpn @@
drivers/target/mlx4_fc/fcoib_discover.c:915:26: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] sl_gwportid @@    got  short [unsigned] [usertype] sl_gwportid @@
drivers/target/mlx4_fc/fcoib_discover.c:916:18: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [usertype] lid @@    got  short [unsigned] [usertype] lid @@
drivers/target/mlx4_fc/fcoib_discover.c:892:5: sparse: symbol 'fcoib_vhba_alive_send' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:950:22: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:950:22: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:950:22: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:950:22: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:940:5: sparse: symbol 'fcoib_pkt_parse' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:968:5: sparse: symbol 'fip_discover_start_rings' was not declared. Should it be static?
drivers/target/mlx4_fc/fcoib_discover.c:1545:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:1545:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:1545:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:1545:41: sparse: cast to restricted __be16
drivers/target/mlx4_fc/fcoib_discover.c:1554:48: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:1554:48: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:1554:48: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:1554:48: sparse: cast to restricted __be32
drivers/target/mlx4_fc/fcoib_discover.c:1554:48: sparse: too many warnings
drivers/target/mlx4_fc/mfc.c:1823:2: sparse: FIXME: Single port usage in mfc_add_dev()
drivers/target/mlx4_fc/mfc.c:1236:2: sparse: FIXME: Hardcoded mtu"20
drivers/target/mlx4_fc/mfc.c:1587:2: sparse: FIXME: Release of fc_exch_mgr_free for mfc_destroy_vhba()
drivers/target/mlx4_fc/fcoe_main.c:335:2: sparse: FIXME: Setup lport bits >>>>>>>>>>>>>>>>>>>>
drivers/target/mlx4_fc/fcoe_main.c:468:2: sparse: FIXME: schedule_delayed_work disabled in link_state_changed
drivers/target/mlx4_fc/fcoe_main.c:534:2: sparse: FIXME: schedule_delayed_work disabled in add_port
drivers/target/mlx4_fc/fcoe_main.c:268:53: sparse: cast truncates bits from constant value (efd becomes fd)
drivers/target/mlx4_fc/fcoe_main.c:269:38: sparse: cast truncates bits from constant value (efd00 becomes 0)
drivers/usb/core/hub.c:3974:49: sparse: undefined identifier 'value'
drivers/target/mlx4_fc/mfc.c:57:5: sparse: symbol 'fctgt_dbg_lvl' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:87:5: sparse: symbol 'max_cmd_per_lun' was not declared. Should it be static?
drivers/target/mlx4_fc/mfc.c:97:21: sparse: symbol 'fip_ctlrs' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/mr.c:302:5: sparse: symbol 'mlx4_mr_reserve_range' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/mr.c:317:6: sparse: symbol 'mlx4_mr_release_range' was not declared. Should it be static?
arch/x86/xen/mmu.c:800:32: sparse: Expected ) in function call
arch/x86/xen/mmu.c:800:32: sparse: got ;
kernel/rcu/tree.c:218:8: sparse: symbol 'rcu_dynticks' was not declared. Should it be static?
kernel/rcu/torture.c:207:5: sparse: symbol 'rcutorture_runnable' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
