From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:36:44 +0000
Subject: [patch] hfsplus: add missing curly braces in hfsplus_delete_cat()
Message-Id: <20150225133644.GW19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vyacheslav Dubeyko <slava@dubeyko.com>, Sougata Santra <sougata@tuxera.com>, Sergei Antonov <saproj@gmail.com>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

This doesn't change how the code works, but clearly the curly braces
were intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/hfsplus/catalog.c b/fs/hfsplus/catalog.c
index 7892e6f..022974a 100644
--- a/fs/hfsplus/catalog.c
+++ b/fs/hfsplus/catalog.c
@@ -350,10 +350,11 @@ int hfsplus_delete_cat(u32 cnid, struct inode *dir, struct qstr *str)
 			&fd.search_key->cat.name.unicode,
 			off + 2, len);
 		fd.search_key->key_len = cpu_to_be16(6 + len);
-	} else
+	} else {
 		err = hfsplus_cat_build_key(sb, fd.search_key, dir->i_ino, str);
 		if (unlikely(err))
 			goto out;
+	}
 
 	err = hfs_brec_find(&fd, hfs_find_rec_by_key);
 	if (err)
