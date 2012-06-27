From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 09:02:58 +0000
Subject: [patch -resend] mmc: ushc: fix an endianness conversion in ushc_request()
Message-Id: <20120627090258.GH31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Ball <cjb@laptop.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-mmc@vger.kernel.org, David Vrabel <david.vrabel@csr.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->cmd_idx field is 8 bits, not 16 so the call to cpu_to_le16()
will probably set cmd_idx to zero here on big endian systems.  My guess
is that this works because it has been tested on little endian systems
where the conversion to le16 is a nop.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have a way to test this.

I have added a sentence to the changelog.  I have added David Vrabel to
the CC list.  This was originally sent to the mailing list on Mon, 21
Nov 2011 and there was no response.

diff --git a/drivers/mmc/host/ushc.c b/drivers/mmc/host/ushc.c
index c0105a2..25932f5 100644
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
