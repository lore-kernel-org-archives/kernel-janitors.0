From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 22:48:50 +0000
Subject: [PATCH] power: supply: ab8500_fg: fix spelling mistake: "Disharge" -> "Discharge"
Message-Id: <20180328224850.27833-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/ab8500_fg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/ab8500_fg.c b/drivers/power/supply/ab8500_fg.c
index c569f82a0071..993898d1712f 100644
--- a/drivers/power/supply/ab8500_fg.c
+++ b/drivers/power/supply/ab8500_fg.c
@@ -1408,7 +1408,7 @@ static void ab8500_fg_charge_state_to(struct ab8500_fg *di,
 static void ab8500_fg_discharge_state_to(struct ab8500_fg *di,
 	enum ab8500_fg_discharge_state new_state)
 {
-	dev_dbg(di->dev, "Disharge state from %d [%s] to %d [%s]\n",
+	dev_dbg(di->dev, "Discharge state from %d [%s] to %d [%s]\n",
 		di->discharge_state,
 		discharge_state[di->discharge_state],
 		new_state,
-- 
2.15.1

