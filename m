From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 16 Mar 2017 15:19:53 +0000
Subject: [PATCH 1/3] w1: Use kernel common min() implementation
Message-Id: <20170316151955.10710-2-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316151955.10710-1-afd@ti.com>
In-Reply-To: <20170316151955.10710-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/w1/w1_netlink.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/w1/w1_netlink.c b/drivers/w1/w1_netlink.c
index 49e520ca79c5..18374cad3ace 100644
--- a/drivers/w1/w1_netlink.c
+++ b/drivers/w1/w1_netlink.c
@@ -23,8 +23,6 @@
 
 #if defined(CONFIG_W1_CON) && (defined(CONFIG_CONNECTOR) || (defined(CONFIG_CONNECTOR_MODULE) && defined(CONFIG_W1_MODULE)))
 
-#define MIN(a, b)                   (((a) < (b)) ? (a) : (b))
-
 /* Bundle together everything required to process a request in one memory
  * allocation.
  */
@@ -598,7 +596,7 @@ static void w1_cn_callback(struct cn_msg *cn, struct netlink_skb_parms *nsp)
 				sizeof(struct w1_netlink_msg) +
 				sizeof(struct w1_netlink_cmd));
 		}
-		reply_size = MIN(CONNECTOR_MAX_MSG_SIZE, reply_size);
+		reply_size = min(CONNECTOR_MAX_MSG_SIZE, reply_size);
 
 		/* allocate space for the block, a copy of the original message,
 		 * one node per cmd to point into the original message,
-- 
2.11.0

