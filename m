From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:15:36 +0000
Subject: [PATCH 05/27] drivers/net/arcnet: fix sparse warnings: make symbols
Message-Id: <20081222191535.11807.72965.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/arcnet/capmode.c:64:6: warning: symbol 'arcnet_cap_init' was not declared. Should it be static?
  drivers/net/arcnet/com90xx.c:586:5: warning: symbol 'com90xx_reset' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/arcnet/capmode.c |    2 +-
 drivers/net/arcnet/com90xx.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/arcnet/capmode.c b/drivers/net/arcnet/capmode.c
index e544953..30580bb 100644
--- a/drivers/net/arcnet/capmode.c
+++ b/drivers/net/arcnet/capmode.c
@@ -61,7 +61,7 @@ static struct ArcProto capmode_proto  };
 
 
-void arcnet_cap_init(void)
+static void arcnet_cap_init(void)
 {
 	int count;
 
diff --git a/drivers/net/arcnet/com90xx.c b/drivers/net/arcnet/com90xx.c
index f4113d2..d762fe4 100644
--- a/drivers/net/arcnet/com90xx.c
+++ b/drivers/net/arcnet/com90xx.c
@@ -583,7 +583,7 @@ static void com90xx_setmask(struct net_device *dev, int mask)
  *
  * However, it does make sure the card is in a defined state.
  */
-int com90xx_reset(struct net_device *dev, int really_reset)
+static int com90xx_reset(struct net_device *dev, int really_reset)
 {
 	struct arcnet_local *lp = netdev_priv(dev);
 	short ioaddr = dev->base_addr;

