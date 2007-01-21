From: trem <tremyfr@yahoo.fr>
Date: Sun, 21 Jan 2007 21:42:28 +0000
Subject: [KJ] [PATCH] replace pci_module_init by pci_register_driver in
Message-Id: <45B3DE44.5020608@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

change pci_module_init by pci_register_driver

Signed-Off-By: trem <tremyfr@yahoo.fr>
---

diff --git a/drivers/net/hp100.c b/drivers/net/hp100.c
index 844c136..7dc5185 100644
--- a/drivers/net/hp100.c
+++ b/drivers/net/hp100.c
@@ -3034,7 +3034,7 @@ static int __init hp100_module_init(void)
                goto out2;
 #endif
 #ifdef CONFIG_PCI
-       err = pci_module_init(&hp100_pci_driver);
+       err = pci_register_driver(&hp100_pci_driver);
        if (err && err != -ENODEV)
                goto out3;
 #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
