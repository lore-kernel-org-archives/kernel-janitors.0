From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:17 +0000
Subject: [KJ] [Patch 3/8] BUG_ON() Conversion in fs/dcache.c
Message-Id: <1138296017.9170.22.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30036468312375675=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30036468312375675==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/dcache.c.orig	2006-01-26 17:54:28.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/dcache.c	2006-01-26 17:54:39.000000000 +0100
@@ -792,7 +792,7 @@ struct dentry *d_alloc_name(struct dentr
  
 void d_instantiate(struct dentry *entry, struct inode * inode)
 {
-	if (!list_empty(&entry->d_alias)) BUG();
+	BUG_ON(!list_empty(&entry->d_alias));
 	spin_lock(&dcache_lock);
 	if (inode)
 		list_add(&entry->d_alias, &inode->i_dentry);



--===============30036468312375675==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30036468312375675==--
