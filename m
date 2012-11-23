From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 23 Nov 2012 22:30:49 +0000
Subject: build regressions 2012-11-23
Message-Id: <50aff919.sdpzq3ukk4tJjyB6%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
net/bluetooth/hci_event.c:1199:33: error: 'HCI_OP_LE_SET_ADV_ENABLE' undeclared (first use in this function)
sound/soc/codecs/wm8994.c:3454:14: error: 'struct wm8994_priv' has no member named 'pdata'
sound/soc/codecs/wm8994.c:3454:29: error: invalid type argument of '->' (have 'struct wm8994_pdata')
net/mac80211/rx.c:1772:2: error: implicit declaration of function 'ieee80211_vif_is_softamp' [-Werror=implicit-function-declaration]
sound/pci/rme9652/hdsp.c:5103:4: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
sound/pci/rme9652/hdsp.c:5110:4: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
kernel/sys.c:1864:34: error: 'mmap_min_addr' undeclared (first use in this function)
sound/pci/emu10k1/emu10k1_main.c:717:10: error: 'struct snd_emu10k1' has no member named 'suspend'
drivers/gpu/drm/i915/intel_lvds.c:1098:34: error: 'mode' undeclared (first use in this function)
fs/nfs/nfs4proc.c:743:31: error: expected ')' before ';' token
fs/nfs/nfs4proc.c:747:2: error: expected expression before '}' token

[warnings]
drivers/media/tuners/max2165.c:206:11: warning: 'fraction' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/media/tuners/max2165.c:433:1: warning: 'quotient' may be used uninitialized in this function [-Wmaybe-uninitialized]
sound/pci/rme9652/hdsp.c:5103:22: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/video/fbmon.c:1446:2: warning: passing argument 1 of 'of_get_videomode' discards 'const' qualifier from pointer target type [enabled by default]
drivers/video/of_display_timing.c:216:2: warning: passing argument 1 of 'of_parse_phandle' discards 'const' qualifier from pointer target type [enabled by default]
fs/nfsd/nfs4recover.c:1052:41: warning: 'nfsd4_umh_tracking_ops' defined but not used [-Wunused-variable]

[sparse]
net/tipc/link.c:958:6: sparse: symbol 'tipc_link_send_sync' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:416:18: sparse: context imbalance in 'qxl_surface_alloc' - different lock contexts for basic block
sound/soc/codecs/wm8994.c:3454:50: sparse: cannot dereference this type
drivers/gpu/drm/i915/intel_lvds.c:1098:55: sparse: undefined identifier 'mode'
fs/nfs/nfs4proc.c:743:45: sparse: Expected ) after if
fs/nfs/nfs4proc.c:743:45: sparse: got ;
sound/soc/codecs/wm8994.c:3470:35: sparse: no member 'pdata' in struct wm8994_priv

