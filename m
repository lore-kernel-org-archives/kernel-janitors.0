From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:16:30 +0000
Subject: [PATCH v2 10/15] NULL noise: drivers/usb/host/oxu210hp-hcd.c
Message-Id: <20090305191626.30062.4592.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>

Fix this sparse warning:
  drivers/usb/host/oxu210hp-hcd.c:2687:42: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

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

