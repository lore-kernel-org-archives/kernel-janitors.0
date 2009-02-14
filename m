From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:44:19 +0000
Subject: [PATCH 29/43] drivers/net/tokenring: fix warning: format not a string
Message-Id: <20090214214327.24377.33907.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Use 'static const char[]' instead of 'static char[]'.

Fix this warnings:
  drivers/net/tokenring/smctr.c:3644: warning: format not a string literal and no format arguments

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/tokenring/smctr.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/net/tokenring/smctr.c b/drivers/net/tokenring/smctr.c
index 50eb29c..5a3ff20 100644
--- a/drivers/net/tokenring/smctr.c
+++ b/drivers/net/tokenring/smctr.c
@@ -61,7 +61,8 @@
 
 #include "smctr.h"               /* Our Stuff */
 
-static char version[] __initdata = KERN_INFO "smctr.c: v1.4 7/12/00 by jschlst@samba.org\n";
+static const char version[] __initdata +	KERN_INFO "smctr.c: v1.4 7/12/00 by jschlst@samba.org\n";
 static const char cardname[] = "smctr";
 
 

