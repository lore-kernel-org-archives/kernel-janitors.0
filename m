From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:18:23 +0000
Subject: [PATCH 23/27] drivers/net/wireless: fix sparse warnings: make symbols
Message-Id: <20081222191823.11807.62915.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/wireless/airo.c:3610:6: warning: symbol 'mpi_receive_802_11' was not declared. Should it be static?
  drivers/net/wireless/atmel.c:3183:6: warning: symbol 'atmel_join_bss' was not declared. Should it be static?
  drivers/net/wireless/ray_cs.c:831:5: warning: symbol 'ray_dev_init' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/wireless/airo.c   |    2 +-
 drivers/net/wireless/atmel.c  |    2 +-
 drivers/net/wireless/ray_cs.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index 67d504e..fc4322c 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -3607,7 +3607,7 @@ badrx:
 	}
 }
 
-void mpi_receive_802_11 (struct airo_info *ai)
+static void mpi_receive_802_11(struct airo_info *ai)
 {
 	RxFid rxd;
 	struct sk_buff *skb = NULL;
diff --git a/drivers/net/wireless/atmel.c b/drivers/net/wireless/atmel.c
index 3962b55..350157f 100644
--- a/drivers/net/wireless/atmel.c
+++ b/drivers/net/wireless/atmel.c
@@ -3180,7 +3180,7 @@ static void associate(struct atmel_private *priv, u16 frame_len, u16 subtype)
 	}
 }
 
-void atmel_join_bss(struct atmel_private *priv, int bss_index)
+static void atmel_join_bss(struct atmel_private *priv, int bss_index)
 {
 	struct bss_info *bss =  &priv->BSSinfo[bss_index];
 
diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 81b71f0..99ec7d6 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -828,7 +828,7 @@ static int ray_resume(struct pcmcia_device *link)
 }
 
 /*======================================*/
-int ray_dev_init(struct net_device *dev)
+static int ray_dev_init(struct net_device *dev)
 {
 #ifdef RAY_IMMEDIATE_INIT
     int i;

