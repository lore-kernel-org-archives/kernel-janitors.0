From: trem <tremyfr@yahoo.fr>
Date: Sun, 21 Jan 2007 21:45:23 +0000
Subject: [KJ] [PATCH] replace pci_module_init by pci_register_driver in
Message-Id: <45B3DEF3.4030305@yahoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45B3DE44.5020608@yahoo.fr>
In-Reply-To: <45B3DE44.5020608@yahoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

change pci_module_init by pci_register_driver

Signed-Off-By: trem <tremyfr@yahoo.fr>
---

diff --git a/drivers/net/netxen/netxen_nic_main.c
b/drivers/net/netxen/netxen_nic_main.c
index 8a5792f..96e1bee 100644
--- a/drivers/net/netxen/netxen_nic_main.c
+++ b/drivers/net/netxen/netxen_nic_main.c
@@ -1144,7 +1144,7 @@ static int __init netxen_init_module(void)
        if ((netxen_workq = create_singlethread_workqueue("netxen")) = 0)
                return -ENOMEM;
 
-       return pci_module_init(&netxen_driver);
+       return pci_register_driver(&netxen_driver);
 }
 
 module_init(netxen_init_module);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
