From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Nov 2010 18:20:05 +0000
Subject: [patch] jffs2: typo in comment
Message-Id: <20101115182005.GA3941@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org

It says FB instead of FS (file system).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index f864005..0bc6a6c 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -144,4 +144,4 @@ struct jffs2_sb_info {
 	void *os_priv;
 };
 
-#endif /* _JFFS2_FB_SB */
+#endif /* _JFFS2_FS_SB */
