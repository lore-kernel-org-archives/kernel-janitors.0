From: Jaswinder Singh <jaswinder@infradead.org>
Date: Sun, 13 Jul 2008 01:49:31 +0000
Subject: [PATCH] x86-rest: fix sparse warnings
Message-Id: <1215913730.2711.1.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>


CHECK   arch/x86/mm/init_32.c
arch/x86/mm/init_32.c:290:13: warning: symbol 'add_one_highpage_init' was n=
ot declared. Should it be static?
arch/x86/mm/init_32.c:437:6: warning: symbol 'zap_low_mappings' was not dec=
lared. Should it be static?
arch/x86/mm/init_32.c:774:6: warning: symbol 'free_initmem' was not declare=
d. Should it be static?

CHECK   arch/x86/mm/fault.c
arch/x86/mm/fault.c:581:16: warning: symbol 'do_page_fault' was not declare=
d. Should it be static?

CHECK   arch/x86/mm/pat.c
arch/x86/mm/pat.c:566:6: warning: symbol 'map_devmem' was not declared. Sho=
uld it be static?
arch/x86/mm/pat.c:583:6: warning: symbol 'unmap_devmem' was not declared. S=
hould it be static?

CHECK   arch/x86/mm/pgtable_32.c
arch/x86/mm/pgtable_32.c:115:6: warning: symbol 'set_pmd_pfn' was not decla=
red. Should it be static?

CHECK   arch/x86/mach-default/setup.c
arch/x86/mach-default/setup.c:19:5: warning: symbol 'no_broadcast' was not =
declared. Should it be static?

Signed-off-by: Jaswinder Singh <jaswinder@infradead.org>
---
 arch/x86/mach-default/setup.c |    2 +-
 include/asm-x86/pat.h         |    3 +++
 include/asm-x86/pgtable_32.h  |    6 ++++++
 include/asm-x86/setup.h       |    1 +
 4 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/arch/x86/mach-default/setup.c b/arch/x86/mach-default/setup.c
index 0c28a07..dac2bd9 100644
--- a/arch/x86/mach-default/setup.c
+++ b/arch/x86/mach-default/setup.c
@@ -16,7 +16,7 @@
 #define DEFAULT_SEND_IPI	(0)
 #endif
=20
-int no_broadcast=DEFAULT_SEND_IPI;
+int no_broadcast =3D DEFAULT_SEND_IPI;
=20
 /**
  * pre_intr_init_hook - initialisation prior to setting up interrupt vecto=
rs
diff --git a/include/asm-x86/pat.h b/include/asm-x86/pat.h
index 88f60cc..e17830e 100644
--- a/include/asm-x86/pat.h
+++ b/include/asm-x86/pat.h
@@ -20,5 +20,8 @@ extern int free_memtype(u64 start, u64 end);
=20
 extern void pat_disable(char *reason);
=20
+extern void map_devmem(unsigned long, unsigned long, pgprot_t);
+extern void unmap_devmem(unsigned long, unsigned long, pgprot_t);
+
 #endif
=20
diff --git a/include/asm-x86/pgtable_32.h b/include/asm-x86/pgtable_32.h
index 32ca031..2f3322c 100644
--- a/include/asm-x86/pgtable_32.h
+++ b/include/asm-x86/pgtable_32.h
@@ -31,6 +31,12 @@ static inline void pgtable_cache_init(void) { }
 static inline void check_pgt_cache(void) { }
 void paging_init(void);
=20
+void __init add_one_highpage_init(struct page *, int pfn, int);
+void zap_low_mappings(void);
+void free_initmem(void);
+void do_page_fault(struct pt_regs *regs, unsigned long error_code);
+
+void set_pmd_pfn(unsigned long, unsigned long, pgprot_t);
=20
 /*
  * The Linux x86 paging architecture is 'compile-time dual-mode', it
diff --git a/include/asm-x86/setup.h b/include/asm-x86/setup.h
index b9b6494..1997ee6 100644
--- a/include/asm-x86/setup.h
+++ b/include/asm-x86/setup.h
@@ -8,6 +8,7 @@
 /* Interrupt control for vSMPowered x86_64 systems */
 void vsmp_init(void);
=20
+extern int no_broadcast;
 char *machine_specific_memory_setup(void);
=20
 extern unsigned long saved_video_mode;
--=20
1.5.5.1



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
