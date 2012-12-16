From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 16 Dec 2012 19:50:13 +0000
Subject: build regressions 2012-12-16
Message-Id: <50ce25f5.HSy7oO1Xg2rjXytA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-omap2/common.c:19:23: fatal error: plat/vram.h: No such file or directory
(.init.text+0x206b): undefined reference to `level3_ident_pgt'
(.init.text+0x20bb): undefined reference to `level2_ident_pgt'
kernel/sched/core.c:2542:41: error: 'struct cfs_rq' has no member named 'runnable_load_avg'
kernel/sched/fair.c:2683:40: error: 'struct cfs_rq' has no member named 'runnable_load_avg'

[warnings]
arch/x86/kernel/setup.c:586:6: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/video/omap2/dss/dispc.c:3074:7: warning: 'rf' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/video/omap2/dss/dispc.c:3073:7: warning: 'onoff' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/video/omap2/dss/dispc.c:3076:7: warning: 'ipc' may be used uninitialized in this function [-Wmaybe-uninitialized]

[smatch]
drivers/staging/bcm/CmHost.c:1274 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (8255). (psfCSType->cCPacketClassificationRule.u8ProtocolDestPortRange s32min-s32max)
drivers/staging/bcm/CmHost.c:1274 DumpCmControlPacket() Function too hairy.  Giving up.
drivers/staging/comedi/drivers/ni_mio_cs.c:452 mio_cs_attach() info: why not propagate 'ret' from request_irq() instead of (-22)?
drivers/staging/bcm/CmHost.c:1242 DumpCmControlPacket() debug: remove_pools: nr_children over 4000 (5597). (psfCSType 4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-s64max,4096-s64max,4096-(-1),4096-s64max,4096-(-1),4096-s64max,)
drivers/video/omap2/dss/dsi.c:1386 dsi_pll_calc_clock_div_pck() debug: sval_binop_unsigned: divide by zero
drivers/video/omap2/dss/dsi.c:1486 dsi_pll_calc_ddrfreq() debug: sval_binop_unsigned: divide by zero
drivers/staging/vt6656/wpactl.c:672 wpa_get_scan() error: buffer overflow 'pMgmt->sBSSList' 42 <= 65534
drivers/staging/vt6656/wpactl.c:676 wpa_get_scan() warn: buffer overflow 'pMgmt->sBSSList' 42 <= 65534
drivers/acpi/proc.c:401 acpi_system_write_wakeup_device() warn: unsigned 'len' is never less than zero.
drivers/net/wireless/orinoco/orinoco_usb.c:993 ezusb_read_ltv() warn: unsigned 'bufsize' is never less than zero.
drivers/staging/iio/accel/adis16203_ring.c:97 adis16203_read_ring_data() debug: sval_binop_signed: divide by zero
drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c:2460 i_APCI3120_InsnBitsDigitalOutput() warn: unsigned '*data + 0' is never less than zero.
drivers/staging/comedi/drivers/amplc_pci224.c:891 pci224_ao_cmdtest() warn: impossible condition '(cmd->scan_begin_arg > 4294967295) => (0-u32max > u32max)'
drivers/staging/comedi/drivers/amplc_pci230.c:1367 pci230_ao_cmdtest() warn: impossible condition '(cmd->scan_begin_arg > 4294967295) => (0-u32max > u32max)'
drivers/staging/comedi/drivers/amplc_pci230.c:1834 pci230_ai_cmdtest() warn: impossible condition '(cmd->convert_arg > 4294967295) => (0-u32max > u32max)'
drivers/staging/telephony/ixj.c:6829 ixj_selfprobe() warn: add some parenthesis here?
drivers/edac/mce_amd.c:564 amd_decode_nb_mce() error: buffer overflow 'nb_mce_desc' 19 <= 28
net/wireless/nl80211.c:6282 nl80211_set_cqm_txe() warn: unsigned 'rate' is never less than zero.
net/wireless/nl80211.c:6283 nl80211_set_cqm_txe() warn: unsigned 'intvl' is never less than zero.
drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c:10121 bnx2x_848x3_config_init() error: buffer overflow 'params->req_duplex' 2 <= 5
drivers/usb/otg/twl6030-usb.c:125 twl6030_readb() warn: always true condition '(ret >= 0) => (0-255 >= 0)'
drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c:111 vmw_get_cap_3d_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
kernel/signal.c:1035 userns_fixup_signal_uid() debug: could not get condition type
drivers/usb/serial/usb_wwan.c:505 usb_wwan_port_probe() warn: impossible condition '(port->bulk_out_endpointAddress = -1) => (0-255 = (-1))'
drivers/connector/cn_proc.c:312 cn_proc_mcast_ctl() debug: could not get condition type
kernel/audit.c:575 audit_netlink_ok() debug: could not get condition type
kernel/taskstats.c:297 add_del_listener() debug: could not get condition type
kernel/user_namespace.c:799 userns_install() debug: could not get condition type
net/netfilter/xt_owner.c:26 owner_check() debug: could not get condition type

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
