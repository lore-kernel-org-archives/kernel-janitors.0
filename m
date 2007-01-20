From: trem <tremyfr@yahoo.fr>
Date: Sat, 20 Jan 2007 20:40:56 +0000
Subject: [KJ] [PATH] replace pci_module_init by pci_register_driver in
Message-Id: <45B27E58.1010507@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070500030608060906060204"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070500030608060906060204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply change pci_module_init by pci_register_driver.

Signed-Off-By: trem <tremyfr@yahoo.fr>


--------------070500030608060906060204
Content-Type: text/x-patch;
	name*0="geode-aes_replace_pci_module_init_by_pci_register_driver.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="geode-aes_replace_pci_module_init_by_pci_register_driver.pat";
	filename*1="ch"

diff --git a/drivers/crypto/geode-aes.c b/drivers/crypto/geode-aes.c
index 43a6839..31ea405 100644
--- a/drivers/crypto/geode-aes.c
+++ b/drivers/crypto/geode-aes.c
@@ -457,7 +457,7 @@ static struct pci_driver geode_aes_driver = {
 static int __init
 geode_aes_init(void)
 {
-	return pci_module_init(&geode_aes_driver);
+	return pci_register_driver(&geode_aes_driver);
 }
 
 static void __exit

--------------070500030608060906060204
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070500030608060906060204--
