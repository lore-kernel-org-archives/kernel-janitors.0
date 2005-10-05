From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 05 Oct 2005 03:07:15 +0000
Subject: [KJ] [PATCH] reiserfs: fix gfp flags type
Message-Id: <20051004200715.291efdf6.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6206724338375742=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6206724338375742==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix nocast sparse warnings in reiserfs:
fs/reiserfs/fix_node.c:2030:21: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 fs/reiserfs/fix_node.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

diff -Naurp linux-2614-rc2-git6/fs/reiserfs/fix_node.c~reiser_gfpmask linux-2614-rc2-git6/fs/reiserfs/fix_node.c
--- linux-2614-rc2-git6/fs/reiserfs/fix_node.c~reiser_gfpmask	2005-08-28 16:41:01.000000000 -0700
+++ linux-2614-rc2-git6/fs/reiserfs/fix_node.c	2005-10-03 22:14:43.000000000 -0700
@@ -2022,7 +2022,8 @@ static int get_neighbors(struct tree_bal
 }
 
 #ifdef CONFIG_REISERFS_CHECK
-void *reiserfs_kmalloc(size_t size, int flags, struct super_block *s)
+void *reiserfs_kmalloc(size_t size, unsigned int __nocast flags,
+			struct super_block *s)
 {
 	void *vp;
 	static size_t malloced;


---

--===============6206724338375742==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6206724338375742==--
