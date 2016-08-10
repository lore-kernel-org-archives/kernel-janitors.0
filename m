From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 Aug 2016 15:45:01 +0000
Subject: [PATCH] IB/usnic: Fix error return code
Message-Id: <1470843901-16506-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: benve@cisco.com, dgoodell@cisco.com, dledford@redhat.com, sean.hefty@intel.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'pci_register_driver' fails, we return 'err' which is known to be 0.
Return the error instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/usnic/usnic_ib_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_ib_main.c b/drivers/infiniband/hw/usnic/usnic_ib_main.c
index c229b9f4a52d..0a89a955550b 100644
--- a/drivers/infiniband/hw/usnic/usnic_ib_main.c
+++ b/drivers/infiniband/hw/usnic/usnic_ib_main.c
@@ -664,7 +664,8 @@ static int __init usnic_ib_init(void)
 		return err;
 	}
 
-	if (pci_register_driver(&usnic_ib_pci_driver)) {
+	err = pci_register_driver(&usnic_ib_pci_driver);
+	if (err) {
 		usnic_err("Unable to register with PCI\n");
 		goto out_umem_fini;
 	}
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

