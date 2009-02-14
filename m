From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:12:10 +0000
Subject: [PATCH 02/43] drivers/net/e2100.c: fix sparse warning: symbol shadows
Message-Id: <20090214211203.23489.80420.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Remove redundant inner scope variable and while being at it
make use of ARRAY_SIZE instead of a hardcoded number.

Fix this sparse warning:
  drivers/net/e2100.c:219:56: warning: symbol 'i' shadows an earlier one
  drivers/net/e2100.c:181:13: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/e2100.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/e2100.c b/drivers/net/e2100.c
index b07ba19..d2f6ee1 100644
--- a/drivers/net/e2100.c
+++ b/drivers/net/e2100.c
@@ -216,13 +216,13 @@ static int __init e21_probe1(struct net_device *dev, int ioaddr)
 		printk(" %02X", station_addr[i]);
 
 	if (dev->irq < 2) {
-		int irqlist[] = {15,11,10,12,5,9,3,4}, i;
-		for (i = 0; i < 8; i++)
+		int irqlist[] = {15, 11, 10, 12, 5, 9, 3, 4};
+		for (i = 0; i < ARRAY_SIZE(irqlist); i++)
 			if (request_irq (irqlist[i], NULL, 0, "bogus", NULL) != -EBUSY) {
 				dev->irq = irqlist[i];
 				break;
 			}
-		if (i >= 8) {
+		if (i >= ARRAY_SIZE(irqlist)) {
 			printk(" unable to get IRQ %d.\n", dev->irq);
 			retval = -EAGAIN;
 			goto out;

