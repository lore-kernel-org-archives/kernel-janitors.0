From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 04 Oct 2006 09:35:23 +0000
Subject: [KJ] [PATCH] drivers/atm: No need to return void
Message-Id: <20061004093523.GA14108@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The module_exit function has return-type void and
pci_unregister_driver() returns void anyway.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 drivers/atm/ambassador.c |    4 ++--
 drivers/atm/horizon.c    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/atm/ambassador.c b/drivers/atm/ambassador.c
index 4521a24..9ccb9e3 100644
--- a/drivers/atm/ambassador.c
+++ b/drivers/atm/ambassador.c
@@ -2459,8 +2459,8 @@ static int __init amb_module_init (void)
 static void __exit amb_module_exit (void)
 {
   PRINTD (DBG_FLOW|DBG_INIT, "cleanup_module");
-  
-  return pci_unregister_driver(&amb_driver);
+
+  pci_unregister_driver(&amb_driver);
 }
 
 module_init(amb_module_init);
diff --git a/drivers/atm/horizon.c b/drivers/atm/horizon.c
index d1113e8..6a3bda9 100644
--- a/drivers/atm/horizon.c
+++ b/drivers/atm/horizon.c
@@ -2945,8 +2945,8 @@ static int __init hrz_module_init (void)
 
 static void __exit hrz_module_exit (void) {
   PRINTD (DBG_FLOW, "cleanup_module");
-  
-  return pci_unregister_driver(&hrz_driver);
+
+  pci_unregister_driver(&hrz_driver);
 }
 
 module_init(hrz_module_init);
-- 
1.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
