From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:17:27 +0000
Subject: [Kernel-janitors] [PATCH] lib/zlib-deflate MIN/MAX removal
Message-Id: <403E6267.10304@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000407060407050307090903"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000407060407050307090903
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Best Regards
Michael



--------------000407060407050307090903
Content-Type: text/plain;
 name="minmax_lib_zlib.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_lib_zlib.patch"

--- linux-2.6.3.org/lib/zlib_deflate/deftree.c	2004-02-18 04:57:20.000000000 +0100
+++ linux-2.6.3.test/lib/zlib_deflate/deftree.c	2004-02-26 21:18:08.675049760 +0100
@@ -217,10 +217,6 @@
 }
 #endif /* DEBUG_ZLIB */
 
-
-#define MAX(a,b) (a >= b ? a : b)
-/* the arguments must not have side effects */
-
 /* ===========================================================================
  * Initialize the various 'constant' tables. In a multi-threaded environment,
  * this function may be called by two threads concurrently, but this is
@@ -598,7 +594,7 @@
 
         /* Create a new node father of n and m */
         tree[node].Freq = tree[n].Freq + tree[m].Freq;
-        s->depth[node] = (uch) (MAX(s->depth[n], s->depth[m]) + 1);
+        s->depth[node] = (uch) (max(s->depth[n], s->depth[m]) + 1);
         tree[n].Dad = tree[m].Dad = (ush)node;
 #ifdef DUMP_BL_TREE
         if (tree == s->bl_tree) {

--------------000407060407050307090903
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000407060407050307090903--
