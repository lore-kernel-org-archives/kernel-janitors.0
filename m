From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2013 07:19:15 +0000
Subject: [patch] IB/mthca: make type explicit in mthca_INIT_HCA()
Message-Id: <20130816071915.GB6053@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The type of the second argument to the MTHCA_PUT() macro determines how
many bytes will be written to inbox.  Judging from the context, the
current code is doing the right thing by writing an int of data.  But I
would feel more comfortable making it explicit that we are writing 32
bits.

This is just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/mthca/mthca_cmd.c b/drivers/infiniband/hw/mthca/mthca_cmd.c
index 9d3e5c1..2d2a401 100644
--- a/drivers/infiniband/hw/mthca/mthca_cmd.c
+++ b/drivers/infiniband/hw/mthca/mthca_cmd.c
@@ -1359,7 +1359,7 @@ int mthca_INIT_HCA(struct mthca_dev *dev,
 	memset(inbox, 0, INIT_HCA_IN_SIZE);
 
 	if (dev->mthca_flags & MTHCA_FLAG_SINAI_OPT)
-		MTHCA_PUT(inbox, 0x1, INIT_HCA_FLAGS1_OFFSET);
+		MTHCA_PUT(inbox, (u32)0x1, INIT_HCA_FLAGS1_OFFSET);
 
 #if defined(__LITTLE_ENDIAN)
 	*(inbox + INIT_HCA_FLAGS2_OFFSET / 4) &= ~cpu_to_be32(1 << 1);
