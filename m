From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 08:53:25 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/s390
Message-Id: <1141721605.15005.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5736805467539825=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============5736805467539825==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch converts drivers/rapidio to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/s390/kernel/debug.c.orig	2006-03-07 09:22:00.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/s390/kernel/debug.c	2006-03-07 09:24:13.000000000 +0100
@@ -204,16 +204,13 @@ debug_areas_alloc(int pages_per_area, in
 			goto fail_malloc_areas2;
 		}
 		for(j = 0; j < pages_per_area; j++) {
-			areas[i][j] = (debug_entry_t*)kmalloc(PAGE_SIZE,
-						GFP_KERNEL);
+			areas[i][j] = kzalloc(PAGE_SIZE, GFP_KERNEL);
 			if(!areas[i][j]) {
 				for(j--; j >=0 ; j--) {
 					kfree(areas[i][j]);
 				}
 				kfree(areas[i]);
 				goto fail_malloc_areas2;
-			} else {
-				memset(areas[i][j],0,PAGE_SIZE);
 			}
 		}
 	}
@@ -249,14 +246,12 @@ debug_info_alloc(char *name, int pages_p
 	rc = (debug_info_t*) kmalloc(sizeof(debug_info_t), GFP_KERNEL);
 	if(!rc)
 		goto fail_malloc_rc;
-	rc->active_entries = (int*)kmalloc(nr_areas * sizeof(int), GFP_KERNEL);
+	rc->active_entries = kcalloc(nr_areas, sizeof(int), GFP_KERNEL);
 	if(!rc->active_entries)
 		goto fail_malloc_active_entries;
-	memset(rc->active_entries, 0, nr_areas * sizeof(int));
-	rc->active_pages = (int*)kmalloc(nr_areas * sizeof(int), GFP_KERNEL);
+	rc->active_pages = kcalloc(nr_areas, sizeof(int), GFP_KERNEL);
 	if(!rc->active_pages)
 		goto fail_malloc_active_pages;
-	memset(rc->active_pages, 0, nr_areas * sizeof(int));
 	if((mode == ALL_AREAS) && (pages_per_area != 0)){
 		rc->areas = debug_areas_alloc(pages_per_area, nr_areas);
 		if(!rc->areas)
--- linux-2.6.16-rc5-mm1/arch/s390/appldata/appldata_base.c.orig	2006-03-07 09:24:23.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/s390/appldata/appldata_base.c	2006-03-07 09:24:36.000000000 +0100
@@ -531,12 +531,11 @@ int appldata_register_ops(struct appldat
 		P_ERROR("ctl_nr %i already in use!\n", ops->ctl_nr);
 		return -EBUSY;
 	}
-	ops->ctl_table = kmalloc(4*sizeof(struct ctl_table), GFP_KERNEL);
+	ops->ctl_table = kzalloc(4*sizeof(struct ctl_table), GFP_KERNEL);
 	if (ops->ctl_table == NULL) {
 		P_ERROR("Not enough memory for %s ctl_table!\n", ops->name);
 		return -ENOMEM;
 	}
-	memset(ops->ctl_table, 0, 4*sizeof(struct ctl_table));
 
 	spin_lock(&appldata_ops_lock);
 	list_for_each(lh, &appldata_ops_list) {



--===============5736805467539825==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5736805467539825==--
