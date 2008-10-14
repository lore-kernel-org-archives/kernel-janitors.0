From: Julia Lawall <julia@diku.dk>
Date: Tue, 14 Oct 2008 15:59:50 +0000
Subject: [PATCH 1/2] drivers/pci/hotplug/cpqphp_ctrl.c: Convert && to ||
Message-Id: <Pine.LNX.4.64.0810141759300.20451@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kristen.c.accardi@intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The pattern !E && !E->fld is nonsensical.  The patch below updates this
according to the assumption that && should be ||.  But perhaps another
solution was intended.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@disable and_comm@
expression E;
identifier fld;
@@

- !E && !E->fld
+ !E || !E->fld
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/pci/hotplug/cpqphp_ctrl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -1139,7 +1139,7 @@ static u8 set_controller_speed(struct co
 	for(slot = ctrl->slot; slot; slot = slot->next) {
 		if (slot->device = (hp_slot + ctrl->slot_device_offset)) 
 			continue;
-		if (!slot->hotplug_slot && !slot->hotplug_slot->info) 
+		if (!slot->hotplug_slot || !slot->hotplug_slot->info) 
 			continue;
 		if (slot->hotplug_slot->info->adapter_status = 0) 
 			continue;
