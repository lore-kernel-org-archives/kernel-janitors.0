From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 21 Feb 2006 22:52:45 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/jffs2
Message-Id: <1140562365.26697.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45263587944560379=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45263587944560379==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/jffs2 to kzalloc() usage.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/jffs2/fs.c.orig	2006-02-21 23:48:28.000000000 +0100
+++ linux-2.6.16-rc4/fs/jffs2/fs.c	2006-02-21 23:49:02.000000000 +0100
@@ -485,12 +485,11 @@ int jffs2_do_fill_super(struct super_blo
 	if (ret)
 		return ret;
 
-	c->inocache_list = kmalloc(INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
+	c->inocache_list = kzalloc(INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
 	if (!c->inocache_list) {
 		ret = -ENOMEM;
 		goto out_wbuf;
 	}
-	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
 	if ((ret = jffs2_do_mount_fs(c)))
 		goto out_inohash;
--- linux-2.6.16-rc4/fs/jffs2/scan.c.orig	2006-02-21 23:48:06.000000000 +0100
+++ linux-2.6.16-rc4/fs/jffs2/scan.c	2006-02-21 23:48:20.000000000 +0100
@@ -106,12 +106,11 @@ int jffs2_scan_medium(struct jffs2_sb_in
 	}
 
 	if (jffs2_sum_active()) {
-		s = kmalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
+		s = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
 		if (!s) {
 			JFFS2_WARNING("Can't allocate memory for summary\n");
 			return -ENOMEM;
 		}
-		memset(s, 0, sizeof(struct jffs2_summary));
 	}
 
 	for (i=0; i<c->nr_blocks; i++) {
--- linux-2.6.16-rc4/fs/jffs2/super.c.orig	2006-02-21 23:51:02.000000000 +0100
+++ linux-2.6.16-rc4/fs/jffs2/super.c	2006-02-21 23:51:12.000000000 +0100
@@ -119,10 +119,9 @@ static struct super_block *jffs2_get_sb_
 	struct jffs2_sb_info *c;
 	int ret;
 
-	c = kmalloc(sizeof(*c), GFP_KERNEL);
+	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
-	memset(c, 0, sizeof(*c));
 	c->mtd = mtd;
 
 	sb = sget(fs_type, jffs2_sb_compare, jffs2_sb_set, c);



--===============45263587944560379==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45263587944560379==--
