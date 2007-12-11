From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 11 Dec 2007 04:32:38 +0000
Subject: [PATCH 1/6] pcmcia/3c574_cs: Fix dubious bitfield warning
Message-Id: <20071211043412.28518.40867.sendpatchset@thinktank.campus.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>

Fixing:
  CHECK   drivers/net/pcmcia/3c574_cs.c
drivers/net/pcmcia/3c574_cs.c:194:13: warning: dubious bitfield without explicit `signed' or `unsigned'
drivers/net/pcmcia/3c574_cs.c:196:14: warning: dubious bitfield without explicit `signed' or `unsigned'

Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
---
Is there a reason for not doing it this way?


diff --git a/drivers/net/pcmcia/3c574_cs.c b/drivers/net/pcmcia/3c574_cs.c
index ad134a6..97b6daa 100644
--- a/drivers/net/pcmcia/3c574_cs.c
+++ b/drivers/net/pcmcia/3c574_cs.c
@@ -190,10 +190,10 @@ enum Window3 {			/* Window 3: MAC/config bits. */
 union wn3_config {
 	int i;
 	struct w3_config_fields {
-		unsigned int ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
-		int pad8:8;
-		unsigned int ram_split:2, pad18:2, xcvr:3, pad21:1, autoselect:1;
-		int pad24:7;
+		u8 ram_size:3, ram_width:1, ram_speed:2, rom_size:2;
+		u8 pad8;
+		u8 ram_split:2, pad18:2, xcvr:3, pad21:1;
+		u8 autoselect:1, pad24:7;
 	} u;
 };
 
