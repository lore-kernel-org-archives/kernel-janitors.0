From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 11:55:10 +0000
Subject: [patch] llc: cleanup: remove dead code from llc_init()
Message-Id: <20100324115510.GC21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Cc: "David S. Miller" <davem@davemloft.net>, Octavian Purdila <opurdila@ixiacom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't need "dev" any more after:
	a5a04819c5740cb1aa217af2cc8f5ef26f33d744
	[LLC]: station source mac address

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/llc/llc_core.c b/net/llc/llc_core.c
index 78167e8..2bb0ddf 100644
--- a/net/llc/llc_core.c
+++ b/net/llc/llc_core.c
@@ -144,12 +144,6 @@ static struct packet_type llc_tr_packet_type __read_mostly = {
 
 static int __init llc_init(void)
 {
-	struct net_device *dev;
-
-	dev = first_net_device(&init_net);
-	if (dev != NULL)
-		dev = next_net_device(dev);
-
 	dev_add_pack(&llc_packet_type);
 	dev_add_pack(&llc_tr_packet_type);
 	return 0;
