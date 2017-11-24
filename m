From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:27:12 +0000
Subject: [PATCH] atm: lanai: use setup_timer instead of init_timer
Message-Id: <20171124132712.31882-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/lanai.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 2351dad78ff5..87e8b5dfac39 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1790,10 +1790,8 @@ static void lanai_timed_poll(unsigned long arg)
 
 static inline void lanai_timed_poll_start(struct lanai_dev *lanai)
 {
-	init_timer(&lanai->timer);
+	setup_timer(&lanai->timer, lanai_timed_poll, (unsigned long)lanai);
 	lanai->timer.expires = jiffies + LANAI_POLL_PERIOD;
-	lanai->timer.data = (unsigned long) lanai;
-	lanai->timer.function = lanai_timed_poll;
 	add_timer(&lanai->timer);
 }
 
-- 
2.14.1

