From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:17:19 +0000
Subject: [PATCH 14/37] drivers/net/wireless/ath/ath9k: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152316580.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <lrodriguez@atheros.com>, Jouni Malinen <jmalinen@atheros.com>, Sujith Manoharan <Sujith.Manoharan@atheros.com>, Vasanthakumar Thiagarajan <vasanth@atheros.com>, Senthil Balasubramanian <senthilkumar@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@lists.ath9k.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/ath/ath9k/hif_usb.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -u -p a/drivers/net/wireless/ath/ath9k/hif_usb.c b/drivers/net/wireless/ath/ath9k/hif_usb.c
--- a/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ b/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -901,12 +901,10 @@ static void ath9k_hif_usb_reboot(struct 
 	void *buf;
 	int ret;
 
-	buf = kmalloc(4, GFP_KERNEL);
+	buf = kmemdup(&reboot_cmd, 4, GFP_KERNEL);
 	if (!buf)
 		return;
 
-	memcpy(buf, &reboot_cmd, 4);
-
 	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, USB_REG_OUT_PIPE),
 			   buf, 4, NULL, HZ);
 	if (ret)
