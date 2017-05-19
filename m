From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:31:12 +0000
Subject: [PATCH] pNFS/flexfiles: missing error code in ff_layout_alloc_lseg()
Message-Id: <20170519213112.udkpg2nstamr2h2h@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>, Tom Haynes <loghyr@primarydata.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Thomas Gleixner <tglx@linutronix.de>, Weston Andros Adamson <dros@primarydata.com>, Fred Isaman <fred.isaman@gmail.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

If xdr_inline_decode() fails then we end up returning ERR_PTR(0).  The
caller treats NULL returns as -ENOMEM so it doesn't really hurt runtime,
but obviously we intended to set an error code here.

Fixes: d67ae825a59d ("pnfs/flexfiles: Add the FlexFile Layout Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/flexfilelayout/flexfilelayout.c b/fs/nfs/flexfilelayout/flexfilelayout.c
index f5714ee01000..23542dc44a25 100644
--- a/fs/nfs/flexfilelayout/flexfilelayout.c
+++ b/fs/nfs/flexfilelayout/flexfilelayout.c
@@ -454,6 +454,7 @@ ff_layout_alloc_lseg(struct pnfs_layout_hdr *lh,
 			goto out_err_free;
 
 		/* fh */
+		rc = -EIO;
 		p = xdr_inline_decode(&stream, 4);
 		if (!p)
 			goto out_err_free;
