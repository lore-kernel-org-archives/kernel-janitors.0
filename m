From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Feb 2015 10:56:00 +0000
Subject: [patch] IB/qib: fix a do nothing for loop
Message-Id: <20150220105600.GE7895@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We accidentally deleted a semi-colon here and changed this do-nothing
loop into a do-something loop.

Fixes: ff93905fb92d ('IB/qib: Fix checkpatch warnings')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/qib/qib_wc_x86_64.c b/drivers/infiniband/hw/qib/qib_wc_x86_64.c
index 4fcf2459..81b225f 100644
--- a/drivers/infiniband/hw/qib/qib_wc_x86_64.c
+++ b/drivers/infiniband/hw/qib/qib_wc_x86_64.c
@@ -92,7 +92,7 @@ int qib_enable_wc(struct qib_devdata *dd)
 	}
 
 	for (bits = 0; !(piolen & (1ULL << bits)); bits++)
-		/* do nothing */
+		; /* do nothing */
 
 	if (piolen != (1ULL << bits)) {
 		piolen >>= bits;
