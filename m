From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:45 +0000
Subject: [PATCH 12/12] hpfs: drop unneeded newline
Message-Id: <1514386305-7402-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

hpfs_error prints a newline at the end of the message string, so the
message string does not need to include a newline explicitly.  Done
using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/hpfs/dnode.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
index a4ad18a..fc1809b 100644
--- a/fs/hpfs/dnode.c
+++ b/fs/hpfs/dnode.c
@@ -914,7 +914,8 @@ struct hpfs_dirent *map_dirent(struct inode *inode, dnode_secno dno,
 	struct hpfs_dirent *de_end;
 	int c1, c2 = 0;
 
-	if (!S_ISDIR(inode->i_mode)) hpfs_error(inode->i_sb, "map_dirent: not a directory\n");
+	if (!S_ISDIR(inode->i_mode))
+		hpfs_error(inode->i_sb, "map_dirent: not a directory");
 	again:
 	if (hpfs_sb(inode->i_sb)->sb_chk)
 		if (hpfs_stop_cycles(inode->i_sb, dno, &c1, &c2, "map_dirent")) return NULL;

