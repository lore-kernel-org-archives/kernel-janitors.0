From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Apr 2018 08:52:22 +0000
Subject: [PATCH v2] scsi: cxgb4i: silence overflow warning in t4_uld_rx_handler()
Message-Id: <20180403085222.GA19927@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch marks skb->data as untrusted so it complains that there is a
potential overflow here:

	drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2111 t4_uld_rx_handler()
	error: buffer overflow 'cxgb4i_cplhandlers' 239 <= 255.

In this case, skb->data comes from the hardware or firmware so it's not
going to overflow unless there is a firmware bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: rebase, and re-write commit message

diff --git a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
index 406e94312d4e..beb146b7c17c 100644
--- a/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
+++ b/drivers/scsi/cxgbi/cxgb4i/cxgb4i.c
@@ -2108,11 +2108,11 @@ static int t4_uld_rx_handler(void *handle, const __be64 *rsp,
 	log_debug(1 << CXGBI_DBG_TOE,
 		"cdev %p, opcode 0x%x(0x%x,0x%x), skb %p.\n",
 		 cdev, opc, rpl->ot.opcode_tid, ntohl(rpl->ot.opcode_tid), skb);
-	if (cxgb4i_cplhandlers[opc])
-		cxgb4i_cplhandlers[opc](cdev, skb);
-	else {
+	if (opc >= ARRAY_SIZE(cxgb4i_cplhandlers) || !cxgb4i_cplhandlers[opc]) {
 		pr_err("No handler for opcode 0x%x.\n", opc);
 		__kfree_skb(skb);
+	} else {
+		cxgb4i_cplhandlers[opc](cdev, skb);
 	}
 	return 0;
 nomem:
