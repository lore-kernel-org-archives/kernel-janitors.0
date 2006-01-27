From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:18 +0000
Subject: [KJ] [Patch 1/12] BUG_ON() Conversion in fs/coda/
Message-Id: <1138354339.7391.39.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============017878798813707242=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============017878798813707242==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/coda/cache.c.orig	2006-01-27 01:23:25.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/coda/cache.c	2006-01-27 01:23:43.000000000 +0100
@@ -51,7 +51,7 @@ void coda_cache_clear_all(struct super_b
         struct coda_sb_info *sbi;
 
         sbi = coda_sbp(sb);
-        if (!sbi) BUG();
+	BUG_ON(!sbi);
 
 	atomic_inc(&permission_epoch);
 }
--- linux-2.6.16-rc1-git4/fs/coda/cnode.c.orig	2006-01-27 01:23:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/coda/cnode.c	2006-01-27 01:24:13.000000000 +0100
@@ -120,8 +120,7 @@ void coda_replace_fid(struct inode *inod
 	
 	cii = ITOC(inode);
 
-	if (!coda_fideq(&cii->c_fid, oldfid))
-		BUG();
+	BUG_ON(!coda_fideq(&cii->c_fid, oldfid));
 
 	/* replace fid and rehash inode */
 	/* XXX we probably need to hold some lock here! */



--===============017878798813707242==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============017878798813707242==--
