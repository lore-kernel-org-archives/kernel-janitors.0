From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Jul 2012 16:43:07 +0000
Subject: [PATCH 5/6] drivers/pci/hotplug: ensure a consistent return value in error case
Message-Id: <1342284188-19176-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1342284188-19176-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1342284188-19176-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Typically, the return value desired for the failure of a function with an
integer return value is a negative integer.  In these cases, the return
value is sometimes a negative integer and sometimes 0, due to a subsequent
initialization of the return variable within the loop.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

//<smpl>
@r exists@
identifier ret;
position p;
constant C;
expression e1,e3,e4;
statement S;
@@

ret = -C
... when != ret = e3
    when any
if@p (...) S
... when any
if (\(ret != 0\|ret < 0\|ret > 0\) || ...) { ... return ...; }
... when != ret = e3
    when any
*if@p (...)
{
  ... when != ret = e4
  return ret;
}
//</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pci/hotplug/cpqphp_core.c    |   14 ++++++++++----
 drivers/pci/hotplug/pcihp_skeleton.c |   14 ++++++++++----
 drivers/pci/hotplug/shpchp_core.c    |   14 ++++++++++----
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
index 187a199..c8eaeb4 100644
--- a/drivers/pci/hotplug/cpqphp_core.c
+++ b/drivers/pci/hotplug/cpqphp_core.c
@@ -611,7 +611,7 @@ static int ctrl_slot_setup(struct controller *ctrl,
 	u32 tempdword;
 	char name[SLOT_NAME_SIZE];
 	void __iomem *slot_entry= NULL;
-	int result = -ENOMEM;
+	int result;
 
 	dbg("%s\n", __func__);
 
@@ -623,19 +623,25 @@ static int ctrl_slot_setup(struct controller *ctrl,
 
 	while (number_of_slots) {
 		slot = kzalloc(sizeof(*slot), GFP_KERNEL);
-		if (!slot)
+		if (!slot) {
+			result = -ENOMEM;
 			goto error;
+		}
 
 		slot->hotplug_slot = kzalloc(sizeof(*(slot->hotplug_slot)),
 						GFP_KERNEL);
-		if (!slot->hotplug_slot)
+		if (!slot->hotplug_slot) {
+			result = -ENOMEM;
 			goto error_slot;
+		}
 		hotplug_slot = slot->hotplug_slot;
 
 		hotplug_slot->info = kzalloc(sizeof(*(hotplug_slot->info)),
 							GFP_KERNEL);
-		if (!hotplug_slot->info)
+		if (!hotplug_slot->info) {
+			result = -ENOMEM;
 			goto error_hpslot;
+		}
 		hotplug_slot_info = hotplug_slot->info;
 
 		slot->ctrl = ctrl;
diff --git a/drivers/pci/hotplug/pcihp_skeleton.c b/drivers/pci/hotplug/pcihp_skeleton.c
index b20ceaa..1f00b93 100644
--- a/drivers/pci/hotplug/pcihp_skeleton.c
+++ b/drivers/pci/hotplug/pcihp_skeleton.c
@@ -252,7 +252,7 @@ static int __init init_slots(void)
 	struct slot *slot;
 	struct hotplug_slot *hotplug_slot;
 	struct hotplug_slot_info *info;
-	int retval = -ENOMEM;
+	int retval;
 	int i;
 
 	/*
@@ -261,17 +261,23 @@ static int __init init_slots(void)
 	 */
 	for (i = 0; i < num_slots; ++i) {
 		slot = kzalloc(sizeof(*slot), GFP_KERNEL);
-		if (!slot)
+		if (!slot) {
+			retval = -ENOMEM;
 			goto error;
+		}
 
 		hotplug_slot = kzalloc(sizeof(*hotplug_slot), GFP_KERNEL);
-		if (!hotplug_slot)
+		if (!hotplug_slot) {
+			retval = -ENOMEM;
 			goto error_slot;
+		}
 		slot->hotplug_slot = hotplug_slot;
 
 		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info)
+		if (!info) {
+			retval = -ENOMEM;
 			goto error_hpslot;
+		}
 		hotplug_slot->info = info;
 
 		slot->number = i;
diff --git a/drivers/pci/hotplug/shpchp_core.c b/drivers/pci/hotplug/shpchp_core.c
index 7414fd9..b6de307 100644
--- a/drivers/pci/hotplug/shpchp_core.c
+++ b/drivers/pci/hotplug/shpchp_core.c
@@ -99,22 +99,28 @@ static int init_slots(struct controller *ctrl)
 	struct hotplug_slot *hotplug_slot;
 	struct hotplug_slot_info *info;
 	char name[SLOT_NAME_SIZE];
-	int retval = -ENOMEM;
+	int retval;
 	int i;
 
 	for (i = 0; i < ctrl->num_slots; i++) {
 		slot = kzalloc(sizeof(*slot), GFP_KERNEL);
-		if (!slot)
+		if (!slot) {
+			retval = -ENOMEM;
 			goto error;
+		}
 
 		hotplug_slot = kzalloc(sizeof(*hotplug_slot), GFP_KERNEL);
-		if (!hotplug_slot)
+		if (!hotplug_slot) {
+			retval = -ENOMEM;
 			goto error_slot;
+		}
 		slot->hotplug_slot = hotplug_slot;
 
 		info = kzalloc(sizeof(*info), GFP_KERNEL);
-		if (!info)
+		if (!info) {
+			retval = -ENOMEM;
 			goto error_hpslot;
+		}
 		hotplug_slot->info = info;
 
 		slot->hp_slot = i;

