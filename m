From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Mon, 17 May 2004 23:23:35 +0000
Subject: [Kernel-janitors] [PATCH] - fs/namespace.c::copy_namespace()
Message-Id: <20040517232335.GD6248@lorien.prodam>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5926089234591887=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5926089234591887==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


 Hi!

 This patch is a little clean up, maybe it is the kind of
thing which Randy could say: "is better work on important
things". But it is impossible to read this code without
patch it. :-)

 put_namespace() is called four in different places, and the
goto is a little useless in that context. This patch puts the
things toghether.

 fs/namespace.c |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)


diff -X dontdiff -Nparu a/fs/namespace.c a~/fs/namespace.c
--- a/fs/namespace.c	2004-05-10 13:36:46.000000000 -0300
+++ a~/fs/namespace.c	2004-05-12 16:13:22.000000000 -0300
@@ -868,23 +868,26 @@ int copy_namespace(int flags, struct tas
 	struct namespace *new_ns;
 	struct vfsmount *rootmnt = NULL, *pwdmnt = NULL, *altrootmnt = NULL;
 	struct fs_struct *fs = tsk->fs;
+	int rc = 0;
 
 	if (!namespace)
-		return 0;
+		return rc;
 
 	get_namespace(namespace);
 
 	if (!(flags & CLONE_NEWNS))
-		return 0;
+		return rc;
 
 	if (!capable(CAP_SYS_ADMIN)) {
-		put_namespace(namespace);
-		return -EPERM;
+		rc = -EPERM;
+		goto out;
 	}
 
 	new_ns = kmalloc(sizeof(struct namespace), GFP_KERNEL);
-	if (!new_ns)
+	if (!new_ns) {
+		rc = -ENOMEM;
 		goto out;
+	}
 
 	atomic_set(&new_ns->count, 1);
 	init_rwsem(&new_ns->sem);
@@ -896,6 +899,7 @@ int copy_namespace(int flags, struct tas
 	if (!new_ns->root) {
 		up_write(&tsk->namespace->sem);
 		kfree(new_ns);
+		rc = -ENOMEM;
 		goto out;
 	}
 	spin_lock(&vfsmount_lock);
@@ -938,12 +942,9 @@ int copy_namespace(int flags, struct tas
 	if (altrootmnt)
 		mntput(altrootmnt);
 
-	put_namespace(namespace);
-	return 0;
-
 out:
 	put_namespace(namespace);
-	return -ENOMEM;
+	return rc;
 }
 
 asmlinkage long sys_mount(char __user * dev_name, char __user * dir_name,
-- 
Luiz Fernando N. Capitulino
<http://www.telecentros.sp.gov.br>

--===============5926089234591887==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5926089234591887==--
