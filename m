From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:18:02 +0000
Subject: [KJ] [PATCH] [RESEND] [28/29] generic.c - vfree() checking cleanups
Message-Id: <auto-000001227509@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50809056218540105=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50809056218540105==

generic.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 generic.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/drivers/char/agp/generic.c	2004-12-24 13:34:31.000000000 -0800
+++ linux-2.6.10/drivers/char/agp/generic.c	2005-01-04 11:29:26.909917048 -0800
@@ -891,8 +891,7 @@
 
 void agp_generic_free_by_type(struct agp_memory *curr)
 {
-	if (curr->memory != NULL)
-		vfree(curr->memory);
+	vfree(curr->memory);
 
 	agp_free_key(curr->key);
 	kfree(curr);


--===============50809056218540105==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50809056218540105==--
