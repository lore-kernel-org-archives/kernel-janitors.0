From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 04 Oct 2006 09:34:37 +0000
Subject: [KJ] [PATCH] drivers/media/radio: No need to return void
Message-Id: <20061004093437.GA14055@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The module_exit function has return-type void and
pci_unregister_driver() returns void anyway.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 drivers/media/radio/radio-gemtek-pci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/radio/radio-gemtek-pci.c b/drivers/media/radio/radio-gemtek-pci.c
index cfab57d..d158526 100644
--- a/drivers/media/radio/radio-gemtek-pci.c
+++ b/drivers/media/radio/radio-gemtek-pci.c
@@ -449,7 +449,7 @@ static int __init gemtek_pci_init_module
 
 static void __exit gemtek_pci_cleanup_module( void )
 {
-	return pci_unregister_driver( &gemtek_pci_driver );
+	pci_unregister_driver(&gemtek_pci_driver);
 }
 
 MODULE_AUTHOR( "Vladimir Shebordaev <vshebordaev@mail.ru>" );
-- 
1.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
