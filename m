From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Apr 2018 10:05:49 +0000
Subject: [PATCH] PCI: ibmphp: fix get_max_bus_speed()
Message-Id: <20180419100549.GA10672@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Matthew Wilcox <matthew@wil.cx>
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, Sinan Kaya <okaya@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

The "rc" variable is only initialized on the error path.  The caller
doesn't check the return but, if "rc" is non-zero, then this function is
basically a no-op.

Fixes: 3749c51ac6c1 ("PCI: Make current and maximum bus speeds part of the PCI core")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/hotplug/ibmphp_core.c b/drivers/pci/hotplug/ibmphp_core.c
index b81ca3fa0e84..1869b0411ce0 100644
--- a/drivers/pci/hotplug/ibmphp_core.c
+++ b/drivers/pci/hotplug/ibmphp_core.c
@@ -379,7 +379,7 @@ static int get_adapter_present(struct hotplug_slot *hotplug_slot, u8 *value)
 
 static int get_max_bus_speed(struct slot *slot)
 {
-	int rc;
+	int rc = 0;
 	u8 mode = 0;
 	enum pci_bus_speed speed;
 	struct pci_bus *bus = slot->hotplug_slot->pci_slot->bus;
