From: Julia Lawall <julia@diku.dk>
Date: Sun, 08 Nov 2009 08:23:07 +0000
Subject: [PATCH] drivers/net/wireless: correct check on CCS_START_NETWORK
Message-Id: <Pine.LNX.4.64.0911080922360.2465@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Thomas <coreythomas@charter.net>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

CCS_START_NETWORK is declared in drivers/net/wireless/rayctl.h with the
comment Values for cmd.  status is previously compared to
CCS_COMMAND_COMPLETE, which is declared in the same file with the comment
Values for buffer_status.  Finally, it is possible at this point that cmd
is CCS_START_NETWORK, because it is compared to that value in an enclosing
switch that has CCS_START_NETWORK as one of two case labels around this code.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/ray_cs.c       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 1c88c2e..5ee9d2a 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -2074,7 +2074,7 @@ static irqreturn_t ray_interrupt(int irq, void *dev_id)
 				del_timer(&local->timer);
 				local->timer.expires = jiffies + HZ * 5;
 				local->timer.data = (long)local;
-				if (status = CCS_START_NETWORK) {
+				if (cmd = CCS_START_NETWORK) {
 					DEBUG(0,
 					      "ray_cs interrupt network \"%s\" start failed\n",
 					      local->sparm.b4.a_current_ess_id);
