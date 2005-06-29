From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 29 Jun 2005 04:05:09 +0000
Subject: [KJ] [PATCH] GCC4 warning: control may reach end of non-void
Message-Id: <42C21DF5.7020709@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080104060203090405050200"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080104060203090405050200
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080104060203090405050200
Content-Type: text/x-diff; x-mac-type="0"; x-mac-creator="0";
	name="compat-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="compat-patch.patch"


Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

GCC complains because the function put_compat_shminfo() can't get to its return statement if there is no error... If the function does not return -EFALUT, it doesn't return anything at all. Looks like a typo.
---


diff -puN ipc/compat.c~compat-patch ipc/compat.c
--- linux-2.6.12-rc6.git10.kj.gcc4/ipc/compat.c~compat-patch	2005-06-28 20:37:20.177647168 -0700
+++ linux-2.6.12-rc6.git10.kj.gcc4-root/ipc/compat.c	2005-06-28 20:37:49.889130336 -0700
@@ -572,6 +572,7 @@ static inline int put_compat_shminfo(str
 	err |= __put_user(smi->shmmni, &up->shmmni);
 	err |= __put_user(smi->shmseg, &up->shmseg);
 	err |= __put_user(smi->shmall, &up->shmall);
+	return err;
 }
 
 static inline int put_compat_shm_info(struct shm_info __user *ip,
_

--------------080104060203090405050200
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080104060203090405050200--
