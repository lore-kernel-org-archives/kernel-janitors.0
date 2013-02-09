From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 09 Feb 2013 16:40:14 +0000
Subject: build regressions 2013-02-09
Message-Id: <51167bee.7t35aL3ky4L5IRzK%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/thermal/rcar_thermal.c:479:56: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__devinitconst'
drivers/thermal/rcar_thermal.c:488:21: error: 'rcar_thermal_dt_ids' undeclared here (not in a function)
(.text+0x1f0): undefined reference to `tegra_uart_config'
gpiolib.c:(.text+0xda3): undefined reference to `gpiod_unexport'
(.text+0x147f): undefined reference to `gpiod_export'
drivers/cpufreq/cpufreq.c:1774:4: error: 'driver' undeclared (first use in this function)
initramfs_sig.c:(.init.text+0x1971): undefined reference to `mod_verify_sig'
drivers/firmware/efi/sysfs.c:103:35: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:109:23: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:119:35: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:125:5: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:126:2: error: implicit declaration of function 'efivar_entry_get' [-Werror=implicit-function-declaration]
drivers/firmware/efi/sysfs.c:126:34: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:126:52: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:126:67: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:129:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:131:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:133:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:135:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:137:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:140:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:144:9: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:152:35: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:158:5: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:159:34: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:159:52: error: dereferencing pointer to incomplete type
drivers/firmware/efi/sysfs.c:159:67: error: dereferencing pointer to incomplete type
drivers/firmware/google/gsmi.c:462:21: error: variable 'efivar_ops' has initializer but incomplete type
drivers/firmware/google/gsmi.c:463:2: error: unknown field 'get_variable' specified in initializer
drivers/firmware/google/gsmi.c:464:2: error: unknown field 'set_variable' specified in initializer
drivers/firmware/google/gsmi.c:465:2: error: unknown field 'get_next_variable' specified in initializer
drivers/firmware/google/gsmi.c:885:2: error: implicit declaration of function 'efivars_register' [-Werror=implicit-function-declaration]
drivers/firmware/google/gsmi.c:894:3: error: implicit declaration of function 'efivars_unregister' [-Werror=implicit-function-declaration]
net/mac80211/mesh.h:384:20: error: static declaration of 'mesh_sta_cleanup' follows non-static declaration
efivars.c:(.text+0x1529fc): undefined reference to `efivar_create_sysfs_entry'
efivars.c:(.init.text+0xea92): undefined reference to `efivars_sysfs_init'
drivers/gpio/gpio-mcp23s08.c:553:3: error: too few arguments to function 'of_get_mcp23s08_pdata'
drivers/gpio/gpio-mcp23s08.c:607:21: error: 'mcp23s08_of_match' undeclared here (not in a function)
drivers/gpio/gpio-mcp23s08.c:649:3: error: too few arguments to function 'of_get_mcp23s08_pdata'
drivers/firmware/google/gsmi.c:891:2: error: implicit declaration of function 'efivars_sysfs_init' [-Werror=implicit-function-declaration]

