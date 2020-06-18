From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Jun 2020 10:12:29 +0000
Subject: [PATCH] crypto: ccp: remove redundant assignment to variable ret
Message-Id: <20200618101229.11772-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lendacky <thomas.lendacky@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never read
and it is being updated later with a new value.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/ccp/ccp-ops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/ccp/ccp-ops.c b/drivers/crypto/ccp/ccp-ops.c
index 422193690fd4..d270aa792888 100644
--- a/drivers/crypto/ccp/ccp-ops.c
+++ b/drivers/crypto/ccp/ccp-ops.c
@@ -1308,7 +1308,6 @@ ccp_run_des3_cmd(struct ccp_cmd_queue *cmd_q, struct ccp_cmd *cmd)
 			return -EINVAL;
 	}
 
-	ret = -EIO;
 	/* Zero out all the fields of the command desc */
 	memset(&op, 0, sizeof(op));
 
-- 
2.27.0.rc0
