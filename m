From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 08:49:38 +0000
Subject: [patch] brcm80211: fmac: small memory leak on error
Message-Id: <20111130084937.GI6268@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Franky Lin <frankyl@broadcom.com>, Arend van Spriel <arend@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, Alwin Beukers <alwin@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We should free "bus_if" here, it's a small leak but it makes the static
checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh_sdmmc.c b/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh_sdmmc.c
index 77f84f8..b416e27 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh_sdmmc.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/bcmsdh_sdmmc.c
@@ -477,8 +477,10 @@ static int brcmf_ops_sdio_probe(struct sdio_func *func,
 		if (!bus_if)
 			return -ENOMEM;
 		sdiodev = kzalloc(sizeof(struct brcmf_sdio_dev), GFP_KERNEL);
-		if (!sdiodev)
+		if (!sdiodev) {
+			kfree(bus_if);
 			return -ENOMEM;
+		}
 		sdiodev->dev = &func->card->dev;
 		sdiodev->func[0] = func->card->sdio_func[0];
 		sdiodev->func[1] = func;
