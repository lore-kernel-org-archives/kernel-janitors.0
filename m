From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 17:19:16 +0000
Subject: [PATCH] net: caif: remove redundant null check on frontpkt
Message-Id: <20180914171916.21298-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S . Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is impossible for frontpkt to be null at the point of the null
check because it has been assigned from rearpkt and there is no
way realpkt can be null at the point of the assignment because
of the sanity checking and exit paths taken previously. Remove
the redundant null check.

Detected by CoverityScan, CID#114434 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/caif/cfrfml.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/caif/cfrfml.c b/net/caif/cfrfml.c
index b82440e1fcb4..a931a71ef6df 100644
--- a/net/caif/cfrfml.c
+++ b/net/caif/cfrfml.c
@@ -264,9 +264,6 @@ static int cfrfml_transmit(struct cflayer *layr, struct cfpkt *pkt)
 		frontpkt = rearpkt;
 		rearpkt = NULL;
 
-		err = -ENOMEM;
-		if (frontpkt = NULL)
-			goto out;
 		err = -EPROTO;
 		if (cfpkt_add_head(frontpkt, head, 6) < 0)
 			goto out;
-- 
2.17.1
