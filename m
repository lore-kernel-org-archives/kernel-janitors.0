From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 02 Sep 2016 14:47:53 +0000
Subject: [PATCH v2 2/2] crypto: qat - fix resource release omissions
Message-Id: <20160902144753.31334-3-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160902144753.31334-1-lambert.quentin@gmail.com>
In-Reply-To: <20160902144753.31334-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Salvatore Benedetto <salvatore.benedetto@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>

In certain cases qat_uclo_parse_uof_obj used to return with an error code
before releasing all resources. This patch add a jump to the appropriate label
ensuring that the resources are properly released before returning.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/crypto/qat/qat_common/qat_uclo.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/crypto/qat/qat_common/qat_uclo.c
+++ b/drivers/crypto/qat/qat_common/qat_uclo.c
@@ -981,7 +981,8 @@ static int qat_uclo_parse_uof_obj(struct
 			(PID_MINOR_REV & handle->hal_handle->revision_id);
 	if (qat_uclo_check_uof_compat(obj_handle)) {
 		pr_err("QAT: UOF incompatible\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_err;
 	}
 	obj_handle->ustore_phy_size = ICP_QAT_UCLO_MAX_USTORE;
 	if (!obj_handle->obj_hdr->file_buff ||
