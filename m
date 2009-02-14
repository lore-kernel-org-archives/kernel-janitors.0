From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:14:45 +0000
Subject: [PATCH 11/43] drivers/net/arcnet: fix sparse warning: symbol shadows
Message-Id: <20090214211439.23489.20716.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Remove redundant inner scope variable.

Fix this sparse warning:
  drivers/net/arcnet/arcnet.c:383:21: warning: symbol 'count' shadows an earlier one
  drivers/net/arcnet/arcnet.c:375:13: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/arcnet/arcnet.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/net/arcnet/arcnet.c b/drivers/net/arcnet/arcnet.c
index a80d4a3..d6d4ab3 100644
--- a/drivers/net/arcnet/arcnet.c
+++ b/drivers/net/arcnet/arcnet.c
@@ -380,7 +380,6 @@ int arcnet_open(struct net_device *dev)
 		return -ENODEV;
 
 	BUGLVL(D_PROTO) {
-		int count;
 		BUGMSG(D_PROTO, "protocol map (default is '%c'): ",
 		       arc_proto_default->suffix);
 		for (count = 0; count < 256; count++)

