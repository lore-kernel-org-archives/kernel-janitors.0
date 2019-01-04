From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Jan 2019 06:46:11 +0000
Subject: [PATCH] crypto: cavium/nitrox - Use after free in process_response_list()
Message-Id: <20190104064611.GA30627@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Nagadheeraj Rottela <rnagadheeraj@marvell.com>
Cc: "David S. Miller" <davem@davemloft.net>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Gadam Sreerama <sgadam@cavium.com>, "Nagadheeraj, Rottela" <Rottela.Nagadheeraj@cavium.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

We free "sr" and then dereference it on the next line.

Fixes: c9613335bf4f ("crypto: cavium/nitrox - Added AEAD cipher support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/cavium/nitrox/nitrox_reqmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
index e34e4df8fd24..fe070d75c842 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_reqmgr.c
@@ -567,10 +567,10 @@ static void process_response_list(struct nitrox_cmdq *cmdq)
 
 		/* ORH error code */
 		err = READ_ONCE(*sr->resp.orh) & 0xff;
-		softreq_destroy(sr);
 
 		if (sr->callback)
 			sr->callback(sr->cb_arg, err);
+		softreq_destroy(sr);
 
 		req_completed++;
 	}
-- 
2.17.1
