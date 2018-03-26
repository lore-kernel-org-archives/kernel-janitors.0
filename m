From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:43:09 +0000
Subject: [PATCH -next] powerpc: Fix error return code in ppc4xx_msi_probe()
Message-Id: <1522075389-23511-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Rob Herring <robh@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, Tyrel
 Datwyler <tyreld@linux.vnet.ibm.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/powerpc/platforms/4xx/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/4xx/msi.c b/arch/powerpc/platforms/4xx/msi.c
index 4b859c8..0b71c52 100644
--- a/arch/powerpc/platforms/4xx/msi.c
+++ b/arch/powerpc/platforms/4xx/msi.c
@@ -241,7 +241,8 @@ static int ppc4xx_msi_probe(struct platform_device *dev)
 	if (!msi_irqs)
 		return -ENODEV;
 
-	if (ppc4xx_setup_pcieh_hw(dev, res, msi))
+	err = ppc4xx_setup_pcieh_hw(dev, res, msi)
+	if (err)
 		goto error_out;
 
 	err = ppc4xx_msi_init_allocator(dev, msi);



