From: Colin King <colin.king@canonical.com>
Date: Tue, 14 May 2019 21:14:06 +0000
Subject: [PATCH] libertas/libertas_tf: fix spelling mistake "Donwloading" -> "Downloading"
Message-Id: <20190514211406.6353-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is are two spelling mistakes in lbtf_deb_usb2 messages, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas/if_usb.c    | 2 +-
 drivers/net/wireless/marvell/libertas_tf/if_usb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_usb.c b/drivers/net/wireless/marvell/libertas/if_usb.c
index 220dcdee8d2b..1d06fa564e28 100644
--- a/drivers/net/wireless/marvell/libertas/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas/if_usb.c
@@ -367,7 +367,7 @@ static int if_usb_send_fw_pkt(struct if_usb_card *cardp)
 			     cardp->fwseqnum, cardp->totalbytes);
 	} else if (fwdata->hdr.dnldcmd = cpu_to_le32(FW_HAS_LAST_BLOCK)) {
 		lbs_deb_usb2(&cardp->udev->dev, "Host has finished FW downloading\n");
-		lbs_deb_usb2(&cardp->udev->dev, "Donwloading FW JUMP BLOCK\n");
+		lbs_deb_usb2(&cardp->udev->dev, "Downloading FW JUMP BLOCK\n");
 
 		cardp->fwfinalblk = 1;
 	}
diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index a4b9ede70705..38f77b1a02ca 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -319,7 +319,7 @@ static int if_usb_send_fw_pkt(struct if_usb_card *cardp)
 	} else if (fwdata->hdr.dnldcmd = cpu_to_le32(FW_HAS_LAST_BLOCK)) {
 		lbtf_deb_usb2(&cardp->udev->dev,
 			"Host has finished FW downloading\n");
-		lbtf_deb_usb2(&cardp->udev->dev, "Donwloading FW JUMP BLOCK\n");
+		lbtf_deb_usb2(&cardp->udev->dev, "Downloading FW JUMP BLOCK\n");
 
 		/* Host has finished FW downloading
 		 * Donwloading FW JUMP BLOCK
-- 
2.20.1
