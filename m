From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 May 2012 17:40:17 +0000
Subject: [patch] NFS: silence Sparse warning about a non-ANSI declaration
Message-Id: <20120504174017.GB18827@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains because without the "void", it means that the function
takes a variable number of arguments.

fs/nfs/read.c:38:43: warning: non-ANSI function declaration of function
	'nfs_readhdr_alloc'

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/read.c b/fs/nfs/read.c
index 37c9eb2..f23cf25 100644
--- a/fs/nfs/read.c
+++ b/fs/nfs/read.c
@@ -35,7 +35,7 @@ static const struct nfs_pgio_completion_ops nfs_async_read_completion_ops;
 
 static struct kmem_cache *nfs_rdata_cachep;
 
-struct nfs_read_header *nfs_readhdr_alloc()
+struct nfs_read_header *nfs_readhdr_alloc(void)
 {
 	struct nfs_read_header *rhdr;
 
