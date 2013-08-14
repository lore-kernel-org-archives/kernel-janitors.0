From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 14 Aug 2013 17:24:29 +0000
Subject: build regressions 2013-08-14
Message-Id: <520bbd4d.h7d2opPz9sEp8n26%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/host/fotg210-hcd.c:5856:2: error: implicit declaration of function 'iowrite32' [-Werror=implicit-function-declaration]
drivers/usb/host/fotg210-hcd.c:5859:2: error: implicit declaration of function 'ioread32' [-Werror=implicit-function-declaration]
(.text+0x160736): undefined reference to `__tracepoint_nfs4_setclientid'
(.text+0x160847): undefined reference to `__tracepoint_nfs4_setclientid_confirm'
(.text+0x161204): undefined reference to `__tracepoint_nfs4_bind_conn_to_session'
(.text+0x16150f): undefined reference to `__tracepoint_nfs4_exchange_id'
(.text+0x1616b6): undefined reference to `__tracepoint_nfs4_destroy_clientid'
(.text+0x161a78): undefined reference to `__tracepoint_nfs4_create_session'
(.text+0x161ba4): undefined reference to `__tracepoint_nfs4_destroy_session'
fs/built-in.o:(__jump_table+0x80c): undefined reference to `__tracepoint_nfs4_setclientid'
fs/built-in.o:(__jump_table+0x818): undefined reference to `__tracepoint_nfs4_setclientid_confirm'
fs/built-in.o:(__jump_table+0x824): undefined reference to `__tracepoint_nfs4_bind_conn_to_session'
fs/built-in.o:(__jump_table+0x830): undefined reference to `__tracepoint_nfs4_exchange_id'
fs/built-in.o:(__jump_table+0x83c): undefined reference to `__tracepoint_nfs4_destroy_clientid'
fs/built-in.o:(__jump_table+0x848): undefined reference to `__tracepoint_nfs4_create_session'
fs/built-in.o:(__jump_table+0x854): undefined reference to `__tracepoint_nfs4_destroy_session'
nfs4proc.c:(.text+0x15d88f): undefined reference to `__tracepoint_nfs4_close'
fs/built-in.o:(__jump_table+0x80c): undefined reference to `__tracepoint_nfs4_close'
nfs4proc.c:(.text+0x15fd83): undefined reference to `__tracepoint_nfs4_unlock'
fs/built-in.o:(__jump_table+0x860): undefined reference to `__tracepoint_nfs4_unlock'
nfs4proc.c:(.text+0x15d134): undefined reference to `__tracepoint_nfs4_set_security_label'
fs/built-in.o:(__jump_table+0x824): undefined reference to `__tracepoint_nfs4_set_security_label'
nfs4proc.c:(.text+0x15abad): undefined reference to `__tracepoint_nfs4_rename_async'
fs/built-in.o:(__jump_table+0x80c): undefined reference to `__tracepoint_nfs4_rename_async'
(.text+0x16e682): undefined reference to `__tracepoint_nfs4_set_delegation'
(.text+0x16e808): undefined reference to `__tracepoint_nfs4_reclaim_delegation'
(.text+0x172005): undefined reference to `__tracepoint_nfs4_recall_delegation'
fs/built-in.o:(__jump_table+0x9b0): undefined reference to `__tracepoint_nfs4_set_delegation'
fs/built-in.o:(__jump_table+0x9bc): undefined reference to `__tracepoint_nfs4_reclaim_delegation'
fs/built-in.o:(__jump_table+0x9c8): undefined reference to `__tracepoint_nfs4_recall_delegation'
(.text+0x16fef0): undefined reference to `__tracepoint_nfs4_map_name_to_uid'
(.text+0x17001e): undefined reference to `__tracepoint_nfs4_map_group_to_gid'
(.text+0x1701d8): undefined reference to `__tracepoint_nfs4_map_uid_to_name'
(.text+0x1702f9): undefined reference to `__tracepoint_nfs4_map_gid_to_group'
fs/built-in.o:(__jump_table+0x9c8): undefined reference to `__tracepoint_nfs4_map_name_to_uid'
fs/built-in.o:(__jump_table+0x9d4): undefined reference to `__tracepoint_nfs4_map_group_to_gid'
fs/built-in.o:(__jump_table+0x9e0): undefined reference to `__tracepoint_nfs4_map_uid_to_name'
fs/built-in.o:(__jump_table+0x9ec): undefined reference to `__tracepoint_nfs4_map_gid_to_group'
nfs4proc.c:(.text+0x15c8d2): undefined reference to `__tracepoint_nfs4_lookup_root'
nfs4proc.c:(.text+0x15ca38): undefined reference to `__tracepoint_nfs4_fsinfo'
nfs4proc.c:(.text+0x15d0c7): undefined reference to `__tracepoint_nfs4_getattr'
fs/built-in.o:(__jump_table+0x824): undefined reference to `__tracepoint_nfs4_lookup_root'
fs/built-in.o:(__jump_table+0x830): undefined reference to `__tracepoint_nfs4_fsinfo'
fs/built-in.o:(__jump_table+0x848): undefined reference to `__tracepoint_nfs4_getattr'
setup.c:(.text+0x0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
multicalls.c:(.text+0x0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
mmu.c:(.text+0x1f60): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
irq.c:(.text+0x1d0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
time.c:(.text+0x5b0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
suspend.c:(.text+0x20): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
platform-pci-unplug.c:(.text+0x0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
p2m.c:(.text+0x0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
smp.c:(.text+0xc00): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
apic.c:(.text+0x90): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
vga.c:(.text+0x0): multiple definition of `xen_init_spinlocks_pv'
arch/x86/xen/enlighten.o:enlighten.c:(.text+0x12f0): first defined here
arch/x86/xen/spinlock.c:393:11: error: 'irq_name' undeclared (first use in this function)
arch/x86/xen/spinlock.c:410:16: error: 'irq_name' undeclared (first use in this function)
arch/x86/xen/spinlock.c:288:3: error: implicit declaration of function 'jump_label_get_branch_default' [-Werror=implicit-function-declaration]
ERROR: "xfrm_local_error" [net/ipv6/ipv6.ko] undefined!
kernel/sched/debug.c:562:64: error: expected ';' before ')' token
kernel/sched/debug.c:562:64: error: expected statement before ')' token
ERROR: "__tracepoint_nfs4_close" undefined!
ERROR: "__tracepoint_nfs4_unlock" undefined!
ERROR: "__tracepoint_nfs4_remove_async" undefined!
ERROR: "__tracepoint_nfs4_set_security_label" undefined!
ERROR: "__tracepoint_nfs4_rename_async" undefined!
ERROR: "__tracepoint_nfs4_reclaim_delegation" undefined!
ERROR: "__tracepoint_nfs4_recall_delegation" undefined!
ERROR: "__tracepoint_nfs4_set_delegation" undefined!
ERROR: "__tracepoint_nfs4_map_gid_to_group" undefined!
ERROR: "__tracepoint_nfs4_map_name_to_uid" undefined!
ERROR: "__tracepoint_nfs4_map_group_to_gid" undefined!
ERROR: "__tracepoint_nfs4_map_uid_to_name" undefined!
ERROR: "__tracepoint_nfs4_lookup_root" undefined!
ERROR: "__tracepoint_nfs4_fsinfo" undefined!
ERROR: "__tracepoint_nfs4_getattr" undefined!
fs/built-in.o:(.toc+0x0): undefined reference to `__tracepoint_nfs4_setclientid'
fs/built-in.o:(.toc+0x8): undefined reference to `__tracepoint_nfs4_setclientid_confirm'
fs/built-in.o:(.toc+0x10): undefined reference to `__tracepoint_nfs4_bind_conn_to_session'
fs/built-in.o:(.toc+0x18): undefined reference to `__tracepoint_nfs4_exchange_id'
fs/built-in.o:(.toc+0x20): undefined reference to `__tracepoint_nfs4_destroy_clientid'
fs/built-in.o:(.toc+0x28): undefined reference to `__tracepoint_nfs4_create_session'
fs/built-in.o:(.toc+0x30): undefined reference to `__tracepoint_nfs4_destroy_session'
fs/built-in.o:(.toc+0x8): undefined reference to `__tracepoint_nfs4_close'
fs/built-in.o:(.toc+0x18): undefined reference to `__tracepoint_nfs4_unlock'
fs/built-in.o:(.toc+0x0): undefined reference to `__tracepoint_nfs4_rename_async'
fs/built-in.o:(.toc+0x108): undefined reference to `__tracepoint_nfs4_set_delegation'
fs/built-in.o:(.toc+0x110): undefined reference to `__tracepoint_nfs4_reclaim_delegation'
fs/built-in.o:(.toc+0x118): undefined reference to `__tracepoint_nfs4_recall_delegation'
fs/built-in.o:(.toc+0x118): undefined reference to `__tracepoint_nfs4_map_name_to_uid'
fs/built-in.o:(.toc+0x120): undefined reference to `__tracepoint_nfs4_map_group_to_gid'
fs/built-in.o:(.toc+0x128): undefined reference to `__tracepoint_nfs4_map_uid_to_name'
fs/built-in.o:(.toc+0x130): undefined reference to `__tracepoint_nfs4_map_gid_to_group'
fs/built-in.o:(.toc+0x10): undefined reference to `__tracepoint_nfs4_lookup_root'
fs/built-in.o:(.toc+0x18): undefined reference to `__tracepoint_nfs4_fsinfo'
fs/built-in.o:(.toc+0x28): undefined reference to `__tracepoint_nfs4_getattr'
arch/powerpc/kernel/udbg_16550.c:305:6: error: 'udbg_comport' undeclared (first use in this function)
arch/powerpc/kernel/udbg_16550.c:313:6: error: 'udbg_comport' undeclared (first use in this function)
arch/powerpc/kernel/udbg_16550.c:323:6: error: 'udbg_comport' undeclared (first use in this function)
arch/powerpc/kernel/udbg_16550.c:333:6: error: 'udbg_comport' undeclared (first use in this function)
arch/powerpc/kernel/udbg_16550.c:311:13: error: 'udbg_wsp_putc' defined but not used [-Werror=unused-function]
arch/powerpc/kernel/udbg_16550.c:321:12: error: 'udbg_wsp_getc' defined but not used [-Werror=unused-function]
arch/powerpc/kernel/udbg_16550.c:331:12: error: 'udbg_wsp_getc_poll' defined but not used [-Werror=unused-function]
drivers/target/mlx4_fc/mfc.c:347:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:349:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:427:2: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:1738:2: error: implicit declaration of function 'ioremap' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc.c:1790:2: error: implicit declaration of function 'iounmap' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:156:2: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:638:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_rfci.c:640:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:116:3: error: implicit declaration of function 'pci_unmap_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:941:2: error: implicit declaration of function 'pci_map_single' [-Werror=implicit-function-declaration]
drivers/target/mlx4_fc/mfc_exch.c:942:2: error: implicit declaration of function 'pci_dma_mapping_error' [-Werror=implicit-function-declaration]
ERROR: "__tracepoint_nfs4_lookup_root" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_bind_conn_to_session" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_rename_async" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_unlock" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_exchange_id" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_fsinfo" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_reclaim_delegation" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_remove_async" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_setclientid_confirm" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_setclientid" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_map_gid_to_group" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_set_security_label" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_destroy_clientid" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_map_name_to_uid" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_close" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_map_group_to_gid" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_map_uid_to_name" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_create_session" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_getattr" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_recall_delegation" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_destroy_session" [fs/nfs/nfsv4.ko] undefined!
ERROR: "__tracepoint_nfs4_set_delegation" [fs/nfs/nfsv4.ko] undefined!
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here
arch/x86/xen/enlighten.o:(.text+0x1255): first defined here

[warnings]
drivers/target/mlx4_fc/mfc.c:1232: warning: integer constant is too large for 'long' type
drivers/target/mlx4_fc/fcoib_discover.c:1812: warning: integer constant is too large for 'long' type
drivers/target/mlx4_fc/mfc.c:866: warning: 'u64_to_wwpn' defined but not used
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344: warning: format '%016lx' expects type 'long unsigned int', but argument 2 has type 'u64'
drivers/target/mlx4_fc/mlx4_fc_configfs.c:344: warning: format '%016lx' expects type 'long unsigned int', but argument 3 has type 'u64'
drivers/target/mlx4_fc/mfc.c:1405: warning: too few arguments for format
WARNING: drivers/target/built-in.o(.init.text+0xa3e): Section mismatch in reference from the function _mfc_init() to the function .exit.text:_mlx4_fc_deregister_configfs()
drivers/cpufreq/speedstep-smi.c:260:15: warning: unused variable 'state' [-Wunused-variable]
kernel/sched/debug.c:562:3: warning: statement with no effect [-Wunused-value]
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1688:3: warning: passing argument 1 of 'kvm_do_schedule' from incompatible pointer type [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: 'struct kvm_vcpu' declared inside parameter list [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: 'struct kvm_vcpu' declared inside parameter list [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: 'struct kvm_vcpu' declared inside parameter list [enabled by default]
arch/s390/include/asm/kvm_host.h:277:43: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/target/mlx4_fc/mfc.c:1738:19: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/target/mlx4_fc/mfc.c:1405:2: warning: format '%u' expects a matching 'unsigned int' argument [-Wformat=]
drivers/target/mlx4_fc/fcoe_main.c:295:5: warning: unused variable 'fh_d_id' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:293:20: warning: unused variable 'ofc_ctlr' [-Wunused-variable]
drivers/target/mlx4_fc/fcoe_main.c:468:2: warning: #warning FIXME: schedule_delayed_work disabled in link_state_changed [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:534:2: warning: #warning FIXME: schedule_delayed_work disabled in add_port [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:207:2: warning: #warning FIXME: Hardcoded initiator physical mac [-Wcpp]
drivers/target/mlx4_fc/fcoe_main.c:287:2: warning: #warning FIXME: Hardcoded fcoe target mac [-Wcpp]
WARNING: drivers/target/mlx4_fc/mlx4_fc.o(.init.literal+0x44): Section mismatch in reference from the (unknown reference) (unknown) to the function .exit.text:mlx4_fc_deregister_configfs()

[sparse]
arch/x86/xen/setup.c:531:16: sparse: symbol 'xen_enable_nmi' was not declared. Should it be static?
drivers/char/tpm/xen-tpmfront.c:145:9: sparse: symbol 'tpm_show_locality' was not declared. Should it be static?
drivers/char/tpm/xen-tpmfront.c:155:9: sparse: symbol 'tpm_store_locality' was not declared. Should it be static?
drivers/char/tpm/xen-tpmfront.c:449:8: sparse: Using plain integer as NULL pointer
fs/nfs/./nfs4trace.h:230:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:230:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:230:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:230:1: sparse: cast from restricted fmode_t
fs/nfs/./nfs4trace.h:293:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:293:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:293:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:293:1: sparse: cast from restricted fmode_t
fs/nfs/./nfs4trace.h:406:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:406:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:406:1: sparse: incorrect type in initializer (different base types) @@    expected unsigned long [unsigned] mask @@    got restrunsigned long [unsigned] mask @@
fs/nfs/./nfs4trace.h:406:1: sparse: cast from restricted fmode_t
fs/nfs/./nfs4trace.h:230:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:230:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:230:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfs4trace.h:230:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfs4trace.h:293:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:293:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:293:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfs4trace.h:293:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfs4trace.h:406:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:406:1: sparse: cast to restricted fmode_t
fs/nfs/./nfs4trace.h:406:1: sparse: restricted fmode_t degrades to integer
fs/nfs/./nfs4trace.h:406:1: sparse: restricted fmode_t degrades to integer
drivers/gpu/drm/radeon/si.c:5223:6: sparse: symbol 'si_update_cg' was not declared. Should it be static?
drivers/gpu/drm/radeon/r600_dma.c:239:30: sparse: incorrect type in initializer (different address spaces) @@    expected void [noderef] <asn:2>*ptr @@    got sn:2>*ptr @@
drivers/gpu/drm/radeon/r600_dma.c:341:30: sparse: incorrect type in initializer (different address spaces) @@    expected void [noderef] <asn:2>*ptr @@    got sn:2>*ptr @@
drivers/gpu/drm/radeon/cik_sdma.c:504:30: sparse: incorrect type in initializer (different address spaces) @@    expected void [noderef] <asn:2>*ptr @@    got sn:2>*ptr @@
drivers/gpu/drm/radeon/cik_sdma.c:558:30: sparse: incorrect type in initializer (different address spaces) @@    expected void [noderef] <asn:2>*ptr @@    got sn:2>*ptr @@
drivers/net/ppp/pptp.c:321:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] ack @@    got gned] [usertype] ack @@
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast to restricted __le32
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast to restricted __le32
drivers/usb/host/./xhci-trace.h:96:1: sparse: restricted __le32 degrades to integer
drivers/usb/host/./xhci-trace.h:96:1: sparse: restricted __le32 degrades to integer
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast from restricted __le32
drivers/usb/host/./xhci-trace.h:96:1: sparse: restricted __le32 degrades to integer
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast to restricted __le64
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast from restricted __le32
drivers/usb/host/./xhci-trace.h:96:1: sparse: restricted __le32 degrades to integer
drivers/usb/host/./xhci-trace.h:96:1: sparse: cast to restricted __le64
drivers/target/mlx4_fc/fcoe_main.c:468:2: sparse: FIXME: schedule_delayed_work disabled in link_state_changed
drivers/target/mlx4_fc/fcoe_main.c:534:2: sparse: FIXME: schedule_delayed_work disabled in add_port
drivers/target/mlx4_fc/fcoe_main.c:207:2: sparse: FIXME: Hardcoded initiator physical mac
drivers/target/mlx4_fc/fcoe_main.c:287:2: sparse: FIXME: Hardcoded fcoe target mac
kernel/sched/debug.c:562:78: sparse: Expected ; at end of statement
kernel/sched/debug.c:562:78: sparse: got )
arch/x86/kernel/paravirt-spinlocks.c:11:5: sparse: symbol 'taken_slow' was not declared. Should it be static?
arch/x86/kernel/paravirt-spinlocks.c:12:5: sparse: symbol 'released_slow' was not declared. Should it be static?
drivers/gpu/drm/radeon/dce6_afmt.c:59:6: sparse: symbol 'dce6_afmt_select_pin' was not declared. Should it be static?
drivers/gpu/drm/radeon/dce6_afmt.c:73:6: sparse: symbol 'dce6_afmt_write_sad_regs' was not declared. Should it be static?
drivers/gpu/drm/radeon/dce6_afmt.c:193:5: sparse: symbol 'dce6_audio_init' was not declared. Should it be static?
drivers/gpu/drm/radeon/dce6_afmt.c:222:6: sparse: symbol 'dce6_audio_fini' was not declared. Should it be static?
drivers/gpu/drm/radeon/ni_dma.c:253:6: sparse: symbol 'cayman_dma_vm_set_page' was not declared. Should it be static?
drivers/gpu/drm/radeon/si_dma.c:72:6: sparse: symbol 'si_dma_vm_set_page' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik_sdma.c:199:6: sparse: symbol 'cik_sdma_enable' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik_sdma.c:365:5: sparse: symbol 'cik_sdma_resume' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik_sdma.c:401:6: sparse: symbol 'cik_sdma_fini' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik_sdma.c:650:6: sparse: symbol 'cik_sdma_vm_set_page' was not declared. Should it be static?
drivers/gpu/drm/radeon/atombios_dp.c:53:6: sparse: symbol 'radeon_atom_copy_swap' was not declared. Should it be static?
drivers/gpu/drm/radeon/ni.c:1603:5: sparse: symbol 'cayman_gpu_check_soft_reset' was not declared. Should it be static?
drivers/gpu/drm/radeon/si.c:3492:5: sparse: symbol 'si_gpu_check_soft_reset' was not declared. Should it be static?
drivers/gpu/drm/radeon/si.c:5157:5: sparse: symbol 'si_get_csb_size' was not declared. Should it be static?
drivers/gpu/drm/radeon/si.c:5189:6: sparse: symbol 'si_get_csb_buffer' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:4040:5: sparse: symbol 'cik_gpu_check_soft_reset' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:5639:5: sparse: symbol 'cik_get_csb_size' was not declared. Should it be static?
drivers/gpu/drm/radeon/cik.c:5671:6: sparse: symbol 'cik_get_csb_buffer' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
