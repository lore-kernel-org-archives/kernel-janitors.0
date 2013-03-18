From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Mar 2013 20:25:26 +0000
Subject: [patch v2] IB/ipath: silence a static checker warning
Message-Id: <20130318202526.GA11268@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <32E1700B9017364D9B60AED9960492BC0D5C9939@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC0D5C9939-AtyAts71sc88Ug9VwtkbtrfspsVTdybXVpNB7YpNyf8@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

I have a static checker which complains that 0x255 is too high for
the "dev->opstats[opcode]" array.  It turns out that the hardware
has already validated the opcode at this point so it can't actually
overflow.

However, silencing the warning is good and this matches how the
opcode is treated in qib_ib_rcv() as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: new changelog.  Just mask the value instead of adding an if
statement.

diff --git a/drivers/infiniband/hw/ipath/ipath_verbs.c b/drivers/infiniband/hw/ipath/ipath_verbs.c
index 439c35d..ea93870 100644
--- a/drivers/infiniband/hw/ipath/ipath_verbs.c
+++ b/drivers/infiniband/hw/ipath/ipath_verbs.c
@@ -620,7 +620,7 @@ void ipath_ib_rcv(struct ipath_ibdev *dev, void *rhdr, void *data,
 		goto bail;
 	}
 
-	opcode = be32_to_cpu(ohdr->bth[0]) >> 24;
+	opcode = (be32_to_cpu(ohdr->bth[0]) >> 24) & 0x7f;
 	dev->opstats[opcode].n_bytes += tlen;
 	dev->opstats[opcode].n_packets++;
 
