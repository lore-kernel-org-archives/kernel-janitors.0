From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:24 +0000
Subject: [KJ] [PATCH] [23/29] backend.c - vfree() checking cleanups
Message-Id: <41db1144.2c0caa34.2568.07c5@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10423460848184618=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10423460848184618==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

backend.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 backend.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/drivers/char/agp/backend.c	2004-12-24 13:35:23.000000000 -0800
+++ linux-2.6.10/drivers/char/agp/backend.c	2005-01-04 11:29:47.089849232 -0800
@@ -203,10 +203,9 @@
 		bridge->driver->cleanup();
 	if (bridge->driver->free_gatt_table)
 		bridge->driver->free_gatt_table();
-	if (bridge->key_list) {
-		vfree(bridge->key_list);
-		bridge->key_list -	}
+
+	vfree(bridge->key_list);
+	bridge->key_list  
 	if (bridge->driver->agp_destroy_page &&
 	    bridge->driver->needs_scratch_page)



--===============10423460848184618==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10423460848184618==--
