From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 07 Jun 2013 16:12:40 +0000
Subject: build regressions 2013-06-07
Message-Id: <51b20678.Vil+0/c3mkEB1a7m%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "__umoddi3" undefined!
(.text+0x1a74425): undefined reference to `__umoddi3'
arch/x86/built-in.o:(.data+0x2670): undefined reference to `default_setup_hpet_msi'

[warnings]
drivers/staging/keucr/transport.c:92:7: warning: unused variable 'blen' [-Wunused-variable]
drivers/gpu/drm/i915/intel_display.c:4908:21: warning: 'limit' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/usb/host/xhci.c:4747:8: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
warning: (KVMTOOL_TEST_ENABLE) selects VIRTIO_NET which has unmet direct dependencies (NETDEVICES && NET_CORE && VIRTIO)
drivers/gpu/drm/i915/cmi_dsi_display.c:242:21: warning: unused variable 'dev' [-Wunused-variable]
drivers/gpu/drm/i915/cmi_dsi_display.c:281:21: warning: unused variable 'dev' [-Wunused-variable]
drivers/gpu/drm/i915/cmi_dsi_display.c:293:21: warning: unused variable 'dev' [-Wunused-variable]
drivers/gpu/drm/i915/cmi_dsi_display.c:313:21: warning: unused variable 'dev' [-Wunused-variable]
drivers/gpu/drm/i915/cmi_dsi_display.c:127:11: warning: 'mcs_set_command_mode' defined but not used [-Wunused-variable]
WARNING: vmlinux.o(.text+0x5607ae): Section mismatch in reference from the function pcibios_add_device() to the function .init.text:early_ioremap()
WARNING: vmlinux.o(.text+0x560852): Section mismatch in reference from the function pcibios_add_device() to the function .init.text:early_iounmap()

[sparse]
arch/x86/kernel/tls.c:92:1: sparse: symbol 'SyS_set_thread_area' was not declared. Should it be static?
arch/x86/kernel/tls.c:140:1: sparse: symbol 'SyS_get_thread_area' was not declared. Should it be static?
fs/signalfd.c:317:1: sparse: symbol 'compat_SyS_signalfd4' was not declared. Should it be static?
fs/signalfd.c:338:1: sparse: symbol 'compat_SyS_signalfd' was not declared. Should it be static?
fs/read_write.c:983:1: sparse: symbol 'compat_SyS_sendfile' was not declared. Should it be static?
fs/read_write.c:1003:1: sparse: symbol 'compat_SyS_sendfile64' was not declared. Should it be static?
kernel/sys.c:1788:1: sparse: symbol 'compat_SyS_getrusage' was not declared. Should it be static?
fs/splice.c:1693:1: sparse: symbol 'compat_SyS_vmsplice' was not declared. Should it be static?
fs/dcookies.c:207:1: sparse: symbol 'compat_SyS_lookup_dcookie' was not declared. Should it be static?
ipc/compat.c:372:1: sparse: symbol 'compat_SyS_ipc' was not declared. Should it be static?
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: incorrect type in argument 1 (different address spaces)
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:398:24: sparse: cast removes address space of expression
ipc/compat.c:412:1: sparse: symbol 'compat_SyS_semctl' was not declared. Should it be static?
ipc/compat.c:417:1: sparse: symbol 'compat_SyS_msgsnd' was not declared. Should it be static?
ipc/compat.c:428:1: sparse: symbol 'compat_SyS_msgrcv' was not declared. Should it be static?
ipc/compat.c:551:1: sparse: symbol 'compat_SyS_shmat' was not declared. Should it be static?
drivers/tty/sysrq.c:56:5: sparse: symbol 'sysrq_reset_downtime_ms' was not declared. Should it be static?
ipc/util.c:822:22: sparse: context imbalance in 'ipcctl_pre_down' - different lock contexts for basic block
ipc/util.c:837:22: sparse: context imbalance in 'ipcctl_pre_down_nolock' - different lock contexts for basic block
include/linux/rcupdate.h:327:30: sparse: context imbalance in 'semctl_down' - unexpected unlock
drivers/firmware/efi/vars.c:426:33: sparse: context imbalance in 'efivar_init' - different lock contexts for basic block
drivers/firmware/efi/vars.c:495:9: sparse: context imbalance in 'efivar_entry_list_del_unlock' - unexpected unlock
drivers/firmware/efi/vars.c:542:5: sparse: context imbalance in 'efivar_entry_delete' - wrong count at exit
drivers/firmware/efi/vars.c:797:5: sparse: context imbalance in 'efivar_entry_set_get_size' - different lock contexts for basic block
drivers/firmware/efi/vars.c:877:6: sparse: context imbalance in 'efivar_entry_iter_begin' - wrong count at exit
drivers/firmware/efi/vars.c:888:6: sparse: context imbalance in 'efivar_entry_iter_end' - unexpected unlock
drivers/firmware/efi/efivars.c:228:66: sparse: Using plain integer as NULL pointer
drivers/firmware/efi/efivars.c:569:6: sparse: symbol 'efivars_sysfs_exit' was not declared. Should it be static?
drivers/i2c/busses/i2c-designware-platdrv.c:116:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/i2c/busses/i2c-designware-platdrv.c:117:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/radeon/atom.c:1396:17: sparse: cast to restricted __le32
drivers/gpu/drm/radeon/atom.c:1396:17: sparse: cast to restricted __le16
drivers/gpu/drm/radeon/atom.c:1400:31: sparse: cast to restricted __le16

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
