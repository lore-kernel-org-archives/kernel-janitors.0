From: trem <tremyfr@yahoo.fr>
Date: Sat, 20 Jan 2007 21:56:54 +0000
Subject: [KJ] [PATH] [RESEND] replace pci_module_init by pci_register_driver
Message-Id: <45B29026.3050405@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

change pci_module_init by pci_register_driver

Signed-Off-By: trem <tremyfr@yahoo.fr>
---

diff --git a/drivers/crypto/geode-aes.c b/drivers/crypto/geode-aes.c
index 43a6839..31ea405 100644
--- a/drivers/crypto/geode-aes.c
+++ b/drivers/crypto/geode-aes.c
@@ -457,7 +457,7 @@ static struct pci_driver geode_aes_driver = {
 static int __init
 geode_aes_init(void)
 {
-       return pci_module_init(&geode_aes_driver);
+       return pci_register_driver(&geode_aes_driver);
 }
 
 static void __exit



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
