From: Dan Carpenter <error27@gmail.com>
Date: Wed, 21 Apr 2010 10:30:32 +0000
Subject: [patch] fs/sysv: dereferencing ERR_PTR()
Message-Id: <20100421103032.GB29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I moved the dir_put_page() inside the if condition so we don't dereference
"page", if it's an ERR_PTR().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/sysv/dir.c b/fs/sysv/dir.c
index 4e50286..1dabed2 100644
--- a/fs/sysv/dir.c
+++ b/fs/sysv/dir.c
@@ -164,8 +164,8 @@ struct sysv_dir_entry *sysv_find_entry(struct dentry *dentry, struct page **res_
 							name, de->name))
 					goto found;
 			}
+			dir_put_page(page);
 		}
-		dir_put_page(page);
 
 		if (++n >= npages)
 			n = 0;
