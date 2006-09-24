From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 24 Sep 2006 22:48:16 +0000
Subject: [KJ] [Patch] BUG_ON() conversion in fs/nfsd/
Message-Id: <1159138097.9062.3.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts an if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-git3/fs/nfsd/nfs4xdr.c.orig	2006-09-24 23:05:17.000000000 +0200
+++ linux-2.6.18-git3/fs/nfsd/nfs4xdr.c	2006-09-24 23:05:34.000000000 +0200
@@ -198,8 +198,7 @@ static char *savemem(struct nfsd4_compou
 		p = new;
 		memcpy(p, argp->tmp, nbytes);
 	} else {
-		if (p != argp->tmpp)
-			BUG();
+		BUG_ON(p != argp->tmpp);
 		argp->tmpp = NULL;
 	}
 	if (defer_free(argp, kfree, p)) {


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
