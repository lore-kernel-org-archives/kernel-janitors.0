From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 04 Jan 2006 22:44:17 +0000
Subject: [KJ] [PATCH RESEND] mm: Clean up local variables
Message-Id: <20060104224417.GD1243@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============063098656127567043=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============063098656127567043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Clean up a local variable with the same name as a variable in a larger
block. Also move a variable into the block where it's actually used.

Spotted by http://linuxicc.sourceforge.net/

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 slab.c     |    3 ++-
 swapfile.c |   12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff -urpN -X dontdiff linux-2.6.15/mm/slab.c linux-2.6.15~tk/mm/slab.c
--- linux-2.6.15/mm/slab.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.15~tk/mm/slab.c	2006-01-04 23:35:15.000000000 +0100
@@ -853,7 +853,6 @@ static int __devinit cpuup_callback(stru
 	struct kmem_list3 *l3 = NULL;
 	int node = cpu_to_node(cpu);
 	int memsize = sizeof(struct kmem_list3);
-	struct array_cache *nc = NULL;
 
 	switch (action) {
 	case CPU_UP_PREPARE:
@@ -890,6 +889,8 @@ static int __devinit cpuup_callback(stru
 		/* Now we can go ahead with allocating the shared array's
 		  & array cache's */
 		list_for_each_entry(cachep, &cache_chain, next) {
+			struct array_cache *nc;
+
 			nc = alloc_arraycache(node, cachep->limit,
 					cachep->batchcount);
 			if (!nc)
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
 

--===============063098656127567043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============063098656127567043==--
