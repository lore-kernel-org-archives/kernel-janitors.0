From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 04 Aug 2017 14:46:51 +0000
Subject: [PATCH] powerpc/eeh: Delete an error message for a failed memory allocation in two functions
Message-Id: <0a35cb55-9f6b-21ca-565f-cab26237c962@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Russell Currey <ruscur@russell.cc>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 4 Aug 2017 16:37:56 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/eeh_dev.c   | 5 +----
 arch/powerpc/kernel/eeh_event.c | 5 ++---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_dev.c b/arch/powerpc/kernel/eeh_dev.c
index d6b2ca70d14d..2742ecbadf18 100644
--- a/arch/powerpc/kernel/eeh_dev.c
+++ b/arch/powerpc/kernel/eeh_dev.c
@@ -55,11 +55,8 @@ struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
 
 	/* Allocate EEH device */
 	edev = kzalloc(sizeof(*edev), GFP_KERNEL);
-	if (!edev) {
-		pr_warn("%s: out of memory\n",
-			__func__);
+	if (!edev)
 		return NULL;
-	}
 
 	/* Associate EEH device with OF node */
 	pdn->edev = edev;
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index accbf8b5fd46..c62bd90e038f 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -132,10 +132,9 @@ int eeh_send_failure_event(struct eeh_pe *pe)
 	struct eeh_event *event;
 
 	event = kzalloc(sizeof(*event), GFP_ATOMIC);
-	if (!event) {
-		pr_err("EEH: out of memory, event not handled\n");
+	if (!event)
 		return -ENOMEM;
-	}
+
 	event->pe = pe;
 
 	/* We may or may not be called in an interrupt context */
-- 
2.13.4

