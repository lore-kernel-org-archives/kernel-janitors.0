From: Dan Carpenter <error27@gmail.com>
Date: Fri, 06 Aug 2010 08:23:23 +0000
Subject: [patch] isdn: gigaset: add missing unlock
Message-Id: <20100806082323.GU9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hansjoerg Lipp <hjlipp@web.de>
Cc: Tilman Schmidt <tilman@imap.cc>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <ext-andriy.shevchenko@nokia.com>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here.  This is the only place where we return from the
function with the lock held.  The caller isn't expecting it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/isdn/gigaset/capi.c b/drivers/isdn/gigaset/capi.c
index e5ea344..bcc174e 100644
--- a/drivers/isdn/gigaset/capi.c
+++ b/drivers/isdn/gigaset/capi.c
@@ -1052,6 +1052,7 @@ static inline void remove_appl_from_channel(struct bc_state *bcs,
 	do {
 		if (bcap->bcnext = ap) {
 			bcap->bcnext = bcap->bcnext->bcnext;
+			spin_unlock_irqrestore(&bcs->aplock, flags);
 			return;
 		}
 		bcap = bcap->bcnext;
