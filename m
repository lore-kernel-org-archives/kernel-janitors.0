From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 08:59:25 +0000
Subject: [PATCH] atm: nicstar: use the setup_timer helper
Message-Id: <20171124085925.25967-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Replace init_timer and two explicit assignments with the setup_timer
helper.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/nicstar.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/atm/nicstar.c b/drivers/atm/nicstar.c
index a9702836cbae..335447ed0ba4 100644
--- a/drivers/atm/nicstar.c
+++ b/drivers/atm/nicstar.c
@@ -284,10 +284,8 @@ static int __init nicstar_init(void)
 	XPRINTK("nicstar: nicstar_init() returned.\n");
 
 	if (!error) {
-		init_timer(&ns_timer);
+		setup_timer(&ns_timer, ns_poll, 0UL);
 		ns_timer.expires = jiffies + NS_POLL_PERIOD;
-		ns_timer.data = 0UL;
-		ns_timer.function = ns_poll;
 		add_timer(&ns_timer);
 	}
 
-- 
2.14.1

