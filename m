From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 20 Nov 2011 21:06:05 +0000
Subject: [patch] mmc: ushc: fix an endianness conversion in ushc_request()
Message-Id: <20111120210605.GC7354@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Ball <cjb@laptop.org>
Cc: Jesper Juhl <jj@chaosbits.net>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->cmd_idx field is 8 bits, not 16 so the call to cpu_to_le16()
will probably set cmd_idx to zero here on big endian systems.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker bug.  Untested.

diff --git a/drivers/mmc/host/ushc.c b/drivers/mmc/host/ushc.c
index f08f944..8b7367a 100644
--- a/drivers/mmc/host/ushc.c
+++ b/drivers/mmc/host/ushc.c
@@ -278,7 +278,7 @@ static void ushc_request(struct mmc_host *mmc, struct mmc_request *req)
 	ushc->current_req = req;
 
 	/* Start cmd with CBW. */
-	ushc->cbw->cmd_idx = cpu_to_le16(req->cmd->opcode);
+	ushc->cbw->cmd_idx = req->cmd->opcode;
 	if (req->data)
 		ushc->cbw->block_size = cpu_to_le16(req->data->blksz);
 	else
