From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:20:45 +0000
Subject: [PATCH 3/20] PCI: fix misspelling of current function in string
Message-Id: <1417980062-25151-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

The function name begins with pci, not cpci.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/pci/hotplug/pci_hotplug_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pci_hotplug_core.c b/drivers/pci/hotplug/pci_hotplug_core.c
index 56d8486..d3f8330 100644
--- a/drivers/pci/hotplug/pci_hotplug_core.c
+++ b/drivers/pci/hotplug/pci_hotplug_core.c
@@ -532,7 +532,7 @@ static int __init pci_hotplug_init(void)
 
 	result = cpci_hotplug_init(debug);
 	if (result) {
-		err("cpci_hotplug_init with error %d\n", result);
+		err("%s with error %d\n", __func__, result);
 		return result;
 	}
 

