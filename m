From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 06 May 2010 08:06:30 +0000
Subject: [PATCH] uwb: Use resource_size
Message-Id: <1273133190-6479-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/uwb/whc-rc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/uwb/whc-rc.c b/drivers/uwb/whc-rc.c
index 7349558..4074a23 100644
--- a/drivers/uwb/whc-rc.c
+++ b/drivers/uwb/whc-rc.c
@@ -222,7 +222,7 @@ int whcrc_setup_rc_umc(struct whcrc *whcrc)
 	struct umc_dev *umc_dev = whcrc->umc_dev;
 
 	whcrc->area = umc_dev->resource.start;
-	whcrc->rc_len = umc_dev->resource.end - umc_dev->resource.start + 1;
+	whcrc->rc_len = resource_size(&umc_dev->resource);
 	result = -EBUSY;
 	if (request_mem_region(whcrc->area, whcrc->rc_len, KBUILD_MODNAME) = NULL) {
 		dev_err(dev, "can't request URC region (%zu bytes @ 0x%lx): %d\n",
-- 
1.6.3.3

