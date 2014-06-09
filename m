From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:19:41 +0000
Subject: [patch] crypto: caam - remove duplicate FIFOST_CONT_MASK define
Message-Id: <20140609151941.GN9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Porosanu <alexandru.porosanu@freescale.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The FIFOST_CONT_MASK define is cut and pasted twice so we can delete the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/caam/desc.h b/drivers/crypto/caam/desc.h
index 7e4500f..d397ff9 100644
--- a/drivers/crypto/caam/desc.h
+++ b/drivers/crypto/caam/desc.h
@@ -321,7 +321,6 @@ struct sec4_sg_entry {
 /* Continue - Not the last FIFO store to come */
 #define FIFOST_CONT_SHIFT	23
 #define FIFOST_CONT_MASK	(1 << FIFOST_CONT_SHIFT)
-#define FIFOST_CONT_MASK	(1 << FIFOST_CONT_SHIFT)
 
 /*
  * Extended Length - use 32-bit extended length that