[warnings]
drivers/firmware/efi/sysfs.c:86:26: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:86:26: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/firmware/efi/sysfs.c:87:26: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:101:25: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:117:25: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:150:25: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:167:25: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:186:25: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:229:24: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:252:29: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:252:29: warning: (near initialization for 'var') [enabled by default]
drivers/firmware/efi/sysfs.c:260:3: warning: passing argument 1 of 'efivar_attr->show' from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:268:29: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:268:29: warning: (near initialization for 'var') [enabled by default]
drivers/firmware/efi/sysfs.c:276:3: warning: passing argument 1 of 'efivar_attr->store' from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:288:29: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:288:29: warning: (near initialization for 'var') [enabled by default]
drivers/firmware/efi/sysfs.c:292:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:292:8: warning: (near initialization for 'efivar_attr_guid.show') [enabled by default]
drivers/firmware/efi/sysfs.c:293:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:293:8: warning: (near initialization for 'efivar_attr_attributes.show') [enabled by default]
drivers/firmware/efi/sysfs.c:294:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:294:8: warning: (near initialization for 'efivar_attr_size.show') [enabled by default]
drivers/firmware/efi/sysfs.c:295:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:295:8: warning: (near initialization for 'efivar_attr_data.show') [enabled by default]
drivers/firmware/efi/sysfs.c:296:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:296:8: warning: (near initialization for 'efivar_attr_raw_var.show') [enabled by default]
drivers/firmware/efi/sysfs.c:296:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:296:8: warning: (near initialization for 'efivar_attr_raw_var.store') [enabled by default]
drivers/firmware/efi/sysfs.c:314:26: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:381:2: warning: passing argument 1 of 'efivar_unregister' from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:396:34: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:501:42: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:503:2: warning: passing argument 1 of 'efivar_create_sysfs_entry' from incompatible pointer type [enabled by default]
drivers/firmware/efi/sysfs.c:507:40: warning: 'struct efivar_entry' declared inside parameter list [enabled by default]
drivers/firmware/efi/sysfs.c:510:2: warning: passing argument 1 of 'efivar_unregister' from incompatible pointer type [enabled by default]
drivers/firmware/google/gsmi.c:463:2: warning: excess elements in struct initializer [enabled by default]
drivers/firmware/google/gsmi.c:463:2: warning: (near initialization for 'efivar_ops') [enabled by default]
drivers/firmware/google/gsmi.c:464:2: warning: excess elements in struct initializer [enabled by default]
drivers/firmware/google/gsmi.c:464:2: warning: (near initialization for 'efivar_ops') [enabled by default]
drivers/firmware/google/gsmi.c:465:2: warning: excess elements in struct initializer [enabled by default]
drivers/firmware/google/gsmi.c:465:2: warning: (near initialization for 'efivar_ops') [enabled by default]
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS && (EFI_VARS_GENERIC_OPS || GOOGLE_SMI))
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS && (EFI_VARS_GENERIC_OPS || GOOGLE_SMI))
warning: (GOOGLE_SMI) selects EFI_VARS_SYSFS which has unmet direct dependencies (EFI && EFI_VARS && (EFI_VARS_GENERIC_OPS || GOOGLE_SMI))
include/linux/pci-acpi.h:56:47: warning: 'struct acpi_pci_root' declared inside parameter list [enabled by default]
include/linux/pci-acpi.h:56:47: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/pci-acpi.h:57:50: warning: 'struct acpi_pci_root' declared inside parameter list [enabled by default]
drivers/gpio/gpio-mcp23s08.c:553:3: warning: passing argument 1 of 'of_get_mcp23s08_pdata' from incompatible pointer type [enabled by default]
drivers/gpio/gpio-mcp23s08.c:649:3: warning: passing argument 1 of 'of_get_mcp23s08_pdata' from incompatible pointer type [enabled by default]
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:3824:2: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat]
drivers/gpio/gpiolib.c:96:12: warning: 'gpiod_export' used but never defined [enabled by default]
drivers/gpio/gpiolib.c:100:13: warning: 'gpiod_unexport' used but never defined [enabled by default]
drivers/staging/iio/meter/ade7753.c:153:16: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/iio/meter/ade7753.c:353:9: warning: 'irqen' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/iio/meter/ade7759.c:310:9: warning: 'irqen' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
fs/nfsd/nfs4state.c:353:6: sparse: symbol 'free_stid' was not declared. Should it be static?
drivers/cpufreq/cpufreq.c:1159:41: sparse: incompatible types in comparison expression (different address spaces)
drivers/firmware/efivars.c:1703:9: sparse: context imbalance in 'efivar_entry_list_del_unlock' - unexpected unlock
drivers/firmware/efivars.c:1750:5: sparse: context imbalance in 'efivar_entry_delete' - wrong count at exit
drivers/firmware/efivars.c:1952:5: sparse: context imbalance in 'efivar_entry_set_get_size' - different lock contexts for basic block
drivers/firmware/efivars.c:2006:6: sparse: context imbalance in 'efivar_entry_iter_begin' - wrong count at exit
drivers/firmware/efivars.c:2017:6: sparse: context imbalance in 'efivar_entry_iter_end' - unexpected unlock
drivers/gpio/gpio-mcp23s08.c:553:48: sparse: incorrect type in argument 1 (different base types)
drivers/gpio/gpio-mcp23s08.c:553:46: sparse: not enough arguments for function of_get_mcp23s08_pdata
drivers/gpio/gpio-mcp23s08.c:649:46: sparse: not enough arguments for function of_get_mcp23s08_pdata
drivers/pci/ioapic.c:204:6: sparse: symbol 'acpi_pci_ioapic_add' was not declared. Should it be static?
drivers/pci/ioapic.c:216:6: sparse: symbol 'acpi_pci_ioapic_remove' was not declared. Should it be static?
drivers/acpi/container.c:180:13: sparse: symbol 'acpi_container_init' was not declared. Should it be static?
drivers/cpufreq/cpufreq.c:1027:14: sparse: undefined identifier 'driver'
drivers/firmware/efivars.c:306:16: sparse: symbol 'efi_kobj' was not declared. Should it be static?
drivers/gpio/gpio-mcp23s08.c:607:35: sparse: undefined identifier 'mcp23s08_of_match'

[smatch]
mm/memcontrol.c:5745 mem_cgroup_oom_control_write() warn: inconsistent returns mutex:&memcg_create_mutex: locked (5739) unlocked (5730,5745)
mm/pageowner.c:94 read_page_owner() error: potential NULL dereference 'page'.
kernel/synchro-test.c:519 do_tests() warn: buffer overflow 'sp_comp' 64 <= 4294967294
kernel/synchro-test.c:522 do_tests() warn: buffer overflow 'mx_comp' 64 <= 4294967294
kernel/synchro-test.c:525 do_tests() warn: buffer overflow 'sm_comp' 64 <= 4294967294
kernel/synchro-test.c:528 do_tests() warn: buffer overflow 'rd_comp' 64 <= 4294967294
kernel/synchro-test.c:531 do_tests() warn: buffer overflow 'wr_comp' 64 <= 4294967294
kernel/synchro-test.c:534 do_tests() warn: buffer overflow 'dg_comp' 64 <= 4294967294
drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:4238 brcmf_notify_vif_event() warn: inconsistent returns mutex:&event->vif_event_lock: locked (4211) unlocked (4223,4232,4238)
drivers/pci/hotplug/ibmphp_hpc.c:601 ibmphp_hpc_readslot() error: we previously assumed 'pstatus' could be null (see line 547)
drivers/firmware/efivars.c:1765 efivar_entry_delete() warn: inconsistent returns spin_lock:&__efivars->lock: locked (1765) unlocked (1761)
drivers/media/usb/tm6000/tm6000-video.c:1463 __tm6000_poll() error: potentially dereferencing uninitialized 'buf'.
drivers/media/usb/em28xx/em28xx-input.c:285 em28xx_i2c_ir_handle_key() warn: 'client' puts 676 bytes on stack

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
