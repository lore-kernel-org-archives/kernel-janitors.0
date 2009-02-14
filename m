From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:46:59 +0000
Subject: [PATCH 32/43] drivers/net/tulip: fix warning: format not a string
Message-Id: <20090214214632.24377.15197.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Use 'static const char[]' instead of 'static char[]' and while
being at it add a KERN_INFO prefix.

Fix this warning:
  drivers/net/tulip/de4x5.c: In function 'de4x5_hw_init':
  drivers/net/tulip/de4x5.c:1268: warning: format not a string literal and no format arguments
  drivers/net/tulip/winbond-840.c: In function 'w840_init':
  drivers/net/tulip/winbond-840.c:1666: warning: format not a string literal and no format arguments

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/tulip/de4x5.c       |    3 ++-
 drivers/net/tulip/winbond-840.c |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/tulip/de4x5.c b/drivers/net/tulip/de4x5.c
index 6418f74..98e8682 100644
--- a/drivers/net/tulip/de4x5.c
+++ b/drivers/net/tulip/de4x5.c
@@ -479,7 +479,8 @@
 
 #include "de4x5.h"
 
-static char version[] __devinitdata = "de4x5.c:V0.546 2001/02/22 davies@maniac.ultranet.com\n";
+static const char version[] __devinitdata +	KERN_INFO "de4x5.c:V0.546 2001/02/22 davies@maniac.ultranet.com\n";
 
 #define c_char const char
 
diff --git a/drivers/net/tulip/winbond-840.c b/drivers/net/tulip/winbond-840.c
index f467bf8..426b7c7 100644
--- a/drivers/net/tulip/winbond-840.c
+++ b/drivers/net/tulip/winbond-840.c
@@ -139,7 +139,7 @@ static int full_duplex[MAX_UNITS] = {-1, -1, -1, -1, -1, -1, -1, -1};
 #define PKT_BUF_SZ		1536	/* Size of each temporary Rx buffer.*/
 
 /* These identify the driver base version and may not be removed. */
-static char version[] +static const char version[] __initdata  KERN_INFO DRV_NAME ".c:v" DRV_VERSION " (2.4 port) " DRV_RELDATE "  Donald Becker <becker@scyld.com>\n"
 KERN_INFO "  http://www.scyld.com/network/drivers.html\n";
 

