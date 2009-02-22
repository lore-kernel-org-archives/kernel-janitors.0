From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:04:33 +0000
Subject: [PATCH 09/16] usb host: fix sparse warning: Using plain integer as
Message-Id: <20090222000257.17557.27546.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  drivers/usb/host/oxu210hp-hcd.c:2687:42: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/usb/host/oxu210hp-hcd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-hcd.c
index 2947c69..5ac489e 100644
--- a/drivers/usb/host/oxu210hp-hcd.c
+++ b/drivers/usb/host/oxu210hp-hcd.c
@@ -2684,7 +2684,7 @@ static int oxu_reset(struct usb_hcd *hcd)
 	oxu->urb_len = 0;
 
 	/* FIMXE */
-	hcd->self.controller->dma_mask = 0UL;
+	hcd->self.controller->dma_mask = NULL;
 
 	if (oxu->is_otg) {
 		oxu->caps = hcd->regs + OXU_OTG_CAP_OFFSET;

