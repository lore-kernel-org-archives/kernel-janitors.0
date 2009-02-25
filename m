From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 20:31:59 +0000
Subject: [PATCH 3/8] appletalk: fix warning: format not a string literal and
Message-Id: <20090225203145.6251.44085.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Use 'static const char[]' instead of 'static char[]', and
since the data is const now it can be placed in __initconst.

Fix this warning:
  net/appletalk/ddp.c: In function 'atalk_init':
  net/appletalk/ddp.c:1894: warning: format not a string literal and no format arguments

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 net/appletalk/ddp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index 510a678..cf05c43 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -1877,7 +1877,7 @@ EXPORT_SYMBOL(aarp_send_ddp);
 EXPORT_SYMBOL(atrtr_get_dev);
 EXPORT_SYMBOL(atalk_find_dev_addr);
 
-static char atalk_err_snap[] __initdata +static const char atalk_err_snap[] __initconst  	KERN_CRIT "Unable to register DDP with SNAP.\n";
 
 /* Called by proto.c on kernel start up */

