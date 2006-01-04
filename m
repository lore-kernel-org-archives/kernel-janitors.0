From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 04 Jan 2006 17:01:19 +0000
Subject: [KJ] [PATCH] mm: Clean up local variables
Message-Id: <20060104170119.GB1243@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67549000933956149=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67549000933956149==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Clean up local variables with the same name as a variable in a larger
block. See http://linuxicc.sourceforge.net/Remark_1599.html for details.

Spotted by http://linuxicc.sourceforge.net/

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 mm/slab.c     |    1 -
 mm/swapfile.c |   12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff -urpN -X dontdiff linux-2.6.15/mm/slab.c linux-2.6.15~tk/mm/slab.c
--- linux-2.6.15/mm/slab.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.15~tk/mm/slab.c	2006-01-04 15:52:41.000000000 +0100
@@ -921,7 +921,6 @@ static int __devinit cpuup_callback(stru
 		down(&cache_chain_sem);
 
 		list_for_each_entry(cachep, &cache_chain, next) {
-			struct array_cache *nc;
 			cpumask_t mask;
 
 			mask = node_to_cpumask(node);
diff -urpN -X dontdiff linux-2.6.15/mm/swapfile.c linux-2.6.15~tk/mm/swapfile.c
--- linux-2.6.15/mm/swapfile.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.15~tk/mm/swapfile.c	2006-01-04 15:59:20.000000000 +0100
@@ -1473,7 +1473,7 @@ asmlinkage long sys_swapon(const char __
 			goto bad_swap;
 		if (swap_header->info.nr_badpages > MAX_SWAP_BADPAGES)
 			goto bad_swap;
-		
+
 		/* OK, set up the swap map and apply the bad block list */
 		if (!(p->swap_map = vmalloc(maxpages * sizeof(short)))) {
 			error = -ENOMEM;
@@ -1482,17 +1482,17 @@ asmlinkage long sys_swapon(const char __
 
 		error = 0;
 		memset(p->swap_map, 0, maxpages * sizeof(short));
-		for (i=0; i<swap_header->info.nr_badpages; i++) {
-			int page = swap_header->info.badpages[i];
-			if (page <= 0 || page >= swap_header->info.last_page)
+		for (i = 0; i < swap_header->info.nr_badpages; i++) {
+			int page_nr = swap_header->info.badpages[i];
+			if (page_nr <= 0 || page_nr >= swap_header->info.last_page)
 				error = -EINVAL;
 			else
-				p->swap_map[page] = SWAP_MAP_BAD;
+				p->swap_map[page_nr] = SWAP_MAP_BAD;
 		}
 		nr_good_pages = swap_header->info.last_page -
 				swap_header->info.nr_badpages -
 				1 /* header page */;
-		if (error) 
+		if (error)
 			goto bad_swap;
 	}
 

--===============67549000933956149==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67549000933956149==--
