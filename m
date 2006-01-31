From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:03:07 +0000
Subject: [KJ] [Patch 1/7] BUG_ON() Conversion in mm/highmem.c
Message-Id: <1138712587.11570.12.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2004700892357052=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2004700892357052==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/mm/highmem.c.orig	2006-01-30 23:09:59.000000000 +0100
+++ linux-2.6.16-rc1-git4/mm/highmem.c	2006-01-30 23:12:43.000000000 +0100
@@ -83,8 +83,7 @@ static void flush_all_zero_pkmaps(void)
 		pkmap_count[i] = 0;
 
 		/* sanity check */
-		if (pte_none(pkmap_page_table[i]))
-			BUG();
+		BUG_ON(pte_none(pkmap_page_table[i]));
 
 		/*
 		 * Don't need an atomic fetch-and-clear op here;
@@ -167,8 +166,7 @@ void fastcall *kmap_high(struct page *pa
 	if (!vaddr)
 		vaddr = map_new_virtual(page);
 	pkmap_count[PKMAP_NR(vaddr)]++;
-	if (pkmap_count[PKMAP_NR(vaddr)] < 2)
-		BUG();
+	BUG_ON(pkmap_count[PKMAP_NR(vaddr)] < 2);
 	spin_unlock(&kmap_lock);
 	return (void*) vaddr;
 }
@@ -183,8 +181,7 @@ void fastcall kunmap_high(struct page *p
 
 	spin_lock(&kmap_lock);
 	vaddr = (unsigned long)page_address(page);
-	if (!vaddr)
-		BUG();
+	BUG_ON(!vaddr);
 	nr = PKMAP_NR(vaddr);
 
 	/*
@@ -229,8 +226,7 @@ static __init int init_emergency_pool(vo
 		return 0;
 
 	page_pool = mempool_create(POOL_SIZE, page_pool_alloc, page_pool_free, NULL);
-	if (!page_pool)
-		BUG();
+	BUG_ON(!page_pool);
 	printk("highmem bounce pool size: %d pages\n", POOL_SIZE);
 
 	return 0;
@@ -272,8 +268,7 @@ int init_emergency_isa_pool(void)
 		return 0;
 
 	isa_page_pool = mempool_create(ISA_POOL_SIZE, page_pool_alloc_isa, page_pool_free, NULL);
-	if (!isa_page_pool)
-		BUG();
+	BUG_ON(!isa_page_pool);
 
 	printk("isa bounce pool size: %d pages\n", ISA_POOL_SIZE);
 	return 0;



--===============2004700892357052==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2004700892357052==--