[smatch]
drivers/gpu/drm/nouveau/core/core/falcon.c:190 _nouveau_falcon_init() error: potential NULL dereference 'falcon->data.data'.
drivers/gpu/drm/nouveau/core/core/falcon.c:190 _nouveau_falcon_init() error: we previously assumed 'falcon->data.data' could be null (see line 151)
drivers/video/omap2/displays/panel-acx565akm.c:543 acx_panel_probe() error: 'bldev' dereferencing possible ERR_PTR()
drivers/video/omap2/dss/dss.c:327 dss_select_dispc_clk_source() info: ignoring unreachable code.
drivers/video/omap2/dss/dss.c:361 dss_select_dsi_clk_source() info: ignoring unreachable code.
drivers/video/omap2/dss/dss.c:398 dss_select_lcd_clk_source() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:128 DISPC_DEFAULT_COLOR() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:145 DISPC_TRANS_COLOR() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:235 DISPC_SIZE_MGR() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:156 DISPC_TIMING_H() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:174 DISPC_TIMING_V() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:192 DISPC_POL_FREQ() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:210 DISPC_DIVISORo() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:246 DISPC_DATA_CYCLE1() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:264 DISPC_DATA_CYCLE2() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:282 DISPC_DATA_CYCLE3() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:300 DISPC_CPR_COEF_R() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:318 DISPC_CPR_COEF_G() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:336 DISPC_CPR_COEF_B() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:363 DISPC_OVL_BASE() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:380 DISPC_BA0_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:396 DISPC_BA1_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:451 DISPC_POS_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:467 DISPC_SIZE_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:484 DISPC_ATTR_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:521 DISPC_FIFO_THRESH_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:555 DISPC_ROW_INC_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:572 DISPC_PIX_INC_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:893 DISPC_PRELOAD_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:585 DISPC_WINDOW_SKIP_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:601 DISPC_TABLE_BA_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:613 DISPC_FIR_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:651 DISPC_PIC_SIZE_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:670 DISPC_ACCU0_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:708 DISPC_ACCU1_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:747 DISPC_FIR_COEF_H_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:787 DISPC_FIR_COEF_HV_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:827 DISPC_CONV_COEF_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:845 DISPC_FIR_COEF_V_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:405 DISPC_BA0_UV_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:425 DISPC_BA1_UV_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:631 DISPC_FIR2_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:688 DISPC_ACCU2_0_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:726 DISPC_ACCU2_1_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:766 DISPC_FIR_COEF_H2_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:806 DISPC_FIR_COEF_HV2_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:865 DISPC_FIR_COEF_V2_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:493 DISPC_ATTR2_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:867 dispc_ovl_set_color_mode() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:940 dispc_ovl_set_channel_out() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:997 dispc_ovl_get_channel_out() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.h:538 DISPC_FIFO_SIZE_STATUS_OFFSET() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1417 dispc_ovl_set_accu_uv() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1562 dispc_ovl_set_scaling_uv() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1692 color_mode_to_bpp() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1726 calc_vrfb_rotation_offset() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1812 calc_dma_rotation_offset() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:1963 calc_tiler_rotation_offset() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:2876 dispc_mgr_set_tft_data_lines() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:2902 dispc_mgr_set_io_pad_mode() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:3024 dispc_mgr_set_timings() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:3092 dispc_fclk_rate() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:3123 dispc_mgr_lclk_rate() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:3156 dispc_mgr_pclk_rate() info: ignoring unreachable code.
drivers/video/omap2/dss/dispc.c:3918 omap_dispc_wait_for_irq_interruptible_timeout() error: 'wait_for_completion_interruptible_timeout()' returns negative and 'timeout' is unsigned
drivers/video/omap2/dss/dispc.c:4130 omap_dispchw_probe() info: why not propagate 'dispc.irq' from platform_get_irq() instead of -19?
drivers/video/omap2/dss/display.c:311 omapdss_default_get_recommended_bpp() info: ignoring unreachable code.
drivers/video/omap2/dss/rfbi.c:664 rfbi_configure() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:461 dsi_get_pixel_size() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:1914 dsi_dump_dsidev_irqs() warn: 'stats' puts 776 bytes on stack
drivers/video/omap2/dss/dsi.c:2169 dsi_get_line_buf_size() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:2583 dsi_config_tx_fifo() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:2616 dsi_config_rx_fifo() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:2758 dsi_sync_vc() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:3329 dsi_vc_generic_send_read_request() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:4050 dsi_proto_config() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:4358 dsi_enable_video_output() info: ignoring unreachable code.
drivers/video/omap2/dss/dsi.c:5249 omap_dsihw_probe() info: why not propagate 'dsi->irq' from platform_get_irq() instead of -19?
drivers/video/omap2/omapfb/omapfb.h:158 fb2display() info: loop could be replaced with if statement.
drivers/video/omap2/omapfb/omapfb-main.c:2280 omapfb_find_best_mode() error: potential null dereference 'specs'.  (kzalloc returns null)
drivers/video/omap2/omapfb/omapfb-main.c:2391 omapfb_init_connections() error: potential NULL dereference 'mgr'.
drivers/video/omap2/omapfb/omapfb-ioctl.c:789 omapfb_ioctl() error: we previously assumed 'display' could be null (see line 789)
drivers/video/omap2/omapfb/omapfb-ioctl.c:789 omapfb_ioctl() error: we previously assumed 'display->output' could be null (see line 789)

[coccinelle]
drivers/gpu/drm/qxl/qxl_draw.c:66:1-11: second lock on line 66
drivers/gpu/drm/qxl/qxl_display.c:73:1-29: ERROR: reference preceded by free on line 60
drivers/gpu/drm/qxl/qxl_draw.c:57:11-18: WARNING: kzalloc should be used for release, instead of kmalloc/memset
drivers/gpu/drm/qxl/qxl_cmd.c:416:1-10: second lock on line 416

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
