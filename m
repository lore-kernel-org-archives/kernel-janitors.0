From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 31 Oct 2012 17:11:09 +0000
Subject: build regressions 2012-10-31
Message-Id: <20121031171109.GA32321@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/frv/mm/elf-fdpic.c:33:21: error: dereferencing pointer to incomplete type
arch/frv/mm/elf-fdpic.c:33:31: error: 'ELF_FDPIC_FLAG_PRESENT' undeclared (first use in this function)
arch/frv/mm/elf-fdpic.c:43:29: error: 'ELF_FDPIC_FLAG_ARRANGEMENT' undeclared (first use in this function)
arch/frv/mm/elf-fdpic.c:44:7: error: 'ELF_FDPIC_FLAG_INDEPENDENT' undeclared (first use in this function)
arch/frv/mm/elf-fdpic.c:47:26: error: 'ELF_FDPIC_FLAG_CONSTDISP' undeclared (first use in this function)
Makefile:911: *** Headers not exportable for the x86 architecture.  Stop.
Makefile:911: *** Headers not exportable for the parisc architecture.  Stop.
Makefile:911: *** Headers not exportable for the powerpc architecture.  Stop.
arch/powerpc/include/uapi/asm/epapr_hcalls.h:139:2: error: implicit declaration of function 'EV_HCALL_TOKEN' [-Werror=implicit-function-declaration]
arch/powerpc/include/uapi/asm/epapr_hcalls.h:139:23: error: 'EV_INT_SET_CONFIG' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:171:23: error: 'EV_INT_GET_CONFIG' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:200:23: error: 'EV_INT_SET_MASK' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:226:23: error: 'EV_INT_GET_MASK' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:254:23: error: 'EV_INT_EOI' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:277:41: error: 'EV_BYTE_CHANNEL_MAX_BYTES' undeclared here (not in a function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:288:23: error: 'EV_BYTE_CHANNEL_SEND' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:331:23: error: 'EV_BYTE_CHANNEL_RECEIVE' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:370:23: error: 'EV_BYTE_CHANNEL_POLL' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:403:23: error: 'EV_INT_IACK' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:427:23: error: 'EV_DOORBELL_SEND' undeclared (first use in this function)
arch/powerpc/include/uapi/asm/epapr_hcalls.h:448:23: error: 'EV_IDLE' undeclared (first use in this function)
arch/powerpc/include/asm/kvm_para.h:68:2: error: implicit declaration of function '_EV_HCALL_TOKEN' [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/kvm_para.h:68:29: error: 'EV_KVM_VENDOR_ID' undeclared (first use in this function)
drivers/of/fdt.c:490:4: error: implicit declaration of function 'kbasename' [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/fsl_hcalls.h:96:2: error: implicit declaration of function '_EV_HCALL_TOKEN' [-Werror=implicit-function-declaration]
arch/powerpc/include/asm/fsl_hcalls.h:96:8: error: 'EV_FSL_VENDOR_ID' undeclared (first use in this function)
arch/powerpc/kernel/epapr_hcalls.S:30: Error: missing ')'
arch/powerpc/kernel/epapr_hcalls.S:30: Error: syntax error; found `(', expected `,'
arch/powerpc/kernel/epapr_hcalls.S:30: Error: junk at end of line: `(EV_IDLE))@highest'
arch/powerpc/kernel/epapr_hcalls.S:30: Error: junk at end of line: `(EV_IDLE))@higher'
arch/powerpc/kernel/epapr_hcalls.S:30: Error: junk at end of line: `(EV_IDLE))@h'
arch/powerpc/kernel/epapr_hcalls.S:30: Error: junk at end of line: `(EV_IDLE))@l'
arch/powerpc/include/asm/kvm_para.h:57:9: error: 'EV_UNIMPLEMENTED' undeclared (first use in this function)
Makefile:911: *** Headers not exportable for the s390 architecture.  Stop.
drivers/tty/serial/8250/8250_early.c:160:18: error: 'BASE_BAUD' undeclared (first use in this function)
drivers/input/mouse/gpio_mouse.c:86:4: error: implicit declaration of function 'gpio_request' [-Werror=implicit-function-declaration]
drivers/input/mouse/gpio_mouse.c:93:4: error: implicit declaration of function 'gpio_direction_input' [-Werror=implicit-function-declaration]
drivers/input/mouse/gpio_mouse.c:147:4: error: implicit declaration of function 'gpio_free' [-Werror=implicit-function-declaration]

[warnings]
arch/frv/mm/elf-fdpic.c:26:11: warning: 'struct elf_fdpic_params' declared inside parameter list [enabled by default]
arch/frv/mm/elf-fdpic.c:26:11: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/of/fdt.c:490:10: warning: assignment makes pointer from integer without a cast [enabled by default]
security/integrity/ima/ima_dir.c:132:1: warning: 'ima_dir_collect' uses dynamic stack allocation [enabled by default]
mm/slab_common.c:210:6: warning: format '%td' expects argument of type 'ptrdiff_t', but argument 3 has type 'size_t' [-Wformat]
security/integrity/ima/ima_dir.c:104:1: warning: 'ima_calc_dir_hash' uses dynamic stack allocation [enabled by default]
drivers/tty/serial/serial_core.c:2369:2: warning: left shift count >= width of type [enabled by default]
drivers/net/usb/rtl8150.c:31:0: warning: "RSR" redefined [enabled by default]
drivers/net/ethernet/dec/tulip/winbond-840.c:912:2: warning: #warning Processor architecture undefined [-Wcpp]
drivers/net/ethernet/dec/tulip/tulip_core.c:101:2: warning: #warning Processor architecture undefined! [-Wcpp]
drivers/net/ethernet/dlink/de620.h:37:0: warning: "INTLEVEL" redefined [enabled by default]
drivers/scsi/sym53c8xx_2/sym_defs.h:109:0: warning: "WSR" redefined [enabled by default]
arch/xtensa/kernel/time.c:42:2: warning: initialization from incompatible pointer type [enabled by default]
arch/xtensa/kernel/time.c:42:2: warning: (near initialization for 'ccount_clocksource.read') [enabled by default]
arch/xtensa/kernel/pci.c:82:11: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'resource_size_t' [-Wformat]
arch/xtensa/mm/tlb.c:67:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/fddi/skfp/h/skfbi.h:151:0: warning: "PCI_IOBASE" redefined [enabled by default]
include/asm-generic/io.h:110:2: warning: passing argument 1 of '__raw_readb' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:115:2: warning: passing argument 1 of '__raw_readw' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:120:2: warning: passing argument 1 of '__raw_readl' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:125:2: warning: passing argument 2 of '__raw_writeb' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:130:2: warning: passing argument 2 of '__raw_writew' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:135:2: warning: passing argument 2 of '__raw_writel' makes pointer from integer without a cast [enabled by default]
include/asm-generic/io.h:222:2: warning: passing argument 1 of 'insl' makes integer from pointer without a cast [enabled by default]
include/asm-generic/io.h:227:2: warning: passing argument 1 of 'insw' makes integer from pointer without a cast [enabled by default]
include/asm-generic/io.h:232:2: warning: passing argument 1 of 'insb' makes integer from pointer without a cast [enabled by default]
include/asm-generic/io.h:237:2: warning: passing argument 1 of 'outsl' makes integer from pointer without a cast [enabled by default]
include/asm-generic/io.h:242:2: warning: passing argument 1 of 'outsw' makes integer from pointer without a cast [enabled by default]
include/asm-generic/io.h:247:2: warning: passing argument 1 of 'outsb' makes integer from pointer without a cast [enabled by default]
WARNING: security/integrity/built-in.o(.text+0x1d8): Section mismatch in reference from the function integrity_inode_free() to the variable .init.data:ima_use_tcb

[sparse]
drivers/gpu/drm/i915/intel_ddi.c:1043:34: sparse: mixing different enum types
drivers/staging/iio/adc/adt7410.c:959:17: sparse: cast to restricted __be16
security/integrity/module.c:33:5: sparse: symbol 'mod_verify_sig' was not declared. Should it be static?
kernel/fork.c:1638:1: sparse: symbol 'sys_fork' was not declared. Should it be static?
kernel/fork.c:1650:1: sparse: symbol 'sys_vfork' was not declared. Should it be static?
kernel/fork.c:1659:1: sparse: symbol 'sys_clone' was not declared. Should it be static?
security/integrity/module.c:33:5: sparse: symbol 'mod_verify_sig' was not declared. Should it be static?

[smatch]
drivers/input/serio/arc_ps2.c:199 arc_ps2_probe() info: why not propagate 'irq' from platform_get_irq_byname() instead of -22?
drivers/staging/comedi/drivers/addi-data/addi_common.c:207 i_ADDI_Attach() error: we previously assumed 'this_board->pc_EepromChip' could be null (see line 139)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
