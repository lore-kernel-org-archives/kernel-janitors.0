From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2016 09:26:11 +0000
Subject: [patch] hfs: fix hfs_readdir()
Message-Id: <20160126092611.GD15717@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chengyu Song <csong84@gatech.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I was looking through static analysis warnings and we seem to be copying
garbage into &rd->key.  This goes back to before the start of git...

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  Please review carefully.

diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
index 70788e0..66485d7 100644
--- a/fs/hfs/dir.c
+++ b/fs/hfs/dir.c
@@ -163,7 +163,7 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
 		rd->file = file;
 		list_add(&rd->list, &HFS_I(inode)->open_dir_list);
 	}
-	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
+	memcpy(&rd->key, &fd.key->cat, sizeof(struct hfs_cat_key));
 out:
 	hfs_find_exit(&fd);
 	return err;
