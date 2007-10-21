From: Roel Kluin <12o3l@tiscali.nl>
Date: Sun, 21 Oct 2007 17:30:44 +0000
Subject: [PATCH 1/1] module debugging
Message-Id: <471B8CC4.4010409@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch is against current git. Also I previously tried to subscribe to this
mailing list by sending a subscribe mail to majordomo@vger.kernel.org with in
header and body "subscribe kernel-janitors", but it appears to have failed. Did
I do it incorrectly?

---
Create option MODULES_DEBUG for loadable module debugging

Signed-off-by: Roel Kluin <12o3l@tiscali.nl>

---
diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 026ba9a..fc0ed7b 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -20,14 +20,12 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 #include <linux/slab.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *
 module_alloc(unsigned long size)
@@ -168,7 +166,7 @@ apply_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
 	void *base, *location;
 	unsigned long got, gp;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
 	base = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr;
diff --git a/arch/cris/kernel/module.c b/arch/cris/kernel/module.c
index 11b867d..c71c411 100644
--- a/arch/cris/kernel/module.c
+++ b/arch/cris/kernel/module.c
@@ -20,13 +20,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt , ...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -72,7 +70,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
   	unsigned int i;
 	Elf32_Rela *rela = (void *)sechdrs[relsec].sh_addr;
 
