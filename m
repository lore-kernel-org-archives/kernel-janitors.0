From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:15:20 +0000
Subject: [PATCH 04/10] firewire-net: Rename jump labels in fwnet_probe()
Message-Id: <6dc834a3-531c-ea35-1c24-427fdca071fa@users.sourceforge.net>
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
Date: Sat, 17 Sep 2016 22:17:12 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index cedfade..2ca2d57 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1442,7 +1442,7 @@ static int fwnet_probe(struct fw_unit *unit,
 	dev = fwnet_dev_find(card);
 	if (dev) {
 		net = dev->netdev;
-		goto have_dev;
+		goto add_peer;
 	}
 
 	net = alloc_netdev(sizeof(*dev), "firewire%d", NET_NAME_UNKNOWN,
@@ -1469,7 +1469,7 @@ static int fwnet_probe(struct fw_unit *unit,
 
 	ret = fwnet_fifo_start(dev);
 	if (ret < 0)
-		goto out;
+		goto stop_fifo;
 	dev->local_fifo = dev->handler.offset;
 
 	/*
@@ -1492,17 +1492,17 @@ static int fwnet_probe(struct fw_unit *unit,
 
 	ret = register_netdev(net);
 	if (ret)
-		goto out;
+		goto stop_fifo;
 
 	list_add_tail(&dev->dev_link, &fwnet_device_list);
 	dev_notice(&net->dev, "IP over IEEE 1394 on card %s\n",
 		   dev_name(card->device));
- have_dev:
+ add_peer:
 	ret = fwnet_add_peer(dev, unit, device);
 	if (ret && allocated_netdev) {
 		unregister_netdev(net);
 		list_del(&dev->dev_link);
- out:
+ stop_fifo:
 		fwnet_fifo_stop(dev);
 		free_netdev(net);
 	}
-- 
2.10.0

