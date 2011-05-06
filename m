From: matt mooney <mfm@muteddisk.com>
Date: Fri, 06 May 2011 10:47:48 +0000
Subject: [PATCH 08/16] staging: usbip: stub.h: coding style cleanup
Message-Id: <70fd590bd9756fe52331f7efbe5250310fa5cea7.1304676742.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1304676742.git.mfm@muteddisk.com>
In-Reply-To: <cover.1304676742.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove extraneous lines.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/stub.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/usbip/stub.h b/drivers/staging/usbip/stub.h
index 6004fcd..6d252b8 100644
--- a/drivers/staging/usbip/stub.h
+++ b/drivers/staging/usbip/stub.h
@@ -58,7 +58,6 @@ struct stub_device {
 	struct list_head unlink_tx;
 	struct list_head unlink_free;
 
-
 	wait_queue_head_t tx_waitq;
 };
 
@@ -89,7 +88,6 @@ struct bus_id_priv {
 
 extern struct kmem_cache *stub_priv_cache;
 
-
 /*-------------------------------------------------------------------------*/
 /* prototype declarations */
 
-- 
1.7.5.1

