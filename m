From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:47 +0000
Subject: [KJ] [PATCH] [RESEND] [14/29] ebtables.c - vfree() checking cleanups
Message-Id: <auto-000001227493@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14127576675910181=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14127576675910181==

ebtables.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 ebtables.c |   21 +++++++--------------
 1 files changed, 7 insertions(+), 14 deletions(-)


--- linux-2.6.10-vanilla/net/bridge/netfilter/ebtables.c	2004-12-24 13:34:30.000000000 -0800
+++ linux-2.6.10/net/bridge/netfilter/ebtables.c	2005-01-04 11:17:43.823802384 -0800
@@ -858,8 +858,7 @@
 		if (repl->valid_hooks & (1 << i))
 			if (check_chainloops(newinfo->hook_entry[i],
 			   cl_s, udc_cnt, i, newinfo->entries)) {
-				if (cl_s)
-					vfree(cl_s);
+				vfree(cl_s);
 				return -EINVAL;
 			}
 
@@ -882,8 +881,7 @@
 		EBT_ENTRY_ITERATE(newinfo->entries, newinfo->entries_size,
 		   ebt_cleanup_entry, &i);
 	}
-	if (cl_s)
-		vfree(cl_s);
+	vfree(cl_s);
 	return ret;
 }
 
@@ -1029,8 +1027,7 @@
 	}
 	vfree(table);
 
-	if (counterstmp)
-		vfree(counterstmp);
+	vfree(counterstmp);
 	return ret;
 
 free_unlock:
@@ -1039,8 +1036,7 @@
 	EBT_ENTRY_ITERATE(newinfo->entries, newinfo->entries_size,
 	   ebt_cleanup_entry, NULL);
 free_counterstmp:
-	if (counterstmp)
-		vfree(counterstmp);
+	vfree(counterstmp);
 	/* can be initialized in translate_table() */
 	if (newinfo->chainstack) {
 		for (i = 0; i < NR_CPUS; i++)
@@ -1048,11 +1044,9 @@
 		vfree(newinfo->chainstack);
 	}
 free_entries:
-	if (newinfo->entries)
-		vfree(newinfo->entries);
+	vfree(newinfo->entries);
 free_newinfo:
-	if (newinfo)
-		vfree(newinfo);
+	vfree(newinfo);
 	return ret;
 }
 
@@ -1212,8 +1206,7 @@
 	down(&ebt_mutex);
 	LIST_DELETE(&ebt_tables, table);
 	up(&ebt_mutex);
-	if (table->private->entries)
-		vfree(table->private->entries);
+	vfree(table->private->entries);
 	if (table->private->chainstack) {
 		for (i = 0; i < NR_CPUS; i++)
 			vfree(table->private->chainstack[i]);


--===============14127576675910181==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14127576675910181==--
