From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:32:59 +0000
Subject: [PATCH 5/6] pcmcia/fmvj18x_cs: Fix 'shadow variable' warning
Message-Id: <20071211043433.28518.30708.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Fixing:
  CHECK   drivers/net/pcmcia/fmvj18x_cs.c
drivers/net/pcmcia/fmvj18x_cs.c:1205:6: warning: symbol 'i' shadows an earlier one
drivers/net/pcmcia/fmvj18x_cs.c:1179:9: originally declared here

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---


diff --git a/drivers/net/pcmcia/fmvj18x_cs.c b/drivers/net/pcmcia/fmvj18x_cs.c
index 8c719b4..4f604ae 100644
--- a/drivers/net/pcmcia/fmvj18x_cs.c
+++ b/drivers/net/pcmcia/fmvj18x_cs.c
@@ -1202,8 +1202,7 @@ static void set_rx_mode(struct net_device *dev)
 	outb(1, ioaddr + RX_MODE);	/* Ignore almost all multicasts. */
     } else {
 	struct dev_mc_list *mclist;
-	int i;
-	
+
 	memset(mc_filter, 0, sizeof(mc_filter));
 	for (i = 0, mclist = dev->mc_list; mclist && i < dev->mc_count;
 	     i++, mclist = mclist->next) {