-	DEBUGP ("Applying add relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying add relocate section %u to %u\n", relsec,
 		sechdrs[relsec].sh_info);
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof (*rela); i++) {
diff --git a/arch/frv/kernel/module.c b/arch/frv/kernel/module.c
index 850d168..6b1a7b9 100644
--- a/arch/frv/kernel/module.c
+++ b/arch/frv/kernel/module.c
@@ -14,13 +14,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
diff --git a/arch/h8300/kernel/module.c b/arch/h8300/kernel/module.c
index 4fd7138..a2e62a0 100644
--- a/arch/h8300/kernel/module.c
+++ b/arch/h8300/kernel/module.c
@@ -3,13 +3,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -56,7 +54,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	unsigned int i;
 	Elf32_Rela *rela = (void *)sechdrs[relsec].sh_addr;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
 		/* This is where to make the change */
diff --git a/arch/ia64/kernel/module.c b/arch/ia64/kernel/module.c
index 1962879..d39cf7c 100644
--- a/arch/ia64/kernel/module.c
+++ b/arch/ia64/kernel/module.c
@@ -26,7 +26,6 @@
  */
 
 
-#include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/elf.h>
 #include <linux/moduleloader.h>
@@ -36,14 +35,11 @@
 #include <asm/patch.h>
 #include <asm/unaligned.h>
 
-#define ARCH_MODULE_DEBUG 0
-
-#if ARCH_MODULE_DEBUG
-# define DEBUGP printk
-# define inline
-#else
-# define DEBUGP(fmt , a...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
+
 
 #ifdef CONFIG_ITANIUM
 # define USE_BRL	0
@@ -492,7 +488,7 @@ module_frob_arch_sections (Elf_Ehdr *ehdr, Elf_Shdr *sechdrs, char *secstrings,
 	mod->arch.opd->sh_flags = SHF_ALLOC;
 	mod->arch.opd->sh_addralign = 8;
 	mod->arch.opd->sh_size = fdescs * sizeof(struct fdesc);
-	DEBUGP("%s: core.plt=%lx, init.plt=%lx, got=%lx, fdesc=%lx\n",
+	printk(KERN_DEBUG "%s: core.plt=%lx, init.plt=%lx, got=%lx, fdesc=%lx\n",
 	       __FUNCTION__, mod->arch.core_plt->sh_size, mod->arch.init_plt->sh_size,
 	       mod->arch.got->sh_size, mod->arch.opd->sh_size);
 	return 0;
@@ -737,7 +733,7 @@ do_reloc (struct module *mod, uint8_t r_type, Elf64_Sym *sym, uint64_t addend,
 		      case R_IA64_LDXMOV:
 			if (gp_addressable(mod, val)) {
 				/* turn "ld8" into "mov": */
-				DEBUGP("%s: patching ld8 at %p to mov\n", __FUNCTION__, location);
+				printk(KERN_DEBUG "%s: patching ld8 at %p to mov\n", __FUNCTION__, location);
 				ia64_patch((u64) location, 0x1fff80fe000UL, 0x10000000000UL);
 			}
 			return 0;
@@ -771,7 +767,7 @@ do_reloc (struct module *mod, uint8_t r_type, Elf64_Sym *sym, uint64_t addend,
 	if (!ok)
 		return -ENOEXEC;
 
-	DEBUGP("%s: [%p]<-%016lx = %s(%lx)\n", __FUNCTION__, location, val,
+	printk(KERN_DEBUG "%s: [%p]<-%016lx = %s(%lx)\n", __FUNCTION__, location, val,
 	       reloc_name[r_type] ? reloc_name[r_type] : "?", sym->st_value + addend);
 
 	switch (format) {
@@ -807,7 +803,7 @@ apply_relocate_add (Elf64_Shdr *sechdrs, const char *strtab, unsigned int symind
 	Elf64_Shdr *target_sec;
 	int ret;
 
-	DEBUGP("%s: applying section %u (%u relocs) to %u\n", __FUNCTION__,
+	printk(KERN_DEBUG "%s: applying section %u (%u relocs) to %u\n", __FUNCTION__,
 	       relsec, n, sechdrs[relsec].sh_info);
 
 	target_sec = sechdrs + sechdrs[relsec].sh_info;
@@ -835,7 +831,7 @@ apply_relocate_add (Elf64_Shdr *sechdrs, const char *strtab, unsigned int symind
 			gp = mod->core_size / 2;
 		gp = (uint64_t) mod->module_core + ((gp + 7) & -8);
 		mod->arch.gp = gp;
-		DEBUGP("%s: placing gp at 0x%lx\n", __FUNCTION__, gp);
+		printk(KERN_DEBUG "%s: placing gp at 0x%lx\n", __FUNCTION__, gp);
 	}
 
 	for (i = 0; i < n; i++) {
@@ -903,7 +899,7 @@ register_unwind_table (struct module *mod)
 		init = start + num_core;
 	}
 
-	DEBUGP("%s: name=%s, gp=%lx, num_init=%lu, num_core=%lu\n", __FUNCTION__,
+	printk(KERN_DEBUG "%s: name=%s, gp=%lx, num_init=%lu, num_core=%lu\n", __FUNCTION__,
 	       mod->name, mod->arch.gp, num_init, num_core);
 
 	/*
@@ -912,13 +908,13 @@ register_unwind_table (struct module *mod)
 	if (num_core > 0) {
 		mod->arch.core_unw_table = unw_add_unwind_table(mod->name, 0, mod->arch.gp,
 								core, core + num_core);
-		DEBUGP("%s:  core: handle=%p [%p-%p)\n", __FUNCTION__,
+		printk(KERN_DEBUG "%s:  core: handle=%p [%p-%p)\n", __FUNCTION__,
 		       mod->arch.core_unw_table, core, core + num_core);
 	}
 	if (num_init > 0) {
 		mod->arch.init_unw_table = unw_add_unwind_table(mod->name, 0, mod->arch.gp,
 								init, init + num_init);
-		DEBUGP("%s:  init: handle=%p [%p-%p)\n", __FUNCTION__,
+		printk(KERN_DEBUG "%s:  init: handle=%p [%p-%p)\n", __FUNCTION__,
 		       mod->arch.init_unw_table, init, init + num_init);
 	}
 }
@@ -926,7 +922,7 @@ register_unwind_table (struct module *mod)
 int
 module_finalize (const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs, struct module *mod)
 {
-	DEBUGP("%s: init: entry=%p\n", __FUNCTION__, mod->init);
+	printk(KERN_DEBUG "%s: init: entry=%p\n", __FUNCTION__, mod->init);
 	if (mod->arch.unwind)
 		register_unwind_table(mod);
 	return 0;
diff --git a/arch/m32r/kernel/module.c b/arch/m32r/kernel/module.c
index 8d42057..25d71e3 100644
--- a/arch/m32r/kernel/module.c
+++ b/arch/m32r/kernel/module.c
@@ -20,13 +20,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef SMP_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -114,7 +112,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	int svalue;
 	int align;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
diff --git a/arch/m68k/kernel/module.c b/arch/m68k/kernel/module.c
index 774862b..704bc6d 100644
--- a/arch/m68k/kernel/module.c
+++ b/arch/m68k/kernel/module.c
@@ -9,13 +9,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 #ifdef CONFIG_MODULES
 
@@ -55,7 +53,7 @@ int apply_relocate(Elf32_Shdr *sechdrs,
 	Elf32_Sym *sym;
 	uint32_t *location;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -95,7 +93,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	Elf32_Sym *sym;
 	uint32_t *location;
 
-	DEBUGP("Applying relocate_add section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate_add section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
diff --git a/arch/m68knommu/kernel/module.c b/arch/m68knommu/kernel/module.c
index 3b1a2ff..d948b30 100644
--- a/arch/m68knommu/kernel/module.c
+++ b/arch/m68knommu/kernel/module.c
@@ -3,13 +3,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -47,7 +45,7 @@ int apply_relocate(Elf32_Shdr *sechdrs,
 	Elf32_Sym *sym;
 	uint32_t *location;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -87,7 +85,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	Elf32_Sym *sym;
 	uint32_t *location;
 
-	DEBUGP("Applying relocate_add section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate_add section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index fdacdd4..25d3563 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -45,16 +45,14 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 #include <linux/bug.h>
 
 #include <asm/unwind.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef PCI_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 #define CHECK_RELOC(val, bits) \
 	if ( ( !((val) & (1<<((bits)-1))) && ((val)>>(bits)) != 0 )  ||	\
@@ -339,7 +337,7 @@ static Elf64_Word get_got(struct module *me, unsigned long value, long addend)
 
 	got[i].addr = value;
  out:
-	DEBUGP("GOT ENTRY %d[%x] val %lx\n", i, i*sizeof(struct got_entry),
+	printk(KERN_DEBUG "GOT ENTRY %d[%x] val %lx\n", i, i*sizeof(struct got_entry),
 	       value);
 	return i * sizeof(struct got_entry);
 }
@@ -490,7 +488,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 	//unsigned long dp = (unsigned long)$global$;
 	register unsigned long dp asm ("r27");
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -512,7 +510,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 
 #if 0
 #define r(t) ELF32_R_TYPE(rel[i].r_info)=t ? #t :
-		DEBUGP("Symbol %s loc 0x%x val 0x%x addend 0x%x: %s\n",
+		printk(KERN_DEBUG "Symbol %s loc 0x%x val 0x%x addend 0x%x: %s\n",
 			strtab + sym->st_name,
 			(uint32_t)loc, val, addend,
 			r(R_PARISC_PLABEL32)
@@ -575,7 +573,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 		case R_PARISC_PCREL22F:
 			/* 22-bit PC relative address; only defined for pa20 */
 			val = get_stub(me, val, addend, ELF_STUB_GOT, in_init(me, loc));
-			DEBUGP("STUB FOR %s loc %lx+%lx at %lx\n", 
+			printk(KERN_DEBUG "STUB FOR %s loc %lx+%lx at %lx\n",
 			       strtab + sym->st_name, (unsigned long)loc, addend, 
 			       val)
 			val = (val - dot - 8)/4;
@@ -609,7 +607,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 	Elf64_Sxword addend;
 	Elf64_Addr dot;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -649,7 +647,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 		case R_PARISC_LTOFF21L:
 			/* LT-relative; left 21 bits */
 			val = get_got(me, val, addend);
-			DEBUGP("LTOFF21L Symbol %s loc %p val %lx\n",
+			printk(KERN_DEBUG "LTOFF21L Symbol %s loc %p val %lx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			val = lrsel(val, 0);
@@ -660,14 +658,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* LT-relative; right 14 bits */
 			val = get_got(me, val, addend);
 			val = rrsel(val, 0);
-			DEBUGP("LTOFF14R Symbol %s loc %p val %lx\n",
+			printk(KERN_DEBUG "LTOFF14R Symbol %s loc %p val %lx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			*loc = mask(*loc, 14) | reassemble_14(val);
 			break;
 		case R_PARISC_PCREL22F:
 			/* PC-relative; 22 bits */
-			DEBUGP("PCREL22F Symbol %s loc %p val %lx\n",
+			printk(KERN_DEBUG "PCREL22F Symbol %s loc %p val %lx\n",
 			       strtab + sym->st_name,
 			       loc, val);
 			/* can we reach it locally? */
@@ -690,7 +688,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 					val = get_stub(me, val, addend, ELF_STUB_GOT,
 						       in_init(me, loc));
 			}
-			DEBUGP("STUB FOR %s loc %lx, val %lx+%lx at %lx\n", 
+			printk(KERN_DEBUG "STUB FOR %s loc %lx, val %lx+%lx at %lx\n",
 			       strtab + sym->st_name, loc, sym->st_value,
 			       addend, val);
 			/* FIXME: local symbols work as long as the
@@ -723,14 +721,14 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			/* 64-bit function address */
 			if(in_local(me, (void *)(val + addend))) {
 				*loc64 = get_fdesc(me, val+addend);
-				DEBUGP("FDESC for %s at %p points to %lx\n",
+				printk(KERN_DEBUG "FDESC for %s at %p points to %lx\n",
 				       strtab + sym->st_name, *loc64,
 				       ((Elf_Fdesc *)*loc64)->addr);
 			} else {
 				/* if the symbol is not local to this
 				 * module then val+addend is a pointer
 				 * to the function descriptor */
-				DEBUGP("Non local FPTR64 Symbol %s loc %p val %lx\n",
+				printk(KERN_DEBUG "Non local FPTR64 Symbol %s loc %p val %lx\n",
 				       strtab + sym->st_name,
 				       loc, val);
 				*loc64 = val + addend;
@@ -761,7 +759,7 @@ register_unwind_table(struct module *me,
 	end = table + sechdrs[me->arch.unwind_section].sh_size;
 	gp = (Elf_Addr)me->module_core + me->arch.got_offset;
 
-	DEBUGP("register_unwind_table(), sect = %d at 0x%p - 0x%p (gp=0x%lx)\n",
+	printk(KERN_DEBUG "register_unwind_table(), sect = %d at 0x%p - 0x%p (gp=0x%lx)\n",
 	       me->arch.unwind_section, table, end, gp);
 	me->arch.unwind = unwind_table_add(me->name, 0, gp, table, end);
 }
@@ -819,7 +817,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 		}
 	}
 
-	DEBUGP("module %s: strtab %p, symhdr %p\n",
+	printk(KERN_DEBUG "module %s: strtab %p, symhdr %p\n",
 	       me->name, strtab, symhdr);
 
 	if(me->arch.got_count > MAX_GOTS) {
@@ -835,7 +833,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 	oldptr = (void *)symhdr->sh_addr;
 	newptr = oldptr + 1;	/* we start counting at 1 */
 	nsyms = symhdr->sh_size / sizeof(Elf_Sym);
-	DEBUGP("OLD num_symtab %lu\n", nsyms);
+	printk(KERN_DEBUG "OLD num_symtab %lu\n", nsyms);
 
 	for (i = 1; i < nsyms; i++) {
 		oldptr++;	/* note, count starts at 1 so preincrement */
@@ -850,7 +848,7 @@ int module_finalize(const Elf_Ehdr *hdr,
 
 	}
 	nsyms = newptr - (Elf_Sym *)symhdr->sh_addr;
-	DEBUGP("NEW num_symtab %lu\n", nsyms);
+	printk(KERN_DEBUG "NEW num_symtab %lu\n", nsyms);
 	symhdr->sh_size = nsyms * sizeof(Elf_Sym);
 	return module_bug_finalize(hdr, sechdrs, me);
 }
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 75c7c4f..a2fe6bc 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -26,6 +26,10 @@
 #include <asm/firmware.h>
 
 #include "setup.h"
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 
 /* FIXME: We don't do .init separately.  To do this, we'd need to have
    a separate r2 value in the init and core section, and stub between
@@ -34,11 +38,6 @@
    Using a magic allocator which places modules within 32MB solves
    this, and makes other things simpler.  Anton?
    --RR.  */
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt , ...)
-#endif
 
 /* There's actually a third entry here, but it's unused */
 struct ppc64_opd_entry
@@ -129,8 +128,8 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 	/* Every relocated section... */
 	for (i = 1; i < hdr->e_shnum; i++) {
 		if (sechdrs[i].sh_type = SHT_RELA) {
-			DEBUGP("Found relocations in section %u\n", i);
-			DEBUGP("Ptr: %p.  Number: %lu\n",
+			printk(KERN_DEBUG "Found relocations in section %u\n", i);
+			printk(KERN_DEBUG "Ptr: %p.  Number: %lu\n",
 			       (void *)sechdrs[i].sh_addr,
 			       sechdrs[i].sh_size / sizeof(Elf64_Rela));
 			relocs += count_relocs((void *)sechdrs[i].sh_addr,
@@ -139,7 +138,7 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 		}
 	}
 
-	DEBUGP("Looks like a total of %lu stubs, max\n", relocs);
+	printk(KERN_DEBUG "Looks like a total of %lu stubs, max\n", relocs);
 	return relocs * sizeof(struct ppc64_stub_entry);
 }
 
@@ -259,7 +258,7 @@ static inline int create_stub(Elf64_Shdr *sechdrs,
 		       me->name, (void *)reladdr, (void *)my_r2);
 		return 0;
 	}
-	DEBUGP("Stub %p get data from reladdr %li\n", entry, reladdr);
+	printk(KERN_DEBUG "Stub %p get data from reladdr %li\n", entry, reladdr);
 
 	*loc1 = PPC_HA(reladdr);
 	*loc2 = PPC_LO(reladdr);
@@ -320,7 +319,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	unsigned long *location;
 	unsigned long value;
 
-	DEBUGP("Applying ADD relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying ADD relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
 		/* This is where to make the change */
@@ -330,7 +329,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
 			+ ELF64_R_SYM(rela[i].r_info);
 
-		DEBUGP("RELOC at %p: %li-type as %s (%lu) + %li\n",
+		printk(KERN_DEBUG "RELOC at %p: %li-type as %s (%lu) + %li\n",
 		       location, (long)ELF64_R_TYPE(rela[i].r_info),
 		       strtab + sym->st_name, (unsigned long)sym->st_value,
 		       (long)rela[i].r_addend);
diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
index 59b4e79..ae3a6fe 100644
--- a/arch/s390/kernel/module.c
+++ b/arch/s390/kernel/module.c
@@ -29,15 +29,13 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 #include <linux/moduleloader.h>
 #include <linux/bug.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt , ...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 #ifndef CONFIG_64BIT
 #define PLT_ENTRY_SIZE 12
@@ -379,7 +377,7 @@ apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	unsigned long i, n;
 	int rc;
 
-	DEBUGP("Applying relocate section %u to %u\n",
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n",
 	       relsec, sechdrs[relsec].sh_info);
 	base = sechdrs[sechdrs[relsec].sh_info].sh_addr;
 	symtab = (Elf_Sym *) sechdrs[symindex].sh_addr;
diff --git a/arch/sh/kernel/module.c b/arch/sh/kernel/module.c
index 142a4e5..203e9d7 100644
--- a/arch/sh/kernel/module.c
+++ b/arch/sh/kernel/module.c
@@ -19,13 +19,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef SH_CPU_FREQ_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -89,7 +87,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	uint32_t value;
 	int align;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
diff --git a/arch/sh64/kernel/module.c b/arch/sh64/kernel/module.c
index 2598f6b..d2df186 100644
--- a/arch/sh64/kernel/module.c
+++ b/arch/sh64/kernel/module.c
@@ -26,13 +26,11 @@
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
 #include <linux/string.h>
-#include <linux/kernel.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt...)
+#ifdef PCI_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc(unsigned long size)
 {
@@ -73,7 +71,7 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 	int align;
 	int is_shmedia;
 
-	DEBUGP("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
 		/* This is where to make the change */
@@ -98,32 +96,32 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 
 		switch (ELF32_R_TYPE(rel[i].r_info)) {
 		case R_SH_DIR32:
-			DEBUGP("R_SH_DIR32 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_DIR32 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			*location += relocation;
 			break;
 		case R_SH_REL32:
-			DEBUGP("R_SH_REL32 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_REL32 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			relocation -= (Elf32_Addr) location;
 			*location += relocation;
 			break;
 		case R_SH_IMM_LOW16:
-			DEBUGP("R_SH_IMM_LOW16 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_IMM_LOW16 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			*location = (*location & ~0x3fffc00) |
 				((relocation & 0xffff) << 10);
 			break;
 		case R_SH_IMM_MEDLOW16:
-			DEBUGP("R_SH_IMM_MEDLOW16 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_IMM_MEDLOW16 @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			*location = (*location & ~0x3fffc00) |
 				(((relocation >> 16) & 0xffff) << 10);
 			break;
 		case R_SH_IMM_LOW16_PCREL:
-			DEBUGP("R_SH_IMM_LOW16_PCREL @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_IMM_LOW16_PCREL @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			relocation -= (Elf32_Addr) location;
 			*location = (*location & ~0x3fffc00) |
 				((relocation & 0xffff) << 10);
 			break;
 		case R_SH_IMM_MEDLOW16_PCREL:
-			DEBUGP("R_SH_IMM_MEDLOW16_PCREL @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
+			printk(KERN_DEBUG "R_SH_IMM_MEDLOW16_PCREL @%08lx = %08lx\n", (unsigned long) location, (unsigned long) relocation);
 			relocation -= (Elf32_Addr) location;
 			*location = (*location & ~0x3fffc00) |
 				(((relocation >> 16) & 0xffff) << 10);
diff --git a/arch/v850/kernel/module.c b/arch/v850/kernel/module.c
index 64aeb3e..72434e7 100644
--- a/arch/v850/kernel/module.c
+++ b/arch/v850/kernel/module.c
@@ -14,16 +14,14 @@
  * Derived in part from arch/ppc/kernel/module.c
  */
 
-#include <linux/kernel.h>
 #include <linux/vmalloc.h>
 #include <linux/moduleloader.h>
 #include <linux/elf.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt , ...)
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
 #endif
+#include <linux/kernel.h>
 
 void *module_alloc (unsigned long size)
 {
@@ -85,8 +83,8 @@ static unsigned long get_plt_size(const Elf32_Ehdr *hdr,
 			continue;
 
 		if (sechdrs[i].sh_type = SHT_RELA) {
-			DEBUGP("Found relocations in section %u\n", i);
-			DEBUGP("Ptr: %p.  Number: %u\n",
+			printk(KERN_DEBUG "Found relocations in section %u\n", i);
+			printk(KERN_DEBUG "Ptr: %p.  Number: %u\n",
 			       (void *)hdr + sechdrs[i].sh_offset,
 			       sechdrs[i].sh_size / sizeof(Elf32_Rela));
 			ret += count_relocs((void *)hdr
@@ -176,7 +174,7 @@ int apply_relocate_add (Elf32_Shdr *sechdrs, const char *strtab,
 	unsigned int i;
 	Elf32_Rela *rela = (void *)sechdrs[relsec].sh_addr;
 
-	DEBUGP ("Applying relocate section %u to %u\n", relsec,
+	printk(KERN_DEBUG "Applying relocate section %u to %u\n", relsec,
 		sechdrs[relsec].sh_info);
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof (*rela); i++) {
diff --git a/init/Kconfig b/init/Kconfig
index 541382d..b9a5e59 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -676,6 +676,11 @@ menuconfig MODULES
 
 	  If unsure, say Y.
 
+config MODULES_DEBUG
+	bool "loadable module debugging"
+	depends on MODULES
+	default n
+
 config MODULE_UNLOAD
 	bool "Module unloading"
 	depends on MODULES
diff --git a/kernel/module.c b/kernel/module.c
index 3202c99..5a5f619 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -21,7 +21,6 @@
 #include <linux/init.h>
 #include <linux/kallsyms.h>
 #include <linux/sysfs.h>
-#include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/elf.h>
@@ -47,13 +46,12 @@
 #include <asm/cacheflush.h>
 #include <linux/license.h>
 
+#ifdef MODULES_DEBUG
+	#define DEBUG 1
+#endif
+#include <linux/kernel.h>
 extern int module_sysfs_initialized;
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(fmt , a...)
-#endif
 
 #ifndef ARCH_SHF_SMALL
 #define ARCH_SHF_SMALL 0
@@ -284,7 +282,7 @@ static unsigned long __find_symbol(const char *name,
 			return ks->value;
 		}
 	}
-	DEBUGP("Failed to find symbol %s\n", name);
+	printk(KERN_DEBUG "Failed to find symbol %s\n", name);
 	return 0;
 }
 
@@ -526,11 +524,11 @@ static int already_uses(struct module *a, struct module *b)
 
 	list_for_each_entry(use, &b->modules_which_use_me, list) {
 		if (use->module_which_uses = a) {
-			DEBUGP("%s uses %s!\n", a->name, b->name);
+			printk(KERN_DEBUG "%s uses %s!\n", a->name, b->name);
 			return 1;
 		}
 	}
-	DEBUGP("%s does not use %s!\n", a->name, b->name);
+	printk(KERN_DEBUG "%s does not use %s!\n", a->name, b->name);
 	return 0;
 }
 
@@ -545,7 +543,7 @@ static int use_module(struct module *a, struct module *b)
 	if (!strong_try_module_get(b))
 		return 0;
 
-	DEBUGP("Allocating new usage for %s.\n", a->name);
+	printk(KERN_DEBUG "Allocating new usage for %s.\n", a->name);
 	use = kmalloc(sizeof(*use), GFP_ATOMIC);
 	if (!use) {
 		printk("%s: out of memory loading\n", a->name);
@@ -569,7 +567,7 @@ static void module_unload_free(struct module *mod)
 
 		list_for_each_entry(use, &i->modules_which_use_me, list) {
 			if (use->module_which_uses = mod) {
-				DEBUGP("%s unusing %s\n", mod->name, i->name);
+				printk(KERN_DEBUG "%s unusing %s\n", mod->name, i->name);
 				module_put(i);
 				list_del(&use->list);
 				kfree(use);
@@ -644,7 +642,7 @@ static void wait_for_zero_refcount(struct module *mod)
 	/* Since we might sleep for some time, drop the semaphore first */
 	mutex_unlock(&module_mutex);
 	for (;;) {
-		DEBUGP("Looking at refcount...\n");
+		printk(KERN_DEBUG "Looking at refcount...\n");
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		if (module_refcount(mod) = 0)
 			break;
@@ -687,7 +685,7 @@ sys_delete_module(const char __user *name_user, unsigned int flags)
 	if (mod->state != MODULE_STATE_LIVE) {
 		/* FIXME: if (force), slam module count and wake up
                    waiter --RR */
-		DEBUGP("%s already dying\n", mod->name);
+		printk(KERN_DEBUG "%s already dying\n", mod->name);
 		ret = -EBUSY;
 		goto out;
 	}
@@ -883,7 +881,7 @@ static int check_version(Elf_Shdr *sechdrs,
 			return 1;
 		printk("%s: disagrees about version of symbol %s\n",
 		       mod->name, symname);
-		DEBUGP("Found checksum %lX vs module %lX\n",
+		printk(KERN_DEBUG "Found checksum %lX vs module %lX\n",
 		       *crc, versions[i].crc);
 		return 0;
 	}
@@ -1387,7 +1385,7 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
 		case SHN_COMMON:
 			/* We compiled with -fno-common.  These are not
 			   supposed to happen.  */
-			DEBUGP("Common symbol: %s\n", strtab + sym[i].st_name);
+			printk(KERN_DEBUG "Common symbol: %s\n", strtab + sym[i].st_name);
 			printk("%s: please compile with -fno-common\n",
 			       mod->name);
 			ret = -ENOEXEC;
@@ -1395,7 +1393,7 @@ static int simplify_symbols(Elf_Shdr *sechdrs,
 
 		case SHN_ABS:
 			/* Don't need to do anything */
-			DEBUGP("Absolute symbol: 0x%08lx\n",
+			printk(KERN_DEBUG "Absolute symbol: 0x%08lx\n",
 			       (long)sym[i].st_value);
 			break;
 
@@ -1463,7 +1461,7 @@ static void layout_sections(struct module *mod,
 	for (i = 0; i < hdr->e_shnum; i++)
 		sechdrs[i].sh_entsize = ~0UL;
 
-	DEBUGP("Core section allocation order:\n");
+	printk(KERN_DEBUG "Core section allocation order:\n");
 	for (m = 0; m < ARRAY_SIZE(masks); ++m) {
 		for (i = 0; i < hdr->e_shnum; ++i) {
 			Elf_Shdr *s = &sechdrs[i];
@@ -1475,13 +1473,13 @@ static void layout_sections(struct module *mod,
 				       ".init", 5) = 0)
 				continue;
 			s->sh_entsize = get_offset(&mod->core_size, s);
-			DEBUGP("\t%s\n", secstrings + s->sh_name);
+			printk(KERN_DEBUG "\t%s\n", secstrings + s->sh_name);
 		}
 		if (m = 0)
 			mod->core_text_size = mod->core_size;
 	}
 
-	DEBUGP("Init section allocation order:\n");
+	printk(KERN_DEBUG "Init section allocation order:\n");
 	for (m = 0; m < ARRAY_SIZE(masks); ++m) {
 		for (i = 0; i < hdr->e_shnum; ++i) {
 			Elf_Shdr *s = &sechdrs[i];
@@ -1494,7 +1492,7 @@ static void layout_sections(struct module *mod,
 				continue;
 			s->sh_entsize = (get_offset(&mod->init_size, s)
 					 | INIT_OFFSET_MASK);
-			DEBUGP("\t%s\n", secstrings + s->sh_name);
+			printk(KERN_DEBUG "\t%s\n", secstrings + s->sh_name);
 		}
 		if (m = 0)
 			mod->init_text_size = mod->init_size;
@@ -1681,7 +1679,7 @@ static struct module *load_module(void __user *umod,
 	struct exception_table_entry *extable;
 	mm_segment_t old_fs;
 
-	DEBUGP("load_module: umod=%p, len=%lu, uargs=%p\n",
+	printk(KERN_DEBUG "load_module: umod=%p, len=%lu, uargs=%p\n",
 	       umod, len, uargs);
 	if (len < sizeof(*hdr))
 		return ERR_PTR(-ENOEXEC);
@@ -1856,7 +1854,7 @@ static struct module *load_module(void __user *umod,
 	mod->module_init = ptr;
 
 	/* Transfer each section which specifies SHF_ALLOC */
-	DEBUGP("final section addresses:\n");
+	printk(KERN_DEBUG "final section addresses:\n");
 	for (i = 0; i < hdr->e_shnum; i++) {
 		void *dest;
 
@@ -1874,7 +1872,7 @@ static struct module *load_module(void __user *umod,
 			       sechdrs[i].sh_size);
 		/* Update sh_addr to point to copy in image. */
 		sechdrs[i].sh_addr = (unsigned long)dest;
-		DEBUGP("\t0x%lx %s\n", sechdrs[i].sh_addr, secstrings + sechdrs[i].sh_name);
+		printk(KERN_DEBUG "\t0x%lx %s\n", sechdrs[i].sh_addr, secstrings + sechdrs[i].sh_name);
 	}
 	/* Module has been moved. */
 	mod = (void *)sechdrs[modindex].sh_addr;
