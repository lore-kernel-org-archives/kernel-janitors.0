From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 16:09:08 +0000
Subject: [PATCH 1/10] drivers/net/usb/sierra_net.c: removes unnecessary semicolon
Message-Id: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/net/usb/sierra_net.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -842,7 +842,7 @@ static int sierra_net_rx_fixup(struct us
 				netdev_err(dev->net, "HIP/ETH: Invalid pkt\n");
 
 			dev->net->stats.rx_frame_errors++;
-			/* dev->net->stats.rx_errors incremented by caller */;
+			/* dev->net->stats.rx_errors incremented by caller */
 			return 0;
 		}
 

