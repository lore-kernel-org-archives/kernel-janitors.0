From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Apr 2020 23:10:12 +0000
Subject: [PATCH][next] crypto: marvell: fix double free of ptr
Message-Id: <20200401231012.407946-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Srujana Challa <schalla@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently in the case where eq->src != req->ds, the allocation of
ptr is kfree'd at the end of the code block. However later on in
the case where enc is not null any of the error return paths that
return via the error handling return path end up performing an
erroneous second kfree of ptr.

Fix this by adding an error exit label error_free and only jump to
this when ptr needs kfree'ing thus avoiding the double free issue.

Addresses-Coverity: ("Double free")
Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
index 946fb62949b2..06202bcffb33 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
@@ -1161,13 +1161,13 @@ static inline u32 create_aead_null_output_list(struct aead_request *req,
 					   inputlen);
 		if (status != inputlen) {
 			status = -EINVAL;
-			goto error;
+			goto error_free;
 		}
 		status = sg_copy_from_buffer(req->dst, sg_nents(req->dst), ptr,
 					     inputlen);
 		if (status != inputlen) {
 			status = -EINVAL;
-			goto error;
+			goto error_free;
 		}
 		kfree(ptr);
 	}
@@ -1209,8 +1209,10 @@ static inline u32 create_aead_null_output_list(struct aead_request *req,
 
 	req_info->outcnt = argcnt;
 	return 0;
-error:
+
+error_free:
 	kfree(ptr);
+error:
 	return status;
 }
 
-- 
2.25.1
