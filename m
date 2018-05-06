From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 06 May 2018 07:53:53 +0000
Subject: [PATCH] mwifiex: delete unneeded include
Message-Id: <1525593233-10968-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxm@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Nothing that is defined in 11ac.h is referenced in cmdevt.c.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 7014f44..9cfcdf6 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -25,7 +25,6 @@
 #include "main.h"
 #include "wmm.h"
 #include "11n.h"
-#include "11ac.h"
 
 static void mwifiex_cancel_pending_ioctl(struct mwifiex_adapter *adapter);
 

