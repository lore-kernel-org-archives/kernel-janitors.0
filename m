From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:32:54 +0000
Subject: [PATCH 4/6] pcmcia/axnet_cs: Make use of 'max()' instead of handcrafted one
Message-Id: <20071211043428.28518.24891.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Use 'max(x,y)' instead of 'x < y ? y : x'.

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---


diff --git a/drivers/net/pcmcia/axnet_cs.c b/drivers/net/pcmcia/axnet_cs.c
index 8d910a3..96931cc 100644
--- a/drivers/net/pcmcia/axnet_cs.c
+++ b/drivers/net/pcmcia/axnet_cs.c
@@ -1091,8 +1091,8 @@ static int ei_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	
 	ei_local->irqlock = 1;
 
-	send_length = ETH_ZLEN < length ? length : ETH_ZLEN;
-	
+	send_length = max(length, ETH_ZLEN);
+
 	/*
 	 * We have two Tx slots available for use. Find the first free
 	 * slot, and then perform some sanity checks. With two Tx bufs,
