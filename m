From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2019 13:48:39 +0000
Subject: [PATCH] crypto: qat - Endian bug in interrupt handler
Message-Id: <20190624134839.GB1754@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The "vf_mask" as a u32 but we were casting it to unsigned long when we
do the for_each_set_bit() loop.  The problem is that is an out of bounds
read on big endian 64 bit systems.

Fixes: ed8ccaef52fa ("crypto: qat - Add support for SRIOV")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.  I don't know if 64bit big endian support matters...

 drivers/crypto/qat/qat_common/adf_isr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qat/qat_common/adf_isr.c b/drivers/crypto/qat/qat_common/adf_isr.c
index cd1cdf5305bc..50661f0a6ed4 100644
--- a/drivers/crypto/qat/qat_common/adf_isr.c
+++ b/drivers/crypto/qat/qat_common/adf_isr.c
@@ -111,7 +111,7 @@ static irqreturn_t adf_msix_isr_ae(int irq, void *dev_ptr)
 		struct adf_bar *pmisc  			&GET_BARS(accel_dev)[hw_data->get_misc_bar_id(hw_data)];
 		void __iomem *pmisc_bar_addr = pmisc->virt_addr;
-		u32 vf_mask;
+		unsigned long vf_mask;
 
 		/* Get the interrupt sources triggered by VFs */
 		vf_mask = ((ADF_CSR_RD(pmisc_bar_addr, ADF_ERRSOU5) &
@@ -132,8 +132,7 @@ static irqreturn_t adf_msix_isr_ae(int irq, void *dev_ptr)
 			 * unless the VF is malicious and is attempting to
 			 * flood the host OS with VF2PF interrupts.
 			 */
-			for_each_set_bit(i, (const unsigned long *)&vf_mask,
-					 (sizeof(vf_mask) * BITS_PER_BYTE)) {
+			for_each_set_bit(i, &vf_mask, 32) {
 				vf_info = accel_dev->pf.vf_info + i;
 
 				if (!__ratelimit(&vf_info->vf2pf_ratelimit)) {
-- 
2.20.1
