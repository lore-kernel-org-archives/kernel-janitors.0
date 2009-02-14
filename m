From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:39:23 +0000
Subject: [PATCH 25/43] drivers/net/pcmcia: fix warning: format not a string
Message-Id: <20090214213849.24377.87932.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Use 'static const char[]' instead of 'static char[]' and while
being at it prefix the message with KERN_INFO.

Fix this warnings:
  drivers/net/pcmcia/axnet_cs.c:1716: warning: format not a string literal and no format arguments

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/pcmcia/axnet_cs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/pcmcia/axnet_cs.c b/drivers/net/pcmcia/axnet_cs.c
index 0afa720..871ad29 100644
--- a/drivers/net/pcmcia/axnet_cs.c
+++ b/drivers/net/pcmcia/axnet_cs.c
@@ -861,7 +861,7 @@ module_exit(exit_axnet_cs);
 
   */
 
-static const char *version_8390 +static const char version_8390[] = KERN_INFO \
     "8390.c:v1.10cvs 9/23/94 Donald Becker (becker@scyld.com)\n";
 
 #include <linux/bitops.h>

