From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 01 Aug 2013 16:03:24 +0000
Subject: build regressions 2013-08-01
Message-Id: <51fa86cc.JUm0+cUYHwy400B4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/staging/lustre/lustre/llite/file.c:1032:7: error: 'struct kiocb' has no member named 'ki_left'
drivers/staging/lustre/lustre/llite/file.c:1093:7: error: 'struct kiocb' has no member named 'ki_left'
kernel/watchdog.c:518:2: error: implicit declaration of function '__smp_call_function_single' [-Werror=implicit-function-declaration]
asus-wmi.c:(.text+0x1639a8): undefined reference to `acpi_video_unregister'
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
net/mac80211/status.c:567:2: error: too few arguments to function 'ieee80211_led_tx'

[warnings]
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
drivers/target/mlx4_fc/fcoe_main.c:291:2: warning: #warning FIXME: fctgt_vhba_entail in create_hba [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:462:2: warning: #warning FIXME: fip_init_module fctgt_dev_register disabled [-Wcpp]
drivers/target/mlx4_fc/fcoib_main.c:1094:2: warning: #warning FIXME: fcf sysfs disabled [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1750:2: warning: #warning mlx4_get_fc_t11_settings() missing... [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1750:2: warning: #warning mlx4_get_fc_t11_settings() missing... [-Wcpp]
drivers/target/mlx4_fc/mfc_exch.c:450:2: warning: #warning FIXME: Missing exch_base + exch_size in mlx4_qp_context [-Wcpp]
drivers/target/mlx4_fc/mfc_exch.c:136:1: warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-larger-than=]
drivers/target/mlx4_fc/mfc_exch.c:450:2: warning: #warning FIXME: Missing exch_base + exch_size in mlx4_qp_context [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1823:2: warning: #warning FIXME: Single port usage in mfc_add_dev() [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1823:2: warning: #warning FIXME: Single port usage in mfc_add_dev() [-Wcpp]
WARNING: drivers/target/mlx4_fc/mlx4_fc.o(.init.text+0x7f): Section mismatch in reference from the function mfc_init() to the function .exit.text:mlx4_fc_deregister_configfs()
drivers/target/mlx4_fc/mfc_exch.c:836:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mfc_exch.c:887:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mfc_exch.c:925:22: warning: unused variable 'ts' [-Wunused-variable]
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'u64' [-Wformat=]
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'u64' [-Wformat=]
drivers/target/mlx4_fc/mfc.c:1236:2: warning: #warning FIXME: Hardcoded mtu"20 [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1587:2: warning: #warning FIXME: Release of fc_exch_mgr_free for mfc_destroy_vhba() [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1507:1: warning: label 'err_out' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1503:1: warning: label 'err_host_put' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1489:1: warning: label 'err_destroy_fcmd' defined but not used [-Wunused-label]
drivers/target/mlx4_fc/mfc.c:1344:28: warning: unused variable 'tmp_sht' [-Wunused-variable]
drivers/target/mlx4_fc/mfc.c:1343:20: warning: unused variable 'shost' [-Wunused-variable]
drivers/target/mlx4_fc/mfc.c:1236:2: warning: #warning FIXME: Hardcoded mtu"20 [-Wcpp]
drivers/target/mlx4_fc/mfc.c:1587:2: warning: #warning FIXME: Release of fc_exch_mgr_free for mfc_destroy_vhba() [-Wcpp]
drivers/target/mlx4_fc/mfc_rfci.c:886:23: warning: unused variable 'msg' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:335:2: warning: #warning FIXME: Setup lport bits >>>>>>>>>>>>>>>>>>>> [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:299:14: warning: unused variable 'fcf' [-Wunused-variable]
kernel/rcutree.c:3197:13: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_sub' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_sub' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_sub_1' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_add' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_add' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
include/linux/compiler.h:140:4: warning: '______f' is static but declared in inline function 'mpihelp_add_1' which is not static [enabled by default]
WARNING: drivers/target/mlx4_fc/mlx4_fc.o(.init.text+0x160): Section mismatch in reference from the function .init_module() to the function .exit.text:.mlx4_fc_deregister_configfs()
drivers/spi/spi-gpio.c:446:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/mfd/max8998.c:178:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

[coccinelle]
drivers/target/mlx4_fc/mfc_umem.c:225:33-37: ERROR: reference preceded by free on line 216
drivers/target/mlx4_fc/fcoib_discover.c:775:1-7: Replace memcpy with struct assignment
drivers/target/mlx4_fc/fcoib_discover.c:864:1-7: Replace memcpy with struct assignment
drivers/target/mlx4_fc/fcoib_discover.c:821:1-7: Replace memcpy with struct assignment
drivers/target/mlx4_fc/fcoib_discover.c:716:1-7: Replace memcpy with struct assignment
drivers/target/mlx4_fc/fcoib_discover.c:908:1-7: Replace memcpy with struct assignment
drivers/target/mlx4_fc/mfc.c:810:34-35: Unneeded semicolon
drivers/hid/uhid.c:146:17-24: WARNING opportunity for memdup_user

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
