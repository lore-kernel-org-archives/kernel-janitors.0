From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:50:10 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729115010.GQ2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25379636657769544=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============25379636657769544==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/namespace.c	Fri Jul 23 16:00:27 2004
+++ list_for_each/fs/namespace.c	Wed Jul 28 20:37:11 2004
@@ -536,7 +536,6 @@
 static struct vfsmount *copy_tree(struct vfsmount *mnt, struct dentry *dentry)
 {
 	struct vfsmount *res, *p, *q, *r, *s;
-	struct list_head *h;
 	struct nameidata nd;
 
 	res = q = clone_mnt(mnt, dentry);
@@ -545,8 +544,7 @@
 	q->mnt_mountpoint = mnt->mnt_mountpoint;
 
 	p = mnt;
-	for (h = mnt->mnt_mounts.next; h != &mnt->mnt_mounts; h = h->next) {
-		r = list_entry(h, struct vfsmount, mnt_child);
+	list_for_each_entry(r, &mnt->mnt_mounts, mnt_child) {
 		if (!lives_below_in_same_fs(r->mnt_mountpoint, dentry))
 			continue;
 

--===============25379636657769544==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25379636657769544==--
