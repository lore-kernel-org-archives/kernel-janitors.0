From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:12 +0000
Subject: [KJ] [PATCH] [17/29] swapfile.c - vfree() checking cleanups
Message-Id: <41db1138.47531b8b.2568.07be@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22112545040477327=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22112545040477327==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

swapfile.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 swapfile.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/mm/swapfile.c	2004-12-24 13:34:26.000000000 -0800
+++ linux-2.6.10/mm/swapfile.c	2005-01-04 11:15:34.761422848 -0800
@@ -1592,8 +1592,7 @@
 		++least_priority;
 	swap_list_unlock();
 	destroy_swap_extents(p);
-	if (swap_map)
-		vfree(swap_map);
+	vfree(swap_map);
 	if (swap_file)
 		filp_close(swap_file, NULL);
 out:



--===============22112545040477327==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22112545040477327==--
