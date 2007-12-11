From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:32:48 +0000
Subject: [PATCH 3/6] pcmcia/axnet_cs: Make functions static
Message-Id: <20071211043423.28518.72145.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Fixing:
  CHECK   drivers/net/pcmcia/axnet_cs.c
drivers/net/pcmcia/axnet_cs.c:994:5: warning: symbol 'ax_close' was not declared. Should it be static?
drivers/net/pcmcia/axnet_cs.c:1017:6: warning: symbol 'ei_tx_timeout' was not declared. Should it be static?

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---


diff --git a/drivers/net/pcmcia/axnet_cs.c b/drivers/net/pcmcia/axnet_cs.c
index 8d910a3..96931cc 100644
--- a/drivers/net/pcmcia/axnet_cs.c
+++ b/drivers/net/pcmcia/axnet_cs.c
@@ -991,7 +991,7 @@ static int ax_open(struct net_device *dev)
  *
  * Opposite of ax_open(). Only used when "ifconfig <devname> down" is done.
  */
-int ax_close(struct net_device *dev)
+static int ax_close(struct net_device *dev)
 {
 	unsigned long flags;
 
@@ -1014,7 +1014,7 @@ int ax_close(struct net_device *dev)
  * completed (or failed) - i.e. never posted a Tx related interrupt.
  */
 
-void ei_tx_timeout(struct net_device *dev)
+static void ei_tx_timeout(struct net_device *dev)
 {
 	long e8390_base = dev->base_addr;
 	struct ei_device *ei_local = (struct ei_device *) netdev_priv(dev);
