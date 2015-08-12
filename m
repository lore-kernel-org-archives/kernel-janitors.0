From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Aug 2015 21:08:01 +0000
Subject: [patch] cosa: missing error code on failure in probe()
Message-Id: <20150812210800.GB8068@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jan \"Yenya\" Kasprzak" <kas@fi.muni.cz>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If register_hdlc_device() fails, the current code returns 0 but we
should return an error code instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wan/cosa.c b/drivers/net/wan/cosa.c
index 7193b73..848ea6a 100644
--- a/drivers/net/wan/cosa.c
+++ b/drivers/net/wan/cosa.c
@@ -589,7 +589,8 @@ static int cosa_probe(int base, int irq, int dma)
 		chan->netdev->base_addr = chan->cosa->datareg;
 		chan->netdev->irq = chan->cosa->irq;
 		chan->netdev->dma = chan->cosa->dma;
-		if (register_hdlc_device(chan->netdev)) {
+		err = register_hdlc_device(chan->netdev);
+		if (err) {
 			netdev_warn(chan->netdev,
 				    "register_hdlc_device() failed\n");
 			free_netdev(chan->netdev);
