From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:53:58 +0000
Subject: [patch] zfcp: spin_lock_irqsave() is not nestable
Message-Id: <20161013085358.GH16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Maier <maier@linux.vnet.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally overwrite the original saved value of "flags" so that
we can't re-enable IRQs at the end of the function.  Presumably this
function is mostly called with IRQs disabled or it would be obvious in
testing.

Fixes: aceeffbb59bb ("zfcp: trace full payload of all SAN records (req,resp,iels)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/s390/scsi/zfcp_dbf.c b/drivers/s390/scsi/zfcp_dbf.c
index 637cf89..5810019 100644
--- a/drivers/s390/scsi/zfcp_dbf.c
+++ b/drivers/s390/scsi/zfcp_dbf.c
@@ -384,7 +384,7 @@ void zfcp_dbf_san(char *tag, struct zfcp_dbf *dbf,
 	/* if (len > rec_len):
 	 * dump data up to cap_len ignoring small duplicate in rec->payload
 	 */
-	spin_lock_irqsave(&dbf->pay_lock, flags);
+	spin_lock(&dbf->pay_lock);
 	memset(payload, 0, sizeof(*payload));
 	memcpy(payload->area, paytag, ZFCP_DBF_TAG_LEN);
 	payload->fsf_req_id = req_id;
