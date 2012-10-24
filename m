From: Firo Yang <firogm@gmail.com>
Date: Wed, 24 Oct 2012 09:24:30 +0000
Subject: [PATCH 1/1] x86:Remove unnecessary (void *) pointer casts
Message-Id: <1351070670-27488-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi master,
This is my first linux kernel patch.
According to the suggestion of kernelnewbies.org,
I find and fix some simple unnecessary casts under x86 directory.
If any fails, I will take the responsibility.

Best,
firo

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/x86/kernel/machine_kexec_64.c |    8 ++++----
 arch/x86/mm/init_32.c              |   11 +++++------
 arch/x86/mm/init_64.c              |   12 ++++++------
 arch/x86/mm/pageattr.c             |    4 ++--
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index b3ea9db..5ebd346 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -35,7 +35,7 @@ static int init_one_level2_page(struct kimage *image, pgd_t *pgd,
		page = kimage_alloc_control_pages(image, 0);
		if (!page)
			goto out;
-		pud = (pud_t *)page_address(page);
+		pud = page_address(page);
		clear_page(pud);
		set_pgd(pgd, __pgd(__pa(pud) | _KERNPG_TABLE));
	}
@@ -44,7 +44,7 @@ static int init_one_level2_page(struct kimage *image, pgd_t *pgd,
		page = kimage_alloc_control_pages(image, 0);
		if (!page)
			goto out;
-		pmd = (pmd_t *)page_address(page);
+		pmd = page_address(page);
		clear_page(pmd);
		set_pud(pud, __pud(__pa(pmd) | _KERNPG_TABLE));
	}
@@ -86,7 +86,7 @@ static int init_level3_page(struct kimage *image, pud_t *level3p,
			result = -ENOMEM;
			goto out;
		}
-		level2p = (pmd_t *)page_address(page);
+		level2p = page_address(page);
		init_level2_page(level2p, addr);
		set_pud(level3p++, __pud(__pa(level2p) | _KERNPG_TABLE));
		addr += PUD_SIZE;
@@ -119,7 +119,7 @@ static int init_level4_page(struct kimage *image, pgd_t *level4p,
			result = -ENOMEM;
			goto out;
		}
