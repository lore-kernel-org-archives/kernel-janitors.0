From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:21:35 +0000
Subject: [PATCH 2/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172135.GC15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


cris ETRAX-FS-V32:
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: etrax-100lx_defconfig -> switch to Processor type (ETRAX-FS-V32)
toolchain: cris-dist-1.64

Builds gpio.o without warnings.
No runtime check (no hardware available)

CC: Mikael Starvik <starvik@axis.com>
CC: Jesper Nilsson <jesper.nilsson@axis.com>
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 arch/cris/arch-v32/drivers/mach-fs/gpio.c |    3 +-
 arch/cris/kernel/vmlinux.lds              |  406 +++++++++++++++++++++++++++++
 2 files changed, 407 insertions(+), 2 deletions(-)
 create mode 100644 arch/cris/kernel/vmlinux.lds

diff --git a/arch/cris/arch-v32/drivers/mach-fs/gpio.c b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
index a2ac091..dec2e43 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/gpio.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/gpio.c
@@ -761,8 +761,7 @@ virtual_gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		/* Clear alarm for bits with 1 in arg. */
 		priv->highalarm &= ~arg;
 		priv->lowalarm  &= ~arg;
-		spin_lock(&alarm_lock);
-		spin_unlock(&alarm_lock);
+		spin_unlock_wait(&alarm_lock);
 		break;
 	case IO_CFG_WRITE_MODE:
 	{
diff --git a/arch/cris/kernel/vmlinux.lds b/arch/cris/kernel/vmlinux.lds
new file mode 100644
index 0000000..fb23f19
--- /dev/null
+++ b/arch/cris/kernel/vmlinux.lds
@@ -0,0 +1,406 @@
+/*
+ *
+ * Automatically generated file; DO NOT EDIT.
+ * Linux/cris 3.13.0-rc4 Kernel Configuration
+ *
+ */
+/*
+ * Helper macros to use CONFIG_ options in C/CPP expressions. Note that
+ * these only work with boolean and tristate options.
+ */
+
+/*
+ * Getting something that works in C and CPP for an arg that may or may
+ * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
+ * we match on the placeholder define, insert the "0," for arg1 and generate
+ * the triplet (0, 1, 0).  Then the last step cherry picks the 2nd arg (a one).
+ * When CONFIG_BOOGER is not defined, we generate a (... 1, 0) pair, and when
+ * the last step cherry picks the 2nd arg, we get a zero.
+ */
+
+
+
+
+
+
+/*
+ * IS_ENABLED(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y' or 'm',
+ * 0 otherwise.
+ *
+ */
+
+
+
+/*
+ * IS_BUILTIN(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'y', 0
+ * otherwise. For boolean options, this is equivalent to
+ * IS_ENABLED(CONFIG_FOO).
+ */
+
+
+/*
+ * IS_MODULE(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'm', 0
+ * otherwise.
+ */
+
+
+
+/* ld script to make the Linux/CRIS kernel
+ * Authors: Bjorn Wesen (bjornw@axis.com)
+ *
+ * It is VERY DANGEROUS to fiddle around with the symbols in this
+ * script. It is for example quite vital that all generated sections
+ * that are used are actually named here, otherwise the linker will
+ * put them at the end, where the init stuff is which is FREED after
+ * the kernel has booted.
+ */
+
+
+/*
+ * Helper macros to support writing architecture specific
+ * linker scripts.
+ *
+ * A minimal linker scripts has following content:
+ * [This is a sample, architectures may have special requiriements]
+ *
+ * OUTPUT_FORMAT(...)
+ * OUTPUT_ARCH(...)
+ * ENTRY(...)
+ * SECTIONS
+ * {
+ *	. = START;
+ *	__init_begin = .;
+ *	HEAD_TEXT_SECTION
+ *	INIT_TEXT_SECTION(PAGE_SIZE)
+ *	INIT_DATA_SECTION(...)
+ *	PERCPU_SECTION(CACHELINE_SIZE)
+ *	__init_end = .;
+ *
+ *	_stext = .;
+ *	TEXT_SECTION = 0
+ *	_etext = .;
+ *
+ *      _sdata = .;
+ *	RO_DATA_SECTION(PAGE_SIZE)
+ *	RW_DATA_SECTION(...)
+ *	_edata = .;
+ *
+ *	EXCEPTION_TABLE(...)
+ *	NOTES
+ *
+ *	BSS_SECTION(0, 0, 0)
+ *	_end = .;
+ *
+ *	STABS_DEBUG
+ *	DWARF_DEBUG
+ *
+ *	DISCARDS		// must be the last
+ * }
+ *
+ * [__init_begin, __init_end] is the init section that may be freed after init
+ * [_stext, _etext] is the text section
+ * [_sdata, _edata] is the data section
+ *
+ * Some of the included output section have their own set of constants.
+ * Examples are: [__initramfs_start, __initramfs_end] for initramfs and
+ *               [__nosave_begin, __nosave_end] for the nosave data
+ */
+/*
+ * Export symbols from the kernel to modules.  Forked from module.h
+ * to reduce the amount of pointless cruft we feed to gcc when only
+ * exporting a simple symbol or two.
+ *
+ * Try not to add #includes here.  It slows compilation and makes kernel
+ * hackers place grumpy comments in header files.
+ */
+
+/* Some toolchains use a `_' prefix for all user symbols. */
+/* Indirect, so macros are expanded before pasting. */
+/* Align . to a 8 byte boundary equals to maximum function alignment. */
+
+
+/*
+ * Align to a 32 byte boundary equal to the
+ * alignment gcc 4.5 uses for a struct
+ */
+
+
+
+/* The actual configuration determine if the init/exit sections
+ * are handled as text/data or they can be discarded (which
+ * often happens at runtime)
+ */
+/* .data section */
+/*
+ * Data section helpers
+ */
+/*
+ * Read only Data
+ */
+/* RODATA & RO_DATA provided for backward compatibility.
+ * All archs are supposed to use RO_DATA() */
+/* .text section. Map to function alignment to avoid address changes
+ * during second ld run in second ld pass when generating System.map */
+/* sched.text is aling to function alignment to secure we have same
+ * address even at second ld pass when generating System.map */
+
+
+
+
+
+
+/* spinlock.text is aling to function alignment to secure we have same
+ * address even at second ld pass when generating System.map */
+/* Section used for early init (in .S files) */
+
+
+
+
+
+
+
+/*
+ * Exception table
+ */
+/*
+ * Init task
+ */
+/* init and exit section handling */
+/*
+ * bss (Block Started by Symbol) - uninitialized data
+ * zeroed during startup
+ */
+
+
+
+
+
+
+
+/*
+ * Allow archectures to redefine BSS_FIRST_SECTIONS to add extra
+ * sections to the front of bss.
+ */
+/*
+ * DWARF debug sections.
+ * Symbols in the DWARF debugging sections are relative to
+ * the beginning of the section so we begin them at 0.
+ */
+                /* Stabs debugging sections.  */
+/*
+ * Default discarded sections.
+ *
+ * Some archs want to discard exit text/data at runtime rather than
+ * link time due to cross-section references such as alt instructions,
+ * bug table, eh_frame, etc.  DISCARDS must be the last of output
+ * section definitions so that such archs put those in earlier section
+ * definitions.
+ */
+/**
+ * PERCPU_INPUT - the percpu input sections
+ * @cacheline: cacheline size
+ *
+ * The core percpu section names and core symbols which do not rely
+ * directly upon load addresses.
+ *
+ * @cacheline is used to align subsections to avoid false cacheline
+ * sharing between subsections for different purposes.
+ */
+/**
+ * PERCPU_VADDR - define output section for percpu area
+ * @cacheline: cacheline size
+ * @vaddr: explicit base address (optional)
+ * @phdr: destination PHDR (optional)
+ *
+ * Macro which expands to output section for percpu area.
+ *
+ * @cacheline is used to align subsections to avoid false cacheline
+ * sharing between subsections for different purposes.
+ *
+ * If @vaddr is not blank, it specifies explicit base address and all
+ * percpu symbols will be offset from the given address.  If blank,
+ * @vaddr always equals @laddr + LOAD_OFFSET.
+ *
+ * @phdr defines the output PHDR to use if not blank.  Be warned that
+ * output PHDR is sticky.  If @phdr is specified, the next output
+ * section in the linker script will go there too.  @phdr should have
+ * a leading colon.
+ *
+ * Note that this macros defines __per_cpu_load as an absolute symbol.
+ * If there is no need to put the percpu section at a predetermined
+ * address, use PERCPU_SECTION.
+ */
+/**
+ * PERCPU_SECTION - define output section for percpu area, simple version
+ * @cacheline: cacheline size
+ *
+ * Align to PAGE_SIZE and outputs output section for percpu area.  This
+ * macro doesn't manipulate @vaddr or @phdr and __per_cpu_load and
+ * __per_cpu_start will be identical.
+ *
+ * This macro is equivalent to ALIGN(PAGE_SIZE); PERCPU_VADDR(@cacheline,,)
+ * except that __per_cpu_load is defined as a relative symbol against
+ * .data..percpu which is required for relocatable x86_32 configuration.
+ */
+/*
+ * Definition of the high level *_SECTION macros
+ * They will fit only a subset of the architectures
+ */
+
+
+/*
+ * Writeable data.
+ * All sections are combined in a single .data section.
+ * The sections following CONSTRUCTORS are arranged so their
+ * typical alignment matches.
+ * A cacheline is typical/always less than a PAGE_SIZE so
+ * the sections that has this restriction (or similar)
+ * is located before the ones requiring PAGE_SIZE alignment.
+ * NOSAVE_DATA starts and ends with a PAGE_SIZE alignment which
+ * matches the requirement of PAGE_ALIGNED_DATA.
+ *
+ * use 0 as page_align if page_aligned data is not used */
+/* This handles the memory map.. */
+
+
+
+
+
+
+/* macros to convert between really physical and virtual addresses
+ * by stripping a selected bit, we can convert between KSEG_x and
+ * 0x40000000 where the DRAM really resides
+ */
+
+
+/* we have DRAM virtually at 0x6 */
+/* const.h: Macros for dealing with constants.  */
+
+
+
+
+/* Some constant macros are used in both assembler and
+ * C code.  Therefore we cannot annotate them always with
+ * 'UL' and other type specifiers unilaterally.  We
+ * use the following macros to deal with this.
+ *
+ * Similarly, _AT() will cast an expression with a type in C, but
+ * leave it unchanged in asm.
+ */
+/* PAGE_SHIFT determines the page size */
+/*
+ * These are used to make use of C type-checking..
+ */
+/* On CRIS the PFN numbers doesn't start at 0 so we have to compensate */
+/* for that before indexing into the page table starting at mem_map    */
+
+
+
+/* to index into the page map. our pages all start at physical addr PAGE_OFFSET so
+ * we can let the map start there. notice that we subtract PAGE_OFFSET because
+ * we start our mem_map there - in other ports they map mem_map physically and
+ * use __pa instead. in our system both the physical and virtual address of DRAM
+ * is too high to let mem_map start at 0, so we do it this way instead (similar
+ * to arm and m68k I think)
+ */
+
+
+
+
+/* convert a page (based on mem_map and forward) to a physical address
+ * do this by figuring out the virtual address and then use __pa
+ */
+jiffies = jiffies_64;
+SECTIONS
+{
+        . = 0x60000000;
+        dram_start = .;
+
+        ibr_start = .;
+
+
+
+
+
+
+
+        /* see head.S and pages reserved at the start */
+        . = 0x60000000 + 0x4000;
+
+        _text = .; /* Text and read-only data. */
+        text_start = .; /* Lots of aliases. */
+        _stext = .;
+        __stext = .;
+        .text : {
+                . = ALIGN(8); *(.text.hot) *(.text) *(.ref.text) *(.text.unlikely)
+                . = ALIGN(8); __sched_text_start = .; *(.sched.text) __sched_text_end = .;
+                . = ALIGN(8); __lock_text_start = .; *(.spinlock.text) __lock_text_end = .;
+                *(.fixup)
+                *(.text.__*)
+        }
+
+        _etext = . ; /* End of text section. */
+        __etext = .;
+
+        . = ALIGN(4); __ex_table : AT(ADDR(__ex_table) - 0) { __start___ex_table = .; *(__ex_table) __stop___ex_table = .; }
+
+        _sdata = .;
+        . = ALIGN((4096)); .rodata : AT(ADDR(.rodata) - 0) { __start_rodata = .; *(.rodata) *(.rodata.*) *(__vermagic) . = ALIGN(8); __start___tracepoints_ptrs = .; *(__tracepoints_ptrs) __stop___tracepoints_ptrs = .; *(__tracepoints_strings) } .rodata1 : AT(ADDR(.rodata1) - 0) { *(.rodata1) } .pci_fixup : AT(ADDR(.pci_fixup) - 0) { __start_pci_fixups_early = .; *(.pci_fixup_early) __end_pci_fixups_early = .; __start_pci_fixups_header = .; *(.pci_fixup_header) __end_pci_fixups_header = .; __start_pci_fixups_final = .; *(.pci_fixup_final) __end_pci_fixups_final = .; __start_pci_fixups_enable = .; *(.pci_fixup_enable) __end_pci_fixups_enable = .; __start_pci_fixups_resume = .; *(.pci_fixup_resume) __end_pci_fixups_resume = .; __start_pci_fixups_resume_early = .; *(.pci_fixup_resume_early) __end_pci_fixups_resume_early = .; __start_pci_fixups_suspend = .; *(.pci_fixup_suspend) __end_pci_fixups_suspend = .; } .builtin_fw : AT(ADDR(.builtin_fw) - 0) { __start_builtin_fw = .; *(.builtin_fw) __end_builtin_fw = .; } __ksymtab : AT(ADDR(__ksymtab) - 0) { __start___ksymtab = .; *(SORT(___ksymtab+*)) __stop___ksymtab = .; } __ksymtab_gpl : AT(ADDR(__ksymtab_gpl) - 0) { __start___ksymtab_gpl = .; *(SORT(___ksymtab_gpl+*)) __stop___ksymtab_gpl = .; } __ksymtab_unused : AT(ADDR(__ksymtab_unused) - 0) { __start___ksymtab_unused = .; *(SORT(___ksymtab_unused+*)) __stop___ksymtab_unused = .; } __ksymtab_unused_gpl : AT(ADDR(__ksymtab_unused_gpl) - 0) { __start___ksymtab_unused_gpl = .; *(SORT(___ksymtab_unused_gpl+*)) __stop___ksymtab_unused_gpl = .; } __ksymtab_gpl_future : AT(ADDR(__ksymtab_gpl_future) - 0) { __start___ksymtab_gpl_future = .; *(SORT(___ksymtab_gpl_future+*)) __stop___ksymtab_gpl_future = .; } __kcrctab : AT(ADDR(__kcrctab) - 0) { __start___kcrctab = .; *(SORT(___kcrctab+*)) __stop___kcrctab = .; } __kcrctab_gpl : AT(ADDR(__kcrctab_gpl) - 0) { __start___kcrctab_gpl = .; *(SORT(___kcrctab_gpl+*)) __stop___kcrctab_gpl = .; } __kcrctab_unused : AT(ADDR(__kcrctab_unused) - 0) { __start___kcrctab_unused = .; *(SORT(___kcrctab_unused+*)) __stop___kcrctab_unused = .; } __kcrctab_unused_gpl : AT(ADDR(__kcrctab_unused_gpl) - 0) { __start___kcrctab_unused_gpl = .; *(SORT(___kcrctab_unused_gpl+*)) __stop___kcrctab_unused_gpl = .; } __kcrctab_gpl_future : AT(ADDR(__kcrctab_gpl_future) - 0) { __start___kcrctab_gpl_future = .; *(SORT(___kcrctab_gpl_future+*)) __stop___kcrctab_gpl_future = .; } __ksymtab_strings : AT(ADDR(__ksymtab_strings) - 0) { *(__ksymtab_strings) } __init_rodata : AT(ADDR(__init_rodata) - 0) { *(.ref.rodata) } __param : AT(ADDR(__param) - 0) { __start___param = .; *(__param) __stop___param = .; } __modver : AT(ADDR(__modver) - 0) { __start___modver = .; *(__modver) __stop___modver = .; . = ALIGN((4096)); __end_rodata = .; } . = ALIGN((4096));
+
+        . = ALIGN (4);
+        ___data_start = . ;
+        __Sdata = . ;
+        .data : { /* Data */
+                . = ALIGN(32); *(.data..cacheline_aligned)
+                . = ALIGN(32); *(.data..read_mostly) . = ALIGN(32);
+                *(.data) *(.ref.data) *(.data..shared_aligned) *(.data.unlikely) . = ALIGN(32); *(__tracepoints) . = ALIGN(8); __start___jump_table = .; *(__jump_table) __stop___jump_table = .; . = ALIGN(8); __start___verbose = .; *(__verbose) __stop___verbose = .;
+        }
+        __edata = . ; /* End of data section. */
+        _edata = . ;
+
+        . = ALIGN((1 << 13)); .data..init_task : AT(ADDR(.data..init_task) - 0) { . = ALIGN((1 << 13)); *(.data..init_task) }
+
+        . = ALIGN((1 << 13)); /* Init code and data. */
+        __init_begin = .;
+        . = ALIGN((1 << 13)); .init.text : AT(ADDR(.init.text) - 0) { _sinittext = .; *(.init.text) *(.meminit.text) _einittext = .; }
+        .init.data : { *(.init.data) *(.meminit.data) *(.init.rodata) *(.meminit.rodata) . = ALIGN(32); __dtb_start = .; *(.dtb.init.rodata) __dtb_end = .; }
+        .init.setup : { . = ALIGN(16); __setup_start = .; *(.init.setup) __setup_end = .; }
+        .initcall.init : {
+                __initcall_start = .; *(.initcallearly.init) __initcall0_start = .; *(.initcall0.init) *(.initcall0s.init) __initcall1_start = .; *(.initcall1.init) *(.initcall1s.init) __initcall2_start = .; *(.initcall2.init) *(.initcall2s.init) __initcall3_start = .; *(.initcall3.init) *(.initcall3s.init) __initcall4_start = .; *(.initcall4.init) *(.initcall4s.init) __initcall5_start = .; *(.initcall5.init) *(.initcall5s.init) __initcallrootfs_start = .; *(.initcallrootfs.init) *(.initcallrootfss.init) __initcall6_start = .; *(.initcall6.init) *(.initcall6s.init) __initcall7_start = .; *(.initcall7.init) *(.initcall7s.init) __initcall_end = .;
+        }
+
+        .con_initcall.init : {
+                __con_initcall_start = .; *(.con_initcall.init) __con_initcall_end = .;
+        }
+        .security_initcall.init : AT(ADDR(.security_initcall.init) - 0) { __security_initcall_start = .; *(.security_initcall.init) __security_initcall_end = .; }
+
+        /* .exit.text is discarded at runtime, not link time,
+	 * to deal with references from __bug_table
+	 */
+        .exit.text : {
+                *(.exit.text) *(.memexit.text)
+        }
+        .exit.data : {
+                *(.exit.data) *(.memexit.data) *(.memexit.rodata)
+        }
+        __vmlinux_end = .; /* Last address of the physical file. */
+        /*
+	 * We fill to the next page, so we can discard all init
+	 * pages without needing to consider what payload might be
+	 * appended to the kernel image.
+	 */
+        . = ALIGN((1 << 13));
+
+        __init_end = .;
+
+        __data_end = . ; /* Move to _edata ? */
+        . = ALIGN(1); __bss_start = .; . = ALIGN(1); .sbss : AT(ADDR(.sbss) - 0) { *(.sbss) *(.scommon) } . = ALIGN(1); .bss : AT(ADDR(.bss) - 0) { *(.bss..page_aligned) *(.dynbss) *(.bss) *(COMMON) } . = ALIGN(1); __bss_stop = .;
+
+        . = ALIGN (0x20);
+        _end = .;
+        __end = .;
+
+        dram_end = dram_start + (8 - 0)*1024*1024;
+
+        /DISCARD/ : { *(.exit.text) *(.memexit.text) *(.exit.data) *(.memexit.data) *(.memexit.rodata) *(.exitcall.exit) *(.discard) *(.discard.*) }
+}
-- 
1.7.2.5

