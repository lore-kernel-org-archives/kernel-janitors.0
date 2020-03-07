From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Mar 2020 06:08:08 +0000
Subject: [PATCH] bfs: prevent underflow in bfs_find_entry()
Message-Id: <20200307060808.6nfyqnp2woq7d3cv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tigran A. Aivazian" <aivazian.tigran@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We check if "namelen" is larger than BFS_NAMELEN but we don't check
if it's less than zero so it causes a static checker.

    fs/bfs/dir.c:346 bfs_find_entry() warn: no lower bound on 'namelen'

It's nicer to make it unsigned anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/bfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bfs/dir.c b/fs/bfs/dir.c
index d8dfe3a0cb39..46a2663e5eb2 100644
--- a/fs/bfs/dir.c
+++ b/fs/bfs/dir.c
@@ -326,7 +326,7 @@ static struct buffer_head *bfs_find_entry(struct inode *dir,
 	struct buffer_head *bh = NULL;
 	struct bfs_dirent *de;
 	const unsigned char *name = child->name;
-	int namelen = child->len;
+	unsigned int namelen = child->len;
 
 	*res_dir = NULL;
 	if (namelen > BFS_NAMELEN)
-- 
2.11.0
