From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:32:43 +0000
Subject: [PATCH 2/6] pcmcia/3c574_cs: Fix 'shadow variable' warning
Message-Id: <20071211043417.28518.39249.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Fixing:
  CHECK   drivers/net/pcmcia/3c574_cs.c
drivers/net/pcmcia/3c574_cs.c:695:7: warning: symbol 'i' shadows an earlier one
drivers/net/pcmcia/3c574_cs.c:636:6: originally declared here

Signed-off-by: Richard Knutson <ricknu-0@student.ltu.se>
---


diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
index ad134a6..97b6daa 100644
--- a/drivers/net/pcmcia/3c574_cs.c
+++ b/drivers/net/pcmcia/3c574_cs.c
@@ -692,7 +692,7 @@ static void tc574_reset(struct net_device *dev)
 	mdio_write(ioaddr, lp->phys, 4, lp->advertising);
 	if (!auto_polarity) {
 		/* works for TDK 78Q2120 series MII's */
-		int i = mdio_read(ioaddr, lp->phys, 16) | 0x20;
+		i = mdio_read(ioaddr, lp->phys, 16) | 0x20;
 		mdio_write(ioaddr, lp->phys, 16, i);
 	}
 
