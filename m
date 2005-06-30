From: aLeJ <fuzzy.alej@gmail.com>
Date: Thu, 30 Jun 2005 08:28:42 +0000
Subject: [KJ] fs/smbfs/proc.c -> replace direct assignment with
Message-Id: <1120126573.24539.6.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Description:
Use set_current_state() instead of using a direct assignment

Signed-off-by: Alejandro Andr=E9s <fuzzy.alej@gmail.com>

--- fs/smbfs/proc.c.orig	2005-06-22 21:33:05.000000000 +0200
+++ fs/smbfs/proc.c	2005-06-30 12:02:45.000000000 +0200
@@ -2397,7 +2397,7 @@ smb_proc_readdir_long(struct file *filp,
 		if (req->rq_rcls =3D ERRSRV && req->rq_err =3D ERRerror) {
 			/* a damn Win95 bug - sometimes it clags if you=20
 			   ask it too fast */
-			current->state =3D TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(HZ/5);
 			continue;
                 }


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
