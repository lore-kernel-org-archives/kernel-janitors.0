From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 12:25:13 +0000
Subject: [PATCH][next] NFSv4.2: fix error return on memory allocation failure
Message-Id: <20201216122513.15004-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, Frank van der Linden <fllinden@amazon.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when an alloc_page fails the error return is not set in
variable err and a garbage initialized value is returned. Fix this
by setting err to -ENOMEM before taking the error return path.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: a1f26739ccdc ("NFSv4.2: improve page handling for GETXATTR")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/nfs42proc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/nfs/nfs42proc.c b/fs/nfs/nfs42proc.c
index b9836e2ce4a2..f3fd935620fc 100644
--- a/fs/nfs/nfs42proc.c
+++ b/fs/nfs/nfs42proc.c
@@ -1301,6 +1301,7 @@ ssize_t nfs42_proc_getxattr(struct inode *inode, const char *name,
 		pages[i] = alloc_page(GFP_KERNEL);
 		if (!pages[i]) {
 			np = i + 1;
+			err = -ENOMEM;
 			goto out;
 		}
 	}
-- 
2.29.2
