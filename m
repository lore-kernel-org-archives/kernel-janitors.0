From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:23 +0000
Subject: [PATCH 1/15] NFSv4.1: don't export static symbol
Message-Id: <1426092997-30605-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: kernel-janitors@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/nfs/pnfs.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -1902,7 +1902,6 @@ static void pnfs_writehdr_free(struct nf
 	pnfs_put_lseg(hdr->lseg);
 	nfs_pgio_header_free(hdr);
 }
-EXPORT_SYMBOL_GPL(pnfs_writehdr_free);
 
 int
 pnfs_generic_pg_writepages(struct nfs_pageio_descriptor *desc)
@@ -2032,7 +2031,6 @@ static void pnfs_readhdr_free(struct nfs
 	pnfs_put_lseg(hdr->lseg);
 	nfs_pgio_header_free(hdr);
 }
-EXPORT_SYMBOL_GPL(pnfs_readhdr_free);
 
 int
 pnfs_generic_pg_readpages(struct nfs_pageio_descriptor *desc)

