From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 18 Apr 2018 13:57:22 +0000
Subject: [PATCH -next] m68k: fix return value check in mcf_pci_init()
Message-Id: <1524059842-22099-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: bf114d773167 ("m68k: force use of __raw_read/__raw_write address to be iomem")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/m68k/coldfire/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index 9d6342c..a7c2332 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -218,7 +218,7 @@ static int __init mcf_pci_init(void)
 
 	/* Keep a virtual mapping to IO/config space active */
 	iospace = ioremap(PCI_IO_PA, PCI_IO_SIZE);
-	if (IS_ERR(iospace))
+	if (!iospace)
 		return -ENODEV;
 	pr_info("Coldfire: PCI IO/config window mapped to 0x%p\n", iospace);

