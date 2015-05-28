From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:21 +0000
Subject: [PATCH 6/9] ssb: drop unneeded goto
Message-Id: <1432846944-7122-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Buesch <m@bues.ch>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete jump to a label on the next line, when that label is not
used elsewhere.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier l;
@@

-if (...) goto l;
-l:
// </smpl>

Also drop the unneeded err variable.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/ssb/pci.c |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/ssb/pci.c b/drivers/ssb/pci.c
index 0f28c08..d6ca4d3 100644
--- a/drivers/ssb/pci.c
+++ b/drivers/ssb/pci.c
@@ -1173,17 +1173,11 @@ void ssb_pci_exit(struct ssb_bus *bus)
 int ssb_pci_init(struct ssb_bus *bus)
 {
 	struct pci_dev *pdev;
-	int err;
 
 	if (bus->bustype != SSB_BUSTYPE_PCI)
 		return 0;
 
 	pdev = bus->host_pci;
 	mutex_init(&bus->sprom_mutex);
-	err = device_create_file(&pdev->dev, &dev_attr_ssb_sprom);
-	if (err)
-		goto out;
-
-out:
-	return err;
+	return device_create_file(&pdev->dev, &dev_attr_ssb_sprom);
 }

