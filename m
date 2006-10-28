From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 28 Oct 2006 18:46:34 +0000
Subject: [KJ] Fwd: [PATCH] acpiphp: fix use of list_for_each macro
Message-Id: <20061028184634.GB4901@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

----- Forwarded message from Akinobu Mita <akinobu.mita@gmail.com> -----

From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>,
	Kristen Carlson Accardi <kristen.c.accardi@intel.com>
Subject: [PATCH] acpiphp: fix use of list_for_each macro

This patch fixes invalid usage of list_for_each()

list_for_each (node, &bridge_list) {
	bridge = (struct acpiphp_bridge *)node;
	...
}

This code works while the member of list node is located at the
head of struct acpiphp_bridge.

Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Kristen Carlson Accardi <kristen.c.accardi@intel.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>

 drivers/pci/hotplug/acpiphp_glue.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

Index: work-fault-inject/drivers/pci/hotplug/acpiphp_glue.c
=================================--- work-fault-inject.orig/drivers/pci/hotplug/acpiphp_glue.c
+++ work-fault-inject/drivers/pci/hotplug/acpiphp_glue.c
@@ -1693,14 +1693,10 @@ void __exit acpiphp_glue_exit(void)
  */
 int __init acpiphp_get_num_slots(void)
 {
-	struct list_head *node;
 	struct acpiphp_bridge *bridge;
-	int num_slots;
-
-	num_slots = 0;
+	int num_slots = 0;
 
-	list_for_each (node, &bridge_list) {
-		bridge = (struct acpiphp_bridge *)node;
+	list_for_each_entry (bridge, &bridge_list, list) {
 		dbg("Bus %04x:%02x has %d slot%s\n",
 				pci_domain_nr(bridge->pci_bus),
 				bridge->pci_bus->number, bridge->nr_slots,
-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

----- End forwarded message -----

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
