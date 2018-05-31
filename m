From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 06:21:48 +0000
Subject: [PATCH] PCI: endpoint: use after free in pci_epf_unregister_driver()
Message-Id: <20180531062148.qnhcnnibz2ql6soa@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to use list_for_each_entry_safe() because the
pci_ep_cfs_remove_epf_group() function frees "group".

Fixes: ef1433f717a2 ("PCI: endpoint: Create configfs entry for each pci_epf_device_id table entry")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index 523a8cab3bfb..bf53fad636a5 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -145,10 +145,10 @@ EXPORT_SYMBOL_GPL(pci_epf_alloc_space);
  */
 void pci_epf_unregister_driver(struct pci_epf_driver *driver)
 {
-	struct config_group *group;
+	struct config_group *group, *tmp;
 
 	mutex_lock(&pci_epf_mutex);
-	list_for_each_entry(group, &driver->epf_group, group_entry)
+	list_for_each_entry_safe(group, tmp, &driver->epf_group, group_entry)
 		pci_ep_cfs_remove_epf_group(group);
 	list_del(&driver->epf_group);
 	mutex_unlock(&pci_epf_mutex);
