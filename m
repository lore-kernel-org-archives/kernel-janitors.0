From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:14:28 +0000
Subject: [PATCH 11] drivers/pci/hotplug/cpqphp_ctrl.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311914.29201.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, greg@kroah.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/pci/hotplug/cpqphp_ctrl.c | 79698 -> 79638 (-60 bytes)
 drivers/pci/hotplug/cpqphp_ctrl.o | 192896 -> 192736 (-160 bytes)

 drivers/pci/hotplug/cpqphp_ctrl.c |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/pci/hotplug/cpqphp_ctrl.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/pci/hotplug/cpqphp_ctrl.c	2007-07-31 13:56:47.000000000 +0200
@@ -973,16 +973,13 @@ struct pci_func *cpqhp_slot_create(u8 bu
 	struct pci_func *new_slot;
 	struct pci_func *next;

-	new_slot = kmalloc(sizeof(*new_slot), GFP_KERNEL);
-
-	if (new_slot = NULL) {
+	new_slot = kzalloc(sizeof(*new_slot), GFP_KERNEL);
+	if (!new_slot) {
 		/* I'm not dead yet!
 		 * You will be. */
-		return new_slot;
+		return NULL;
 	}

-	memset(new_slot, 0, sizeof(struct pci_func));
-
 	new_slot->next = NULL;
 	new_slot->configured = 1;

