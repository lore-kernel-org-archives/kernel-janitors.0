From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jan 2021 05:25:59 +0000
Subject: [PATCH] crypto: octeontx2 - fix signedness bug in cptvf_register_interrupts()
Message-Id: <YBD5Z11GeYlJGuTh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: Arnaud Ebalard <arno@natisbad.org>, Srujana Challa <schalla@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Suheil Chandran <schandran@marvell.com>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The "num_vec" has to be signed for the error handling to work.

Fixes: 19d8e8c7be15 ("crypto: octeontx2 - add virtual function driver support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
index 9663be38ee40..47f378731024 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
@@ -34,7 +34,7 @@ static void cptvf_disable_pfvf_mbox_intrs(struct otx2_cptvf_dev *cptvf)
 static int cptvf_register_interrupts(struct otx2_cptvf_dev *cptvf)
 {
 	int ret, irq;
-	u32 num_vec;
+	int num_vec;
 
 	num_vec = pci_msix_vec_count(cptvf->pdev);
 	if (num_vec <= 0)
-- 
2.29.2
