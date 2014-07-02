From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 02 Jul 2014 09:25:51 +0000
Subject: [PATCH] Staging: rtl8192e: Fix potential NULL pointer dereference
Message-Id: <1404293151-15804-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rashika Kheria <rashika.kheria@gmail.com>, Valentina Manea <valentina.manea.m@gmail.com>, Josh Triplett <josh@joshtriplett.org>, Andrea Merello <andrea.merello@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

We need to make sure the struct rtllib_device pointer ieee is not NULL
after the goto rx_dropped label since it is dereferenced there.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 60de54c..7db3e74 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1496,7 +1496,8 @@ int rtllib_rx(struct rtllib_device *ieee, struct sk_buff *skb,
 	return ret;
 
  rx_dropped:
-	ieee->stats.rx_dropped++;
+	if (ieee)
+		ieee->stats.rx_dropped++;
 	return 0;
 }
 EXPORT_SYMBOL(rtllib_rx);
-- 
1.7.10.4

