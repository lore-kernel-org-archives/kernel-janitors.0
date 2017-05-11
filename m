From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:18:12 +0000
Subject: [PATCH 3/4] vmbus: Fix a typo in a comment line
Message-Id: <f190c37a-4ea1-d9da-6f25-bd7728cc03e7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
In-Reply-To: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 17:43:55 +0200

Add a missing character in this description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hv/vmbus_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 96328aebae5a..ff94b111ed8d 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -991,7 +991,7 @@ static void vmbus_isr(void)
 		/*
 		 * Our host is win8 or above. The signaling mechanism
 		 * has changed and we can directly look at the event page.
-		 * If bit n is set then we have an interrup on the channel
+		 * If bit n is set then we have an interrupt on the channel
 		 * whose id is n.
 		 */
 		handled = true;
-- 
2.12.3

