From: Colin King <colin.king@canonical.com>
Date: Fri, 18 May 2018 10:09:22 +0000
Subject: [PATCH] hippi: fix spelling mistake: "Framming" -> "Framing"
Message-Id: <20180518100922.28790-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jes Sorensen <jes@trained-monkey.org>, "David S . Miller" <davem@davemloft.net>, linux-hippi@sunsite.dk, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in printk message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/hippi/rrunner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hippi/rrunner.c b/drivers/net/hippi/rrunner.c
index 1ab97d99b9ba..f41116488079 100644
--- a/drivers/net/hippi/rrunner.c
+++ b/drivers/net/hippi/rrunner.c
@@ -867,7 +867,7 @@ static u32 rr_handle_event(struct net_device *dev, u32 prodidx, u32 eidx)
 			       dev->name);
 			goto drop;
 		case E_FRM_ERR:
-			printk(KERN_WARNING "%s: Framming Error\n",
+			printk(KERN_WARNING "%s: Framing Error\n",
 			       dev->name);
 			goto drop;
 		case E_FLG_SYN_ERR:
-- 
2.17.0

