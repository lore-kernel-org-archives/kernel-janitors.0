From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:35:35 +0000
Subject: [PATCH 21/43] drivers/net/hamradio: fix sparse warning: symbol
Message-Id: <20090214213505.24377.11448.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Rename inner scrope variable.

Fix this sparse warning:
  drivers/net/hamradio/yam.c:856:35: warning: symbol 'dev' shadows an earlier one

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/hamradio/yam.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index a54b865..500a40b 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -854,10 +854,10 @@ static int yam_open(struct net_device *dev)
 
 	/* Reset overruns for all ports - FPGA programming makes overruns */
 	for (i = 0; i < NR_PORTS; i++) {
-		struct net_device *dev = yam_devs[i];
+		struct net_device *yam_dev = yam_devs[i];
 
-		inb(LSR(dev->base_addr));
-		dev->stats.rx_fifo_errors = 0;
+		inb(LSR(yam_dev->base_addr));
+		yam_dev->stats.rx_fifo_errors = 0;
 	}
 
 	printk(KERN_INFO "%s at iobase 0x%lx irq %u uart %s\n", dev->name, dev->base_addr, dev->irq,

