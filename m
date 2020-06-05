From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:03:39 +0000
Subject: [PATCH] crypto: marvell/octeontx - Fix a potential NULL dereference
Message-Id: <20200605110339.GE978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, SrujanaChalla <schalla@marvell.com>
Cc: Arnaud Ebalard <arno@natisbad.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch reports that:

    drivers/crypto/marvell/octeontx/otx_cptvf_algs.c:132 otx_cpt_aead_callback()
    warn: variable dereferenced before check 'cpt_info' (see line 121)

This function is called from process_pending_queue() as:

drivers/crypto/marvell/octeontx/otx_cptvf_reqmgr.c
   599                  /*
   600                   * Call callback after current pending entry has been
   601                   * processed, we don't do it if the callback pointer is
   602                   * invalid.
   603                   */
   604                  if (callback)
   605                          callback(res_code, areq, cpt_info);

It does appear to me that "cpt_info" can be NULL so this could lead to
a NULL dereference.

Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
index 60e744f680d34..1e0a1d70ebd39 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
@@ -118,6 +118,9 @@ static void otx_cpt_aead_callback(int status, void *arg1, void *arg2)
 	struct otx_cpt_req_info *cpt_req;
 	struct pci_dev *pdev;
 
+	if (!cpt_info)
+		goto complete;
+
 	cpt_req = cpt_info->req;
 	if (!status) {
 		/*
@@ -129,10 +132,10 @@ static void otx_cpt_aead_callback(int status, void *arg1, void *arg2)
 		    !cpt_req->is_enc)
 			status = validate_hmac_cipher_null(cpt_req);
 	}
-	if (cpt_info) {
-		pdev = cpt_info->pdev;
-		do_request_cleanup(pdev, cpt_info);
-	}
+	pdev = cpt_info->pdev;
+	do_request_cleanup(pdev, cpt_info);
+
+complete:
 	if (areq)
 		areq->complete(areq, status);
 }
-- 
2.26.2
