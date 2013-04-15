From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Apr 2013 16:07:02 +0000
Subject: build regressions 2013-04-15
Message-Id: <516c25a6.pmJd39KJ4mhDVTaw%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/mfd/si476x-core.h:510:35: error: invalid suffix "b0000000000011111" on integer constant
include/linux/mfd/si476x-core.h:511:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:512:32: error: invalid suffix "b0000001000000000" on integer constant
include/linux/mfd/si476x-core.h:513:30: error: invalid suffix "b0000000000000000" on integer constant
include/linux/mfd/si476x-core.h:514:30: error: invalid suffix "b0000000100000000" on integer constant
drivers/mfd/si476x-cmd.c:154:22: error: invalid suffix "b11111" on integer constant
drivers/mfd/si476x-cmd.c:776:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:777:21: error: invalid suffix "b00000100" on integer constant
drivers/mfd/si476x-cmd.c:778:21: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:779:21: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:781:18: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:782:22: error: invalid suffix "b00100000" on integer constant
drivers/mfd/si476x-cmd.c:783:22: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:784:19: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:785:19: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:935:24: error: invalid suffix "b00010000" on integer constant
drivers/mfd/si476x-cmd.c:936:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:937:23: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:938:23: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:940:23: error: invalid suffix "b00010000" on integer constant
drivers/mfd/si476x-cmd.c:941:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:942:21: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:943:24: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:945:16: error: invalid suffix "b00100000" on integer constant
drivers/mfd/si476x-cmd.c:946:17: error: invalid suffix "b00011111" on integer constant
drivers/mfd/si476x-cmd.c:951:34: error: invalid suffix "b11000000" on integer constant
drivers/mfd/si476x-cmd.c:952:34: error: invalid suffix "b00110000" on integer constant
drivers/mfd/si476x-cmd.c:953:34: error: invalid suffix "b00001100" on integer constant
drivers/mfd/si476x-cmd.c:954:34: error: invalid suffix "b00000011" on integer constant
drivers/mfd/si476x-cmd.c:1009:10: error: invalid suffix "b111" on integer constant
drivers/mfd/si476x-cmd.c:1166:49: error: invalid suffix "b11" on integer constant
drivers/mfd/si476x-cmd.c:1201:21: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1202:21: error: invalid suffix "b01000000" on integer constant
drivers/mfd/si476x-cmd.c:1203:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1204:21: error: invalid suffix "b00000100" on integer constant
drivers/mfd/si476x-cmd.c:1205:21: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1206:21: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:1208:18: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1209:22: error: invalid suffix "b00100000" on integer constant
drivers/mfd/si476x-cmd.c:1210:22: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1211:19: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1212:19: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:1255:21: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1256:21: error: invalid suffix "b01000000" on integer constant
drivers/mfd/si476x-cmd.c:1257:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1258:21: error: invalid suffix "b00000100" on integer constant
drivers/mfd/si476x-cmd.c:1259:21: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1260:21: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:1262:18: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1263:22: error: invalid suffix "b00100000" on integer constant
drivers/mfd/si476x-cmd.c:1264:22: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1265:19: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1266:19: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:1310:21: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1311:21: error: invalid suffix "b01000000" on integer constant
drivers/mfd/si476x-cmd.c:1312:21: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1313:21: error: invalid suffix "b00000100" on integer constant
drivers/mfd/si476x-cmd.c:1314:21: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1315:21: error: invalid suffix "b00000001" on integer constant
drivers/mfd/si476x-cmd.c:1317:18: error: invalid suffix "b10000000" on integer constant
drivers/mfd/si476x-cmd.c:1318:22: error: invalid suffix "b00100000" on integer constant
drivers/mfd/si476x-cmd.c:1319:22: error: invalid suffix "b00001000" on integer constant
drivers/mfd/si476x-cmd.c:1320:28: error: invalid suffix "b00000100" on integer constant
drivers/mfd/si476x-cmd.c:1321:19: error: invalid suffix "b00000010" on integer constant
drivers/mfd/si476x-cmd.c:1322:19: error: invalid suffix "b00000001" on integer constant
include/linux/mfd/si476x-core.h:510:35: error: invalid suffix "b0000000000011111" on integer constant
include/linux/mfd/si476x-core.h:511:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:512:32: error: invalid suffix "b0000001000000000" on integer constant
include/linux/mfd/si476x-core.h:513:30: error: invalid suffix "b0000000000000000" on integer constant
include/linux/mfd/si476x-core.h:514:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:510:35: error: invalid suffix "b0000000000011111" on integer constant
include/linux/mfd/si476x-core.h:511:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:512:32: error: invalid suffix "b0000001000000000" on integer constant
include/linux/mfd/si476x-core.h:513:30: error: invalid suffix "b0000000000000000" on integer constant
include/linux/mfd/si476x-core.h:514:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:510:35: error: invalid suffix "b0000000000011111" on integer constant
include/linux/mfd/si476x-core.h:511:30: error: invalid suffix "b0000000100000000" on integer constant
include/linux/mfd/si476x-core.h:512:32: error: invalid suffix "b0000001000000000" on integer constant
include/linux/mfd/si476x-core.h:513:30: error: invalid suffix "b0000000000000000" on integer constant
include/linux/mfd/si476x-core.h:514:30: error: invalid suffix "b0000000100000000" on integer constant
sound/soc/codecs/si476x.c:137:7: error: invalid suffix "b1111110" on integer constant
sound/soc/codecs/si476x.c:183:7: error: invalid suffix "b111" on integer constant
sound/soc/codecs/si476x.c:183:7: error: invalid suffix "b111" on integer constant
drivers/media/radio/radio-si476x.c:862:57: error: invalid suffix "b10000000" on integer constant
arch/x86/kernel/cpu/perf_event_intel.c:158:2: error: implicit declaration of function 'INTEL_UEVENT_PEBS_LDLAT_EXTRA_REG' [-Werror=implicit-function-declaration]
arch/x86/kernel/cpu/perf_event_intel.c:158:2: error: initializer element is not constant
arch/x86/kernel/cpu/perf_event_intel.c:159:2: error: field name not in record or union initializer
arch/x86/kernel/cpu/perf_event_intel.c:159:2: error: field name not in record or union initializer
arch/x86/kernel/cpu/perf_event_intel.c:159:2: error: field name not in record or union initializer
arch/x86/kernel/cpu/perf_event_intel.c:159:2: error: field name not in record or union initializer
arch/x86/kernel/cpu/perf_event_intel.c:159:2: error: field name not in record or union initializer
drivers/lguest/page_tables.c:105:26: error: 'SWITCHER_PGD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:106:15: error: 'SWITCHER_PMD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:701:5: error: 'SWITCHER_PGD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:741:33: error: 'SWITCHER_PGD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:748:20: error: 'SWITCHER_PMD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:1041:14: error: 'SWITCHER_PGD_INDEX' undeclared (first use in this function)
drivers/lguest/page_tables.c:1045:21: error: 'SWITCHER_PMD_INDEX' undeclared (first use in this function)
ERROR: "find_font" [drivers/staging/media/solo6x10/solo6x10.ko] undefined!
ERROR: "usb_deregister" [drivers/staging/media/go7007/go7007-loader.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/media/go7007/go7007-loader.ko] undefined!
ERROR: "usb_get_dev" [drivers/staging/media/go7007/go7007-loader.ko] undefined!
ERROR: "usb_control_msg" [drivers/media/common/cypress_firmware.ko] undefined!
drivers/vhost/tcm_vhost.c:821:1: error: expected expression before '<<' token
drivers/vhost/tcm_vhost.c:827:3: error: implicit declaration of function 'vhost_vq_access_ok' [-Werror=implicit-function-declaration]
drivers/vhost/tcm_vhost.c:832:1: error: expected expression before '=' token
drivers/vhost/tcm_vhost.c:834:1: error: expected expression before '>>' token
drivers/vhost/tcm_vhost.c:909:1: error: expected expression before '<<' token
drivers/vhost/tcm_vhost.c:929:1: error: expected expression before '=' token
drivers/vhost/tcm_vhost.c:931:5: error: redeclaration of 'target' with no linkage
drivers/vhost/tcm_vhost.c:934:1: error: expected expression before '>>' token
drivers/vhost/tcm_vhost.c:995:6: error: implicit declaration of function 'vhost_log_access_ok' [-Werror=implicit-function-declaration]
drivers/vhost/tcm_vhost.c:1046:1: error: expected identifier or '(' before '<<' token
drivers/vhost/tcm_vhost.c:1053:13: error: redefinition of 'vhost_scsi_flush'
drivers/vhost/tcm_vhost.c:1062:12: error: redefinition of 'vhost_scsi_set_features'
drivers/vhost/tcm_vhost.c:1075:1: error: expected identifier or '(' before '>>' token
drivers/vhost/tcm_vhost.c:1129:2: error: implicit declaration of function 'vhost_scsi_ioctl' [-Werror=implicit-function-declaration]
drivers/vhost/tcm_vhost.c:1136:20: error: 'vhost_scsi_ioctl' undeclared here (not in a function)
(.text+0x20160): undefined reference to `__clzdi2'
(.text+0x20890): undefined reference to `__clzdi2'
lz4hc_compress.c:(.text+0x21068): undefined reference to `__clzdi2'
lz4hc_compress.c:(.text+0x21330): undefined reference to `__clzdi2'
lz4hc_compress.c:(.text+0x21ae8): undefined reference to `__clzdi2'
drivers/ssbi/ssbi.c:328:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
drivers/ssbi/ssbi.c:356:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]

[warnings]
drivers/scsi/pcmcia/nsp_cs.h:335: warning: 'nsp_cs_init' declared 'static' but never defined
drivers/scsi/pcmcia/nsp_cs.h:336: warning: 'nsp_cs_exit' declared 'static' but never defined
arch/x86/kernel/cpu/perf_event_intel.c:158:2: warning: missing braces around initializer [-Wmissing-braces]
arch/x86/kernel/cpu/perf_event_intel.c:158:2: warning: (near initialization for 'intel_snb_extra_regs[2]') [-Wmissing-braces]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: braces around scalar initializer [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: (near initialization for 'intel_snb_extra_regs[2].msr') [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: excess elements in scalar initializer [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: (near initialization for 'intel_snb_extra_regs[2].msr') [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: excess elements in scalar initializer [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: (near initialization for 'intel_snb_extra_regs[2].msr') [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: excess elements in scalar initializer [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: (near initialization for 'intel_snb_extra_regs[2].msr') [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: excess elements in scalar initializer [enabled by default]
arch/x86/kernel/cpu/perf_event_intel.c:159:2: warning: (near initialization for 'intel_snb_extra_regs[2].msr') [enabled by default]
drivers/vhost/tcm_vhost.c:931:5: warning: unused variable 'target' [-Wunused-variable]
drivers/vhost/tcm_vhost.c:912:18: warning: unused variable 'i' [-Wunused-variable]
drivers/vhost/tcm_vhost.c:911:7: warning: unused variable 'match' [-Wunused-variable]
drivers/vhost/tcm_vhost.c:907:26: warning: unused variable 'tv_tport' [-Wunused-variable]
drivers/video/auo_k190x.c:535:25: warning: unused variable 'par' [-Wunused-variable]
net/netfilter/ipvs/ip_vs_dh.c:81:27: warning: '*((void *)&iph+32).ip6[3]' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/netfilter/ipvs/ip_vs_dh.c:81:40: warning: '*((void *)&iph+32).ip6[2]' may be used uninitialized in this function [-Wmaybe-uninitialized]
net/netfilter/ipvs/ip_vs_dh.c:81:27: warning: '*((void *)&iph+32).ip6[1]' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/android/sync.c:591:3: warning: format '%ld' expects argument of type 'long int', but argument 4 has type '__kernel_suseconds_t' [-Wformat]
drivers/vhost/tcm_vhost.c:911:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/vhost/tcm_vhost.c:931:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/vhost/tcm_vhost.c:981:1: warning: label 'err_tpg' defined but not used [-Wunused-label]
drivers/mmc/host/tmio_mmc_pio.c:798:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]
drivers/ssbi/ssbi.c:328:13: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: drivers/staging/zcache/zcache.o(.text+0x83bb): Section mismatch in reference from the function ramster_init() to the variable .init.data:use_frontswap_selfshrink
drivers/media/i2c/s5c73m3/s5c73m3-core.c:1389:19: warning: ignoring return value of 'regulator_enable', declared with attribute warn_unused_result [-Wunused-result]

[smatch]
sound/pci/fm801.c:1262 snd_fm801_create() warn: buffer overflow 'snd_fm801_tea575x_gpios' 3 <= 7
fs/autofs4/waitq.c:344 validate_request() warn: inconsistent returns mutex:&sbi->wq_mutex: locked (261 [(-2)], 267 [1], 275 [1], 296 [(-2)], 301 [1], 310 [0], 341 [0], 341 [1], 344 [1]) unlocked (293 [(-4)])
net/sched/sch_sfq.c:812 sfq_dump() warn: check that 'opt.limit' doesn't leak information
net/sunrpc/rpc_pipe.c:1047 rpc_get_sb_net() warn: inconsistent returns mutex:&sn->pipefs_sb_lock: locked (1045 [s32min-(-1),1-s32max]) unlocked (1047 [0])
drivers/base/devtmpfs.c:338 handle_remove() warn: inconsistent returns mutex:&parent.dentry->d_inode->i_mutex: locked (306 [(-4095)-(-1)]) unlocked (338 [(-2)], 338 [s32min-(-3),(-1),1-s32max], 338 [(-2)], 338 [0], 338 [0], 338 [s32min-(-1),1-s32max])
drivers/gpu/drm/i915/intel_display.c:6535 intel_crtc_page_flip() warn: inconsistent returns mutex:&dev->struct_mutex: locked (6448 [(-22)], 6457 [(-22)], 6461 [(-12)], 6481 [(-16)], 6535 [s32min-(-1),1-s32max], 6535 [s32min-(-1),1-s32max]) unlocked (6518 [0])
drivers/staging/ced1401/ced_ioc.c:855 WaitEvent() warn: inconsistent returns mutex:&pdx->io_mutex: locked (839 [(-1028)]) unlocked (826 [(-1029)], 855 [s32min-s32max])
net/ipv4/tcp_ipv4.c:1463 tcp_v4_conn_req_fastopen() warn: inconsistent returns spin_lock:&child->sk_lock.slock: locked (1394 [(-1)]) unlocked (1463 [0])
drivers/gpu/drm/nouveau/core/core/namedb.c:123 nouveau_namedb_get() warn: inconsistent returns read_lock:&namedb->lock: locked (123 [s32min-(-1),1-s32max]) unlocked (123 [0])
drivers/gpu/drm/nouveau/core/core/namedb.c:134 nouveau_namedb_get_class() warn: inconsistent returns read_lock:&namedb->lock: locked (134 [s32min-(-1),1-s32max]) unlocked (134 [0])
drivers/gpu/drm/nouveau/core/core/namedb.c:145 nouveau_namedb_get_vinst() warn: inconsistent returns read_lock:&namedb->lock: locked (145 [s32min-(-1),1-s32max]) unlocked (145 [0])
drivers/gpu/drm/nouveau/core/core/namedb.c:156 nouveau_namedb_get_cinst() warn: inconsistent returns read_lock:&namedb->lock: locked (156 [s32min-(-1),1-s32max]) unlocked (156 [0])
drivers/scsi/qla4xxx/ql4_os.c:6269 qla4xxx_sysfs_ddb_get_param() warn: always true condition '((fnode_sess->discovery_parent_idx) >= 0) => (0-u16max >= 0)'
drivers/scsi/qla4xxx/ql4_os.c:6565 qla4xxx_sysfs_ddb_set_param() warn: possible memory leak of 'fw_ddb_entry'
drivers/scsi/qla4xxx/ql4_os.c:6586 qla4xxx_sysfs_ddb_delete() warn: variable dereferenced before check 'fnode_sess' (see line 6576)
drivers/scsi/qla4xxx/ql4_os.c:6626 qla4xxx_sysfs_ddb_delete() error: potential NULL dereference 'fw_ddb_entry'.
drivers/net/wireless/iwlwifi/dvm/tx.c:691 iwlagn_tx_agg_flush() error: buffer overflow 'priv->tid_data' 16 <= 255
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:768 brcmf_sdio_chip_cm3_exitdl() error: buffer overflow 'ci->c_inf' 6 <= 6
drivers/net/wireless/brcm80211/brcmfmac/sdio_chip.c:860 brcmf_sdio_chip_cr4_exitdl() error: buffer overflow 'ci->c_inf' 6 <= 6
drivers/gpu/drm/qxl/qxl_display.c:99 qxl_alloc_client_monitors_config() error: dereferencing freed memory 'qdev->client_monitors_config'
drivers/gpu/drm/qxl/qxl_object.c:66 qxl_ttm_placement_from_domain() warn: bitwise AND condition is false here
drivers/gpu/drm/qxl/qxl_ioctl.c:353 qxl_clientcap_ioctl() warn: buffer overflow 'qdev->rom->client_capabilities' 58 <= 58

[coccinelle]
arch/x86/mm/pageattr.c:727:3-9: preceding lock on line 722
arch/x86/mm/pageattr.c:727:3-9: preceding lock on line 722
arch/x86/kernel/smpboot.c:1244:1-2: code aligned with following code on line 1251
arch/x86/kernel/smpboot.c:1244:1-2: code aligned with following code on line 1251

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
