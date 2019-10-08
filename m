From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Oct 2019 08:17:47 +0000
Subject: [PATCH][next] netdevsim: fix spelling mistake "forbidded" -> "forbid"
Message-Id: <20191008081747.19431-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a NL_SET_ERR_MSG_MOD message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/netdevsim/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index a3d7d39f231a..ff6ced5487b6 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -486,7 +486,7 @@ static int nsim_dev_reload_down(struct devlink *devlink, bool netns_change,
 		/* For testing purposes, user set debugfs dont_allow_reload
 		 * value to true. So forbid it.
 		 */
-		NL_SET_ERR_MSG_MOD(extack, "User forbidded reload for testing purposes");
+		NL_SET_ERR_MSG_MOD(extack, "User forbid the reload for testing purposes");
 		return -EOPNOTSUPP;
 	}
 
-- 
2.20.1