-		level3p = (pud_t *)page_address(page);
+		level3p = page_address(page);
		result = init_level3_page(image, level3p, addr, last_addr);
		if (result)
			goto out;
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 11a5800..75a7688 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -85,9 +85,9 @@ static pmd_t * __init one_md_table_init(pgd_t *pgd)
 #ifdef CONFIG_X86_PAE
	if (!(pgd_val(*pgd) & _PAGE_PRESENT)) {
		if (after_bootmem)
-			pmd_table = (pmd_t *)alloc_bootmem_pages(PAGE_SIZE);
+			pmd_table = alloc_bootmem_pages(PAGE_SIZE);
		else
-			pmd_table = (pmd_t *)alloc_low_page();
+			pmd_table = alloc_low_page();
		paravirt_alloc_pmd(&init_mm, __pa(pmd_table) >> PAGE_SHIFT);
		set_pgd(pgd, __pgd(__pa(pmd_table) | _PAGE_PRESENT));
		pud = pud_offset(pgd, 0);
@@ -113,13 +113,12 @@ static pte_t * __init one_page_table_init(pmd_t *pmd)

		if (after_bootmem) {
 #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KMEMCHECK)
-			page_table = (pte_t *) alloc_bootmem_pages(PAGE_SIZE);
+			page_table = alloc_bootmem_pages(PAGE_SIZE);
 #endif
			if (!page_table)
-				page_table -				(pte_t *)alloc_bootmem_pages(PAGE_SIZE);
+				page_table = alloc_bootmem_pages(PAGE_SIZE);
		} else
-			page_table = (pte_t *)alloc_low_page();
+			page_table = alloc_low_page();

		paravirt_alloc_pte(&init_mm, __pa(page_table) >> PAGE_SHIFT);
		set_pmd(pmd, __pmd(__pa(page_table) | _PAGE_TABLE));
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 2b6b4a3..da2d61d 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -117,7 +117,7 @@ void sync_global_pgds(unsigned long start, unsigned long end)
			pgd_t *pgd;
			spinlock_t *pgt_lock;

-			pgd = (pgd_t *)page_address(page) + pgd_index(address);
+			pgd = page_address(page) + pgd_index(address);
			/* the pgt_lock only for Xen */
			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
			spin_lock(pgt_lock);
@@ -160,7 +160,7 @@ static __ref void *spp_getpage(void)
 static pud_t *fill_pud(pgd_t *pgd, unsigned long vaddr)
 {
	if (pgd_none(*pgd)) {
-		pud_t *pud = (pud_t *)spp_getpage();
+		pud_t *pud = spp_getpage();
		pgd_populate(&init_mm, pgd, pud);
		if (pud != pud_offset(pgd, 0))
			printk(KERN_ERR "PAGETABLE BUG #00! %p <-> %p\n",
@@ -172,7 +172,7 @@ static pud_t *fill_pud(pgd_t *pgd, unsigned long vaddr)
 static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 {
	if (pud_none(*pud)) {
-		pmd_t *pmd = (pmd_t *) spp_getpage();
+		pmd_t *pmd = spp_getpage();
		pud_populate(&init_mm, pud, pmd);
		if (pmd != pmd_offset(pud, 0))
			printk(KERN_ERR "PAGETABLE BUG #01! %p <-> %p\n",
@@ -184,7 +184,7 @@ static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
 {
	if (pmd_none(*pmd)) {
-		pte_t *pte = (pte_t *) spp_getpage();
+		pte_t *pte = spp_getpage();
		pmd_populate_kernel(&init_mm, pmd, pte);
		if (pte != pte_offset_kernel(pmd, 0))
			printk(KERN_ERR "PAGETABLE BUG #02!\n");
@@ -260,13 +260,13 @@ static void __init __init_extra_mapping(unsigned long phys, unsigned long size,
	for (; size; phys += PMD_SIZE, size -= PMD_SIZE) {
		pgd = pgd_offset_k((unsigned long)__va(phys));
		if (pgd_none(*pgd)) {
-			pud = (pud_t *) spp_getpage();
+			pud = spp_getpage();
			set_pgd(pgd, __pgd(__pa(pud) | _KERNPG_TABLE |
						_PAGE_USER));
		}
		pud = pud_offset(pgd, (unsigned long)__va(phys));
		if (pud_none(*pud)) {
-			pmd = (pmd_t *) spp_getpage();
+			pmd = spp_getpage();
			set_pud(pud, __pud(__pa(pmd) | _KERNPG_TABLE |
						_PAGE_USER));
		}
diff --git a/arch/x86/mm/pageattr.c b/arch/x86/mm/pageattr.c
index a718e0d..662b3b0 100644
--- a/arch/x86/mm/pageattr.c
+++ b/arch/x86/mm/pageattr.c
@@ -379,7 +379,7 @@ static void __set_pmd_pte(pte_t *kpte, unsigned long address, pte_t pte)
			pud_t *pud;
			pmd_t *pmd;

-			pgd = (pgd_t *)page_address(page) + pgd_index(address);
+			pgd = page_address(page) + pgd_index(address);
			pud = pud_offset(pgd, address);
			pmd = pmd_offset(pud, address);
			set_pte_atomic((pte_t *)pmd, pte);
@@ -526,7 +526,7 @@ static int split_large_page(pte_t *kpte, unsigned long address)
	if (tmp != kpte)
		goto out_unlock;

-	pbase = (pte_t *)page_address(base);
+	pbase = page_address(base);
	paravirt_alloc_pte(&init_mm, page_to_pfn(base));
	ref_prot = pte_pgprot(pte_clrhuge(*kpte));
	/*
--
1.7.10.4
