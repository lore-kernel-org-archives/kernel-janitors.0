From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:51 +0000
Subject: [KJ] [PATCH] [RESEND] [18/29] module.c - vfree() checking cleanups
Message-Id: <auto-000001227497@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28177802683970365=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28177802683970365==

module.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 module.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/arch/s390/kernel/module.c	2004-12-24 13:35:27.000000000 -0800
+++ linux-2.6.10/arch/s390/kernel/module.c	2005-01-04 11:20:15.357765720 -0800
@@ -396,8 +396,7 @@
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
 {
-	if (me->arch.syminfo)
-		vfree(me->arch.syminfo);
+	vfree(me->arch.syminfo);
 	return 0;
 }
 


--===============28177802683970365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28177802683970365==--
