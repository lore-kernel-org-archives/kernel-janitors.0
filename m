From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:48:25 +0000
Subject: [PATCH 36/43] drivers/net/wan: fix sparse warning: symbol shadows an
Message-Id: <20090214214815.24377.92862.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Rename function scope variable and while being at it fix some
coding style issues.

Fix this sparse warning:
  drivers/net/wan/sbni.c:1526:14: warning: symbol 'num' shadows an earlier one
  drivers/net/wan/sbni.c:160:13: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wan/sbni.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wan/sbni.c b/drivers/net/wan/sbni.c
index 0aa28e1..78f7bc9 100644
--- a/drivers/net/wan/sbni.c
+++ b/drivers/net/wan/sbni.c
@@ -1520,17 +1520,18 @@ int __init init_module( void )
 }
 
 void
-cleanup_module( void )
+cleanup_module(void)
 {
-	struct net_device  *dev;
-	int  num;
+	int i;
 
-	for( num = 0;  num < SBNI_MAX_NUM_CARDS;  ++num )
-		if( (dev = sbni_cards[ num ]) != NULL ) {
-			unregister_netdev( dev );
-			release_region( dev->base_addr, SBNI_IO_EXTENT );
-			free_netdev( dev );
+	for (i = 0;  i < SBNI_MAX_NUM_CARDS;  ++i) {
+		struct net_device *dev = sbni_cards[i];
+		if (dev != NULL) {
+			unregister_netdev(dev);
+			release_region(dev->base_addr, SBNI_IO_EXTENT);
+			free_netdev(dev);
 		}
+	}
 }
 
 #else	/* MODULE */

