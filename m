From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 30 Aug 2013 16:13:13 +0000
Subject: build regressions 2013-08-30
Message-Id: <5220c499.NtEXQzDMXWIpLTMA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-imx/clk-fixup-div.c:73:25: error: 'struct clk_divider' has no member named 'width'
arch/arm/mach-imx/clk-fixup-div.c:74:22: error: 'struct clk_divider' has no member named 'width'
arch/arm/mach-imx/clk-fixup-div.c:79:22: error: 'struct clk_divider' has no member named 'width'
arch/arm/mach-imx/clk-fixup-div.c:118:20: error: 'struct clk_divider' has no member named 'width'
mm/page_alloc.c:4830:3: error: implicit declaration of function '__absent_pages_in_range' [-Werror=implicit-function-declaration]
kernel/cgroup.c:422:2: error: implicit declaration of function 'lockdep_is_held' [-Werror=implicit-function-declaration]
include/asm-generic/memory_model.h:60:17: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
include/linux/mm.h:757:29: error: conflicting types for 'page_to_section'
arch/powerpc/platforms/ps3/mm.c:84:8: error: redefinition of 'struct mem_region'
include/linux/mm.h:729:10: error: implicit declaration of function 'page_to_section' [-Werror=implicit-function-declaration]
drivers/usb/host/ohci-pci.c:294:10: error: 'usb_hcd_pci_pm_ops' undeclared here (not in a function)
drivers/acpi/thermal.c:489:6: error: implicit declaration of function 'acpi_has_method' [-Werror=implicit-function-declaration]
include/net/netfilter/nf_conntrack_seqadj.h:25:28: error: 'NF_CT_EXT_SEQADJ' undeclared (first use in this function)
include/net/netfilter/nf_conntrack_seqadj.h:30:27: error: 'NF_CT_EXT_SEQADJ' undeclared (first use in this function)
include/net/netfilter/nf_conntrack_seqadj.h:25:28: error: 'NF_CT_EXT_SEQADJ' undeclared (first use in this function)
include/net/netfilter/nf_conntrack_seqadj.h:30:27: error: 'NF_CT_EXT_SEQADJ' undeclared (first use in this function)
net/netfilter/nf_conntrack_seqadj.c:207:8: error: 'NF_CT_EXT_SEQADJ' undeclared here (not in a function)

[warnings]
drivers/gpu/host1x/drm/dc.c:259:2: warning: (near initialization for 'tegra_crtc_funcs.page_flip') [enabled by default]
drivers/regulator/da9063-regulator.c:719:2: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [enabled by default]
drivers/regulator/da9063-regulator.c:719:2: warning: return makes pointer from integer without a cast [enabled by default]
fs/squashfs/block.c:170:7: warning: unused variable 'i' [-Wunused-variable]
drivers/base/memory.c:376:16: warning: 'offline' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/page_alloc.c:825:1: warning: label 'page_found' defined but not used [-Wunused-label]
mm/page_alloc.c:796:42: warning: unused variable 'p' [-Wunused-variable]
drivers/net/can/xilinx_can.c:540:2: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
drivers/net/can/xilinx_can.c:543:3: warning: passing argument 1 of '__fswab32' makes integer from pointer without a cast [enabled by default]
drivers/of/fdt.c:405:72: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/gpu/drm/i915/intel_acpi.c:197:14: warning: unused variable 'status' [-Wunused-variable]
WARNING: mm/built-in.o(.text.unlikely+0x1331): Section mismatch in reference from the function alloc_usemap_and_memmap() to the function .init.text:max_swapfiles_check()
include/net/netfilter/nf_conntrack_seqadj.h:26:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
net/sunrpc/auth_gss/auth_gss.c:75:1: sparse: symbol 'gss_auth_hash_table' was not declared. Should it be static?
net/sunrpc/auth_gss/auth_gss.c:76:1: sparse: symbol 'gss_auth_hash_lock' was not declared. Should it be static?
drivers/scsi/qla2xxx/qla_mbx.c:3889:28: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] <noident> @@    got nsigned] [short] <noident> @@
sound/soc/fsl/fsl_spdif.c:414:5: sparse: symbol 'fsl_spdif_startup' was not declared. Should it be static?
sound/soc/fsl/fsl_spdif.c:549:24: sparse: symbol 'fsl_spdif_dai_ops' was not declared. Should it be static?
sound/soc/fsl/fsl_spdif.c:922:27: sparse: symbol 'fsl_spdif_dai' was not declared. Should it be static?
sound/soc/fsl/fsl_utils.c:72:40: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 const [usertype] *p @@    got unsignrestricted __be32 const [usertype] *p @@
sound/soc/fsl/fsl_utils.c:80:32: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 const [usertype] *p @@    got unsignrestricted __be32 const [usertype] *p @@
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:2794:6: sparse: symbol 'bnx2x_set_vf_state' was not declared. Should it be static?
net/nfc/netlink.c:1287:6: sparse: symbol 'se_io_cb' was not declared. Should it be static?
drivers/usb/host/xhci-ring.c:3493:30: sparse: restricted __le16 degrades to integer

[coccinelle]
net/sunrpc/auth_gss/auth_gss.c:470:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
