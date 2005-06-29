From: aLeJ <fuzzy.alej@gmail.com>
Date: Wed, 29 Jun 2005 16:22:30 +0000
Subject: [KJ] kernel/module.c use __set_current_state() instead of direct
Message-Id: <1120069126.18231.2.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9792402236553166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============9792402236553166==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Description:
Use of __set_current_state() instead of direct assigment of
current->state.

Signed-off-by: Alejandro Andres <fuzzy.alej@gmail.com>

--- linux-2.6.12.1/kernel/module.c.orig	2005-06-29 20:11:28.000000000
+0200
+++ linux-2.6.12.1/kernel/module.c	2005-06-29 20:12:02.000000000 +0200
@@ -518,7 +518,7 @@ static void wait_for_zero_refcount(struc
 			break;
 		schedule();
 	}
-	current->state = TASK_RUNNING;
+	__set_current_state(TASK_RUNNING);
 	down(&module_mutex);
 }
 



--===============9792402236553166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9792402236553166==--
