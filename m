From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Oct 2011 07:28:57 +0000
Subject: [patch] RDMA/nes: silence compiler warning
Message-Id: <20111017072857.GB7812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

drivers/infiniband/hw/nes/nes_cm.c:3190:2: warning: format ‘%zu’
	expects argument of type ‘size_t’, but argument 11 has type
	‘int’ [-Wformat]

The warning says the type is "int" but actually it's unsigned short.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/nes/nes_cm.c b/drivers/infiniband/hw/nes/nes_cm.c
index 16667c7..b96ec43 100644
--- a/drivers/infiniband/hw/nes/nes_cm.c
+++ b/drivers/infiniband/hw/nes/nes_cm.c
@@ -3189,7 +3189,7 @@ int nes_accept(struct iw_cm_id *cm_id, struct iw_cm_conn_param *conn_param)
 
 	nes_debug(NES_DBG_CM, "QP%u, Destination IP = 0x%08X:0x%04X, local = "
 		  "0x%08X:0x%04X, rcv_nxt=0x%08X, snd_nxt=0x%08X, mpa + "
-		  "private data length=%zu.\n", nesqp->hwqp.qp_id,
+		  "private data length=%d.\n", nesqp->hwqp.qp_id,
 		  ntohl(cm_id->remote_addr.sin_addr.s_addr),
 		  ntohs(cm_id->remote_addr.sin_port),
 		  ntohl(cm_id->local_addr.sin_addr.s_addr),
