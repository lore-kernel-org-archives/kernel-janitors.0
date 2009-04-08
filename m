From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:22:25 +0000
Subject: [PATCH 53/56] usb: Remove void casts
Message-Id: <1239189748-11703-54-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-38-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-39-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-40-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-41-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-42-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-43-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-44-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-45-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-46-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-47-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-48-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 drivers/usb/host/ehci-dbg.c |    2 +-
 drivers/usb/host/ehci-mem.c |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 7f4ace7..abfc31f 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -832,7 +832,7 @@ static int fill_buffer(struct debug_buffer *buf)
 	int ret = 0;
 
 	if (!buf->output_buf)
-		buf->output_buf = (char *)vmalloc(buf->alloc_size);
+		buf->output_buf = vmalloc(buf->alloc_size);
 
 	if (!buf->output_buf) {
 		ret = -ENOMEM;
diff --git a/drivers/usb/host/ehci-mem.c b/drivers/usb/host/ehci-mem.c
index 10d5291..c128491 100644
--- a/drivers/usb/host/ehci-mem.c
+++ b/drivers/usb/host/ehci-mem.c
@@ -83,8 +83,7 @@ static struct ehci_qh *ehci_qh_alloc (struct ehci_hcd *ehci, gfp_t flags)
 	struct ehci_qh		*qh;
 	dma_addr_t		dma;
 
-	qh = (struct ehci_qh *)
-		dma_pool_alloc (ehci->qh_pool, flags, &dma);
+	qh = dma_pool_alloc (ehci->qh_pool, flags, &dma);
 	if (!qh)
 		return qh;
 
@@ -212,8 +211,7 @@ static int ehci_mem_init (struct ehci_hcd *ehci, gfp_t flags)
 	}
 
 	/* Hardware periodic table */
-	ehci->periodic = (__le32 *)
-		dma_alloc_coherent (ehci_to_hcd(ehci)->self.controller,
+	ehci->periodic = dma_alloc_coherent (ehci_to_hcd(ehci)->self.controller,
 			ehci->periodic_size * sizeof(__le32),
 			&ehci->periodic_dma, 0);
 	if (ehci->periodic = NULL) {
-- 
1.5.4.3

