From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 12:20:47 +0000
Subject: [PATCH 3/3] char/pcmcia: Adjust a null pointer check in three functions
Message-Id: <1403a78d-8fb9-9487-d71d-e51517671153@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
In-Reply-To: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "David S. Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 13:46:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/pcmcia/synclink_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 6c210b5cdf69..1719d929c0e4 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -2644,7 +2644,7 @@ static int rx_alloc_buffers(MGSLPC_INFO *info)
 	info->rx_buf_count = info->rx_buf_total_size / info->rx_buf_size;
 
 	info->rx_buf = kmalloc(info->rx_buf_total_size, GFP_KERNEL);
-	if (info->rx_buf = NULL)
+	if (!info->rx_buf)
 		return -ENOMEM;
 
 	/* unused flag buffer to satisfy receive_buf calling interface */
@@ -4228,7 +4228,7 @@ static void hdlcdev_rx(MGSLPC_INFO *info, char *buf, int size)
 	if (debug_level >= DEBUG_LEVEL_INFO)
 		printk("hdlcdev_rx(%s)\n", dev->name);
 
-	if (skb = NULL) {
+	if (!skb) {
 		printk(KERN_NOTICE "%s: can't alloc skb, dropping packet\n", dev->name);
 		dev->stats.rx_dropped++;
 		return;
@@ -4269,7 +4269,7 @@ static int hdlcdev_init(MGSLPC_INFO *info)
 	/* allocate and initialize network and HDLC layer objects */
 
 	dev = alloc_hdlcdev(info);
-	if (dev = NULL) {
+	if (!dev) {
 		printk(KERN_ERR "%s:hdlc device allocation failure\n", __FILE__);
 		return -ENOMEM;
 	}
-- 
2.14.2

