From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:24:08 +0000
Subject: [patch] myri: remove dead code
Message-Id: <20100315082408.GG18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Gallatin <gallatin@myri.com>
Cc: Brice Goglin <brice@myri.com>, "David S. Miller" <davem@davemloft.net>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We can never reach the return statement.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/myri10ge/myri10ge.c b/drivers/net/myri10ge/myri10ge.c
index 676c513..e84dd3e 100644
--- a/drivers/net/myri10ge/myri10ge.c
+++ b/drivers/net/myri10ge/myri10ge.c
@@ -3687,7 +3687,6 @@ static void myri10ge_probe_slices(struct myri10ge_priv *mgp)
 	if (status != 0) {
 		dev_err(&mgp->pdev->dev, "failed reset\n");
 		goto abort_with_fw;
-		return;
 	}
 
 	mgp->max_intr_slots = cmd.data0 / sizeof(struct mcp_slot);
