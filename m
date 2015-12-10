From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Dec 2015 22:00:44 +0000
Subject: [patch -next] crypto: qat - uint8_t is not large enough for accel_id
Message-Id: <20151210220044.GA21797@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Bruce Allan <bruce.w.allan@intel.com>, Pingchao Yang <pingchao.yang@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

->accel_id has to be large enough to hold ADF_MAX_DEVICES + 1 (which is
1025) so uint8_t is too small.

Fixes: 890c55f4dc0e ('crypto: qat - add support for c3xxx accel type')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/qat/qat_common/adf_accel_devices.h b/drivers/crypto/qat/qat_common/adf_accel_devices.h
index 4d78ec0..1e1cdef 100644
--- a/drivers/crypto/qat/qat_common/adf_accel_devices.h
+++ b/drivers/crypto/qat/qat_common/adf_accel_devices.h
@@ -251,6 +251,6 @@ struct adf_accel_dev {
 		} vf;
 	};
 	bool is_vf;
-	uint8_t accel_id;
+	unsigned int accel_id;
 } __packed;
 #endif
