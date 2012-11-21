From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 21 Nov 2012 17:17:40 +0000
Subject: build regressions 2012-11-21
Message-Id: <50ad0cb4.9HDyTIqhQycwQpFE%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/irqchip/irq-gic.c:794:1: error: 'gic_of_init' undeclared here (not in a function)
kernel/signal.c:3126:2: error: assignment of read-only variable '__pu_val'
drivers/irqchip/percpu-mux.c:33:18: error: field 'chip' has incomplete type
drivers/irqchip/percpu-mux.c:46:2: error: implicit declaration of function 'irq_data_get_irq_chip_data' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:71:15: error: variable 'percpu_mux' has initializer but incomplete type
drivers/irqchip/percpu-mux.c:72:2: error: unknown field 'name' specified in initializer
drivers/irqchip/percpu-mux.c:73:2: error: unknown field 'irq_enable' specified in initializer
drivers/irqchip/percpu-mux.c:74:2: error: unknown field 'irq_disable' specified in initializer
drivers/irqchip/percpu-mux.c:80:2: error: implicit declaration of function 'irq_alloc_desc' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:85:2: error: implicit declaration of function 'irq_set_percpu_devid' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:87:3: error: implicit declaration of function 'irq_free_desc' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:91:2: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:91:38: error: 'handle_percpu_devid_irq' undeclared (first use in this function)
drivers/irqchip/percpu-mux.c:93:2: error: implicit declaration of function 'irq_set_chip_data' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:99:9: error: implicit declaration of function 'irq_get_chip_data' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:100:2: error: implicit declaration of function 'generic_handle_irq' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:132:3: error: implicit declaration of function 'irq_set_status_flags' [-Werror=implicit-function-declaration]
drivers/irqchip/percpu-mux.c:132:29: error: 'IRQ_NOAUTOEN' undeclared (first use in this function)
mm/migrate.c:131:3: error: implicit declaration of function 'pmd_trans_huge' [-Werror=implicit-function-declaration]
mm/migrate.c:146:2: error: implicit declaration of function 'is_swap_pte' [-Werror=implicit-function-declaration]
mm/migrate.c:168:4: error: implicit declaration of function 'hugepage_add_anon_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:170:4: error: implicit declaration of function 'page_dup_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:172:3: error: implicit declaration of function 'page_add_anon_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:174:3: error: implicit declaration of function 'page_add_file_rmap' [-Werror=implicit-function-declaration]
mm/migrate.c:190:2: error: implicit declaration of function 'rmap_walk' [-Werror=implicit-function-declaration]
mm/migrate.c:461:2: error: implicit declaration of function 'ksm_migrate_page' [-Werror=implicit-function-declaration]
mm/migrate.c:771:3: error: implicit declaration of function 'page_get_anon_vma' [-Werror=implicit-function-declaration]
mm/migrate.c:840:3: error: implicit declaration of function 'put_anon_vma' [-Werror=implicit-function-declaration]
drivers/built-in.o:(.rodata+0x14): undefined reference to `sh7269_pinmux_info'
drivers/tty/serial/mfd.c:1246:19: error: 'serial_hsu_get_poll_char' undeclared here (not in a function)
drivers/tty/serial/mfd.c:1247:19: error: 'serial_hsu_put_poll_char' undeclared here (not in a function)
drivers/devfreq/governor_simpleondemand.c:36:11: error: dereferencing pointer to incomplete type
tps80031.c:(.init.text+0xb997): undefined reference to `i2c_register_driver'
tps80031.c:(.devexit.text+0x8f7): undefined reference to `i2c_unregister_device'
tps80031.c:(.devinit.text+0xb024): undefined reference to `i2c_new_dummy'
tps80031.c:(.devinit.text+0xb0a1): undefined reference to `devm_regmap_init_i2c'
tps80031.c:(.exit.text+0x6b9): undefined reference to `i2c_del_driver'
mm/memcontrol.c:3146:2: error: implicit declaration of function 'cgroup_name' [-Werror=implicit-function-declaration]
kernel/signal.c:3177:5: error: conflicting types for '__compat_save_altstack'
ERROR: "blkdev_read_iter" [drivers/char/raw.ko] undefined!

