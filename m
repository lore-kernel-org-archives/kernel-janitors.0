From: Martin Hicks <mort@wildopensource.com>
Date: Wed, 09 Mar 2005 16:39:21 +0000
Subject: [KJ] [PATCH/2.6.11] Spelling cleanups in shrinker code
Message-Id: <20050309163921.GQ3286@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35794957613064904=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35794957613064904==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This is just a spelling cleanup in the Shrinker code.  Generated against
2.6.11-rc4-mm1, but it applies with a small offset against 2.6.11

Thanks!
mh

-- 
Martin Hicks                Wild Open Source Inc.
mort@wildopensource.com     613-266-2296



Just a few small cleanups to make this coherent english.

Signed-Off-By:  Martin Hicks <mort@wildopensource.com>


Index: linux-2.6.10.toss/include/linux/mm.h
===================================================================
--- linux-2.6.10.toss.orig/include/linux/mm.h	2005-03-09 08:14:43.000000000 -0800
+++ linux-2.6.10.toss/include/linux/mm.h	2005-03-09 08:15:00.000000000 -0800
@@ -646,9 +646,9 @@
  * These functions are passed a count `nr_to_scan' and a gfpmask.  They should
  * scan `nr_to_scan' objects, attempting to free them.
  *
- * The callback must the number of objects which remain in the cache.
+ * The callback must return the number of objects which remain in the cache.
  *
- * The callback will be passes nr_to_scan == 0 when the VM is querying the
+ * The callback will be passed nr_to_scan == 0 when the VM is querying the
  * cache size, so a fastpath for that case is appropriate.
  */
 typedef int (*shrinker_t)(int nr_to_scan, unsigned int gfp_mask);

--===============35794957613064904==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35794957613064904==--
