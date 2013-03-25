From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 25 Mar 2013 15:48:21 +0000
Subject: [PATCH] block: remove unused variable
Message-Id: <1364226501-28745-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: josh.h.morris@us.ibm.com, pjk1939@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The struct rsxx_dma pointer tmp is not used, we can remove it.
Introduced by: c95246c3a2ac
("Adding in EEH support to the IBM FlashSystem 70/80 device driver")

Sparse gives a warning:
drivers/block/rsxx/dma.c:1050:19: warning:
	unused variable ‘tmp’ [-Wunused-variable]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/block/rsxx/dma.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/rsxx/dma.c b/drivers/block/rsxx/dma.c
index d523e9c..bacbaa0 100644
--- a/drivers/block/rsxx/dma.c
+++ b/drivers/block/rsxx/dma.c
@@ -1047,7 +1047,6 @@ void rsxx_eeh_cancel_dmas(struct rsxx_cardinfo *card)
 int rsxx_eeh_remap_dmas(struct rsxx_cardinfo *card)
 {
 	struct rsxx_dma *dma;
-	struct rsxx_dma *tmp;
 	int i;
 
 	for (i = 0; i < card->n_targets; i++) {
-- 
1.7.10.4

