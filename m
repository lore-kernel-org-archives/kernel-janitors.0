From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2012 07:07:35 +0000
Subject: [patch] NFS: cleanup endian type in decode_ds_addr()
Message-Id: <20120112070735.GB2975@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

port is supposed to be a __be16 here.  The existing code should work
fine, but this is a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
index ed388aa..8ae9190 100644
--- a/fs/nfs/nfs4filelayoutdev.c
+++ b/fs/nfs/nfs4filelayoutdev.c
@@ -382,7 +382,7 @@ decode_ds_addr(struct xdr_stream *streamp, gfp_t gfp_flags)
 {
 	struct nfs4_pnfs_ds_addr *da = NULL;
 	char *buf, *portstr;
-	u32 port;
+	__be16 port;
 	int nlen, rlen;
 	int tmp[2];
 	__be32 *p;