[warnings]
drivers/regulator/max8925-regulator.c:269:51: warning: 'regulator_idx' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/signal.c:3127:3: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/powerpc/kernel/signal_32.c:795:6: warning: passing argument 1 of '__compat_save_altstack' from incompatible pointer type [enabled by default]
drivers/irqchip/percpu-mux.c:39:42: warning: 'struct irq_data' declared inside parameter list [enabled by default]
drivers/irqchip/percpu-mux.c:39:42: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/irqchip/percpu-mux.c:46:12: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/irqchip/percpu-mux.c:72:2: warning: excess elements in struct initializer [enabled by default]
drivers/irqchip/percpu-mux.c:72:2: warning: (near initialization for 'percpu_mux') [enabled by default]
drivers/irqchip/percpu-mux.c:99:37: warning: initialization makes pointer from integer without a cast [enabled by default]
mm/migrate.c:771:12: warning: assignment makes pointer from integer without a cast [enabled by default]
arch/tile/kernel/compat_signal.c:288:2: warning: passing argument 1 of '__compat_save_altstack' from incompatible pointer type [enabled by default]
drivers/net/wireless/brcm80211/brcmsmac/main.c:1052:2: warning: 'core' is used uninitialized in this function [-Wuninitialized]
drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c:411:15: warning: 'node' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/iio/imu/adis16480.c:302:16: warning: 'freq' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/virtio/virtio_balloon.c:145:10: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'unsigned int' [-Wformat]
mm/memcontrol.c:3146:9: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: vmlinux.o(.text+0x781cab): Section mismatch in reference from the function acpi_pci_root_add() to the function .devinit.text:pci_acpi_scan_root()
kernel/signal.c:3127:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
kernel/signal.c:3180:2: warning: passing argument 1 of 'ptr_to_compat' makes pointer from integer without a cast [enabled by default]
arch/x86/ia32/ia32_signal.c:469:3: warning: passing argument 1 of '__compat_save_altstack' from incompatible pointer type [enabled by default]
arch/x86/kernel/signal.c:498:3: warning: passing argument 1 of '__compat_save_altstack' from incompatible pointer type [enabled by default]
drivers/mfd/tps65090.c:140:11: warning: 'mask' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/mfd/tps65090.c:140:11: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/devfreq/governor_simpleondemand.c:36:25: sparse: using member 'upthreshold' in incomplete struct devfreq_simple_ondemand_data
drivers/devfreq/governor_simpleondemand.c:38:25: sparse: using member 'downdifferential' in incomplete struct devfreq_simple_ondemand_data
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:1645:5: sparse: symbol 'vmw_user_dmabuf_alloc' was not declared. Should it be static?
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:1760:5: sparse: symbol 'vmw_user_dmabuf_reference' was not declared. Should it be static?
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:2199:5: sparse: symbol 'vmw_resource_check_buffer' was not declared. Should it be static?
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:2278:6: sparse: symbol 'vmw_resource_backoff_reservation' was not declared. Should it be static?
drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:2297:5: sparse: symbol 'vmw_resource_do_evict' was not declared. Should it be static?
drivers/gpu/drm/vmwgfx/vmwgfx_context.c:87:24: sparse: incorrect type in assignment (different base types)
drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:280:26: sparse: incorrect type in assignment (different base types)
drivers/net/wireless/brcm80211/brcmsmac/main.c:308:10: sparse: symbol 'wlc_prio2prec_map' was not declared. Should it be static?
drivers/net/wireless/brcm80211/brcmsmac/mac80211_if.c:573:17: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/nouveau/core/engine/disp/nv50.c:242:20: sparse: expression using sizeof(void)
drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c:140:20: sparse: expression using sizeof(void)
drivers/irqchip/percpu-mux.c:119:43: sparse: incorrect type in argument 2 (different base types)
drivers/irqchip/percpu-mux.c:108:17: sparse: symbol 'alloc_percpu_irq_mux' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c:59:18: sparse: unknown field name in initializer
arch/x86/boot/compressed/eboot.c:785:9: sparse: undefined identifier 'memcpy'

[smatch]
drivers/devfreq/devfreq.c:595 devfreq_remove_governor() error: 'g' dereferencing possible ERR_PTR()

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
