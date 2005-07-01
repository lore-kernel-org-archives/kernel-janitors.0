From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 01 Jul 2005 18:19:24 +0000
Subject: [KJ] [PATCH] GCC4 warning: no return statement in function
Message-Id: <42C5892C.40907@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010807020104050107060105"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010807020104050107060105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------010807020104050107060105
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="audit-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="audit-patch.patch"



Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

The function kauditd_thread() does not return an integer as the declaration
says it should. There is no return statement in the body whatsoever and looks
like the function should have been declared as returning void.
---


diff -puN kernel/audit.c~audit-patch kernel/audit.c
--- linux-2.6.13-rc1.kj.jm.gcc4/kernel/audit.c~audit-patch	2005-07-01 10:59:36.417950168 -0700
+++ linux-2.6.13-rc1.kj.jm.gcc4-jessem/kernel/audit.c	2005-07-01 11:00:52.979311072 -0700
@@ -275,7 +275,7 @@ static int audit_set_failure(int state, 
 	return old;
 }
 
-int kauditd_thread(void *dummy)
+void kauditd_thread(void *dummy)
 {
 	struct sk_buff *skb;
 
_

--------------010807020104050107060105
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010807020104050107060105--
