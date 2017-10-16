From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 12:18:07 +0000
Subject: [PATCH 1/3] char/pcmcia: Delete an error message for a failed memory allocation in mgslpc_probe()
Message-Id: <378e6889-d956-af80-7885-4bc8c6500d1f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
In-Reply-To: <5e693086-a995-81ad-4a3f-cf8ab2bac454@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Oct 2017 11:46:38 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/pcmcia/synclink_cs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 62be953e5fb0..4db7eda2e7f2 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -520,10 +520,8 @@ static int mgslpc_probe(struct pcmcia_device *link)
 		printk("mgslpc_attach\n");
 
 	info = kzalloc(sizeof(MGSLPC_INFO), GFP_KERNEL);
-	if (!info) {
-		printk("Error can't allocate device instance data\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	info->magic = MGSLPC_MAGIC;
 	tty_port_init(&info->port);
-- 
2.14.2

