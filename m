From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 18 Nov 2012 04:15:32 +0000
Subject: build regressions 2012-11-17
Message-Id: <50a860e4.XGzcYcY337kvGABv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/trace/trace.h:16:47: error: asm/syscall.h: No such file or directory
drivers/i2c/busses/i2c-ocores.c:121:2: error: implicit declaration of function 'ioread32be' [-Werror=implicit-function-declaration]
drivers/i2c/busses/i2c-ocores.c:143:2: error: implicit declaration of function 'iowrite32be' [-Werror=implicit-function-declaration]
ERROR: "trace_clock_local" [kernel/rcutorture.ko] undefined!
ERROR: "ipv6_skip_exthdr" [net/openvswitch/openvswitch.ko] undefined!
drivers/staging/sb105x/sb_pci_mp.c:2838:27: error: 'STD_COM_FLAGS' undeclared (first use in this function)
kernel/signal.c:2144:2: error: too few arguments to function 'ptrace_signal_deliver'
arch/m68k/kernel/signal.c:111:6: error: conflicting types for 'ptrace_signal_deliver'
drivers/net/wireless/brcm80211/brcmfmac/usb.c:1140:2: error: implicit declaration of function 'vmalloc' [-Werror=implicit-function-declaration]
drivers/net/wireless/brcm80211/brcmfmac/usb.c:1512:3: error: implicit declaration of function 'vfree' [-Werror=implicit-function-declaration]
drivers/staging/sb105x/sb_pci_mp.h:22:25: fatal error: asm/segment.h: No such file or directory
rcutorture.c:(.text+0x53449): undefined reference to `trace_clock_local'

[warnings]
arch/x86/kernel/head32.c:34:5: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/media/usb/gspca/konica.c:246:13: warning: unused variable 'sd' [-Wunused-variable]
drivers/net/wireless/brcm80211/brcmfmac/usb.c:1140:18: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/i2c/busses/i2c-ocores.c:338:15: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:3513:30: warning: unused variable 'cfg' [-Wunused-variable]

[sparse]
drivers/gpu/drm/qxl/qxl_drv.h:331:9: sparse: constant 0xf000000000000000 is so big it is unsigned long long
drivers/gpu/drm/qxl/qxl_ioctl.c:7:5: sparse: symbol 'qxl_alloc_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:66:5: sparse: symbol 'qxl_incref_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:82:5: sparse: symbol 'qxl_decref_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:100:5: sparse: symbol 'qxl_map_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:124:15: sparse: symbol 'qxlhw_handle_to_bo' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:170:21: sparse: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/qxl/qxl_ioctl.c:149:5: sparse: symbol 'qxl_execbuffer_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:240:5: sparse: symbol 'qxl_update_area_ioctl' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ioctl.c:168:51: sparse: dereference of noderef expression
drivers/gpu/drm/qxl/qxl_image.c:303:6: sparse: symbol 'qxl_drop_image_cache' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:73:6: sparse: symbol 'qxl_ring_pop' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:93:6: sparse: symbol 'qxl_ring_wait_idle' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:255:6: sparse: symbol 'qxl_io_update_screen' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_gem.c:107:5: sparse: symbol 'qxl_gem_set_domain' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:164:23: sparse: symbol 'qxl_defio' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:604:27: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/qxl/qxl_fb.c:690:5: sparse: symbol 'qxl_parse_options' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:776:6: sparse: symbol 'qxl_fbdev_set_suspend' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:781:5: sparse: symbol 'qxl_fbdev_total_size' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_fb.c:791:6: sparse: symbol 'qxl_fbdev_robj_is_fb' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_ttm.c:326:15: sparse: symbol 'qxl_ttm_tt_create' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:232:5: sparse: symbol 'qxl_framebuffer_surface_dirty' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:411:6: sparse: symbol 'qxl_crtc_load_lut' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:426:5: sparse: symbol 'qdev_crtc_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:573:20: sparse: symbol 'qxl_best_encoder' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_display.c:664:5: sparse: symbol 'qdev_output_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_kms.c:102:19: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:69:5: sparse: symbol 'qxl_device_init' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_kms.c:190:21: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/qxl/qxl_kms.c:185:6: sparse: symbol 'qxl_device_fini' was not declared. Should it be static?
drivers/staging/sb105x/sb_pci_mp.c:776:26: sparse: incorrect type in argument 1 (different address spaces)
drivers/staging/sb105x/sb_pci_mp.c:1794:6: sparse: symbol 'mp_unregister_driver' was not declared. Should it be static?
net/unix/af_unix.c:1218:9: sparse: context imbalance in 'do_unix_stream_connect' - different lock contexts for basic block
drivers/iio/adc/ad7298.c:125:23: sparse: incorrect type in assignment (different base types)
drivers/iio/adc/ad7298.c:193:16: sparse: cast to restricted __be16
drivers/staging/sb105x/sb_ser_core.h:199:6: sparse: symbol 'sb_uart_write_wakeup' was not declared. Should it be static?
drivers/staging/sb105x/sb_ser_core.h:205:6: sparse: symbol 'sb_uart_update_timeout' was not declared. Should it be static?
drivers/staging/sb105x/sb_ser_core.h:243:14: sparse: symbol 'sb_uart_get_baud_rate' was not declared. Should it be static?
drivers/staging/sb105x/sb_ser_core.h:307:14: sparse: symbol 'sb_uart_get_divisor' was not declared. Should it be static?

[smatch]
drivers/staging/sb105x/sb_pci_mp.c:546 mp_startup() error: we previously assumed 'info->tty' could be null (see line 525)
drivers/staging/sb105x/sb_pci_mp.c:695 mp_flush_buffer() warn: variable dereferenced before check 'state' (see line 692)
drivers/staging/sb105x/sb_pci_mp.c:776 mp_get_info() warn: check that 'tmp.closing_wait2' doesn't leak information
drivers/staging/sb105x/sb_pci_mp.c:1565 mp_open() error: 'state' dereferencing possible ERR_PTR()
drivers/staging/sb105x/sb_pci_mp.c:1812 mp_unregister_driver() info: redundant null check on drv->state calling kfree()
drivers/staging/sb105x/sb_pci_mp.c:2853 multi_init_ports() warn: bitwise AND condition is false here
kernel/rcutree_plugin.h:2387 rcu_nocb_wait_gp() error: double unlock 'spin_lock:&rnp_root->lock'
drivers/net/wireless/brcm80211/brcmfmac/fweh.c:485 brcmf_fweh_process_event() error: potential null dereference 'event'.  (kzalloc returns null)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
