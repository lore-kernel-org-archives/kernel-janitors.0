From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:13:50 +0000
Subject: [PATCH 38] drivers/char/ip2/ip2main.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312013.51172.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/char/ip2/ip2main.c | 104398 -> 104346 (-52 bytes)
 drivers/char/ip2/ip2main.o | 210710 -> 210702 (-8 bytes)

 drivers/char/ip2/ip2main.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/char/ip2/ip2main.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/char/ip2/ip2main.c	2007-07-31 20:04:19.000000000 +0200
@@ -646,10 +646,9 @@ ip2_loadmain(int *iop, int *irqp, unsign

 	for ( i = 0; i < IP2_MAX_BOARDS; ++i ) {
 		if ( ip2config.addr[i] ) {
-			pB = kmalloc( sizeof(i2eBordStr), GFP_KERNEL);
-			if ( pB != NULL ) {
+			pB = kzalloc(sizeof(i2eBordStr), GFP_KERNEL);
+			if (pB) {
 				i2BoardPtrTable[i] = pB;
-				memset( pB, 0, sizeof(i2eBordStr) );
 				iiSetAddress( pB, ip2config.addr[i], ii2DelayTimer );
 				iiReset( pB );
 			} else {
