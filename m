From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:19:57 +0000
Subject: [PATCH 08/10] firewire-net: Rename a jump label in fwnet_finish_incoming_packet()
Message-Id: <ebee0527-c16c-1fda-0724-1204b768e44f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
In-Reply-To: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 22:40:05 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 7e802e7..6dd3174 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -495,7 +495,7 @@ static int fwnet_finish_incoming_packet(struct net_device *net,
 #endif
 		break;
 	default:
-		goto err;
+		goto increment_counter;
 	}
 
 	dev = netdev_priv(net);
@@ -551,8 +551,7 @@ static int fwnet_finish_incoming_packet(struct net_device *net,
 	}
 
 	return 0;
-
- err:
+ increment_counter:
 	net->stats.rx_errors++;
 	net->stats.rx_dropped++;
 
-- 
2.10.0

