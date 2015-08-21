From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Aug 2015 08:47:45 +0000
Subject: [patch] crypto: qat - silence a static checker warning
Message-Id: <20150821084745.GB25369@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Allan, Bruce W" <bruce.w.allan@intel.com>, Ahsan Atta <ahsan.atta@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker assumes that if we are getting numbers as a string
using kstrotoint() then that means they come from outside the kernel and
are untrustworthy.

This may or may not be true in this case, but it seems harmless to add
a range check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/qat/qat_common/adf_transport.c b/drivers/crypto/qat/qat_common/adf_transport.c
index d5d8198..ec3abf9 100644
--- a/drivers/crypto/qat/qat_common/adf_transport.c
+++ b/drivers/crypto/qat/qat_common/adf_transport.c
@@ -264,6 +264,10 @@ int adf_create_ring(struct adf_accel_dev *accel_dev, const char *section,
 		dev_err(&GET_DEV(accel_dev), "Can't get ring number\n");
 		return -EFAULT;
 	}
+	if (ring_num >= ARRAY_SIZE(bank->rings)) {
+		dev_err(&GET_DEV(accel_dev), "Invalid ring number\n");
+		return -EFAULT;
+	}
 
 	bank = &transport_data->banks[bank_num];
 	if (adf_reserve_ring(bank, ring_num)) {
