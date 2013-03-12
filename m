From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Mar 2013 11:03:07 +0000
Subject: [patch] IB/ipath: add a range check before bumping the stats
Message-Id: <20130312110307.GA22921@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

My static checker complains that this could corrupt memory.  It
seems valid to add a range check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't test this.

diff --git a/drivers/infiniband/hw/ipath/ipath_verbs.c b/drivers/infiniband/hw/ipath/ipath_verbs.c
index 439c35d..f15dd70 100644
--- a/drivers/infiniband/hw/ipath/ipath_verbs.c
+++ b/drivers/infiniband/hw/ipath/ipath_verbs.c
@@ -621,6 +621,10 @@ void ipath_ib_rcv(struct ipath_ibdev *dev, void *rhdr, void *data,
 	}
 
 	opcode = be32_to_cpu(ohdr->bth[0]) >> 24;
+	if (opcode >= ARRAY_SIZE(dev->opstats)) {
+		dev->rcv_errors++;
+		goto bail;
+	}
 	dev->opstats[opcode].n_bytes += tlen;
 	dev->opstats[opcode].n_packets++;
 
