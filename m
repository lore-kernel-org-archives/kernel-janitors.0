From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 06 Jul 2008 22:18:10 +0000
Subject: [PATCH] drivers/char/pcmcia/ipwireless/hardware.c fix resource leak
Message-Id: <1215382690.11092.11.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, jkosina@suse.cz, dsterba@suse.cz

G'day people,

Coverity CID: 2172 RESOURCE_LEAK

When pool_allocate() tries to enlarge a packet, if it can not allocate
enough memory, it returns NULL without first freeing the old packet.

This patch just frees the packet first.

﻿﻿﻿Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>

diff --git a/drivers/char/pcmcia/ipwireless/hardware.c b/drivers/char/pcmcia/ipwireless/hardware.c
index ba6340a..929101e 100644
--- a/drivers/char/pcmcia/ipwireless/hardware.c
+++ b/drivers/char/pcmcia/ipwireless/hardware.c
@@ -590,8 +590,10 @@ static struct ipw_rx_packet *pool_allocate(struct ipw_hardware *hw,
 		packet = kmalloc(sizeof(struct ipw_rx_packet) +
 				old_packet->length + minimum_free_space,
 				GFP_ATOMIC);
-		if (!packet)
+		if (!packet) {
+			kfree(old_packet);
 			return NULL;
+		}
 		memcpy(packet, old_packet,
 				sizeof(struct ipw_rx_packet)
 					+ old_packet->length);
 

