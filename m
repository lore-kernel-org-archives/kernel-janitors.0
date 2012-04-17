From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 06:28:47 +0000
Subject: [patch] wlcore: fixup an allocation
Message-Id: <20120417062847.GA26756@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <coelho@ti.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Eliad Peller <eliad@wizery.com>, Arik Nemtsov <arik@wizery.com>, Shahar Levi <shahar_levi@ti.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

GFP_DMA isn't supposed to be used by itself.  This allocation is allowed
to sleep so it should be ORing it with GFP_KERNEL.
Also we should check for allocations errors.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have the hardware to test this.  Sorry.

diff --git a/drivers/net/wireless/ti/wlcore/cmd.c b/drivers/net/wireless/ti/wlcore/cmd.c
index 5c4716c..7ea10e1 100644
--- a/drivers/net/wireless/ti/wlcore/cmd.c
+++ b/drivers/net/wireless/ti/wlcore/cmd.c
@@ -123,7 +123,9 @@ static int wl1271_cmd_wait_for_event_or_timeout(struct wl1271 *wl, u32 mask)
 	unsigned long timeout;
 	int ret = 0;
 
-	events_vector = kmalloc(sizeof(*events_vector), GFP_DMA);
+	events_vector = kmalloc(sizeof(*events_vector), GFP_KERNEL | GFP_DMA);
+	if (!events_vector)
+		return -ENOMEM;
 
 	timeout = jiffies + msecs_to_jiffies(WL1271_EVENT_TIMEOUT);
 
