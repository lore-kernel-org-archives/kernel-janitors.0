From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 04 Dec 2012 20:41:07 +0000
Subject: [PATCH] staging: csr: remove unneeded call to memset().
Message-Id: <1354653667-28927-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, devendra.aaru@gmail.com, marcos.souza.org@gmail.com, andriy.shevchenko@linux.intel.com, devel@driverdev.osuosl.org, Cyril Roelandt <tipecaml@gmail.com>

In uf_send_pkt_to_encrypt(), the memory area zeroed by this call to memset() is
overwritten by a call to memcpy() a few instructions later, so it is not needed.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/csr/unifi_sme.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/csr/unifi_sme.c b/drivers/staging/csr/unifi_sme.c
index 7c6c413..7669037 100644
--- a/drivers/staging/csr/unifi_sme.c
+++ b/drivers/staging/csr/unifi_sme.c
@@ -1196,7 +1196,6 @@ void uf_send_pkt_to_encrypt(struct work_struct *work)
 
         if (pktBulkDataLength > 0) {
 		    pktBulkData = kmalloc(pktBulkDataLength, GFP_KERNEL);
-		    memset(pktBulkData, 0, pktBulkDataLength);
 	    } else {
 		    unifi_error(priv, "uf_send_pkt_to_encrypt() : invalid buffer\n");
 		    return;
-- 
1.7.10.4

