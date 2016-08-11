From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 11 Aug 2016 14:38:54 +0000
Subject: [PATCH] rt2x00usb: Fix error return code
Message-Id: <1470926334-24532-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: sgruszka@redhat.com, helmut.schaa@googlemail.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We know that 'retval = 0' because it has been tested a few lines above.
So, if 'devm_kmalloc' fails, 0 will be returned instead of an error code.
Return -ENOMEM instead.

Fixes: 8b4c0009313f ("rt2x00usb: Use usb anchor to manage URB")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
index 7cf26c6124d1..6005e14213ca 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
@@ -831,8 +831,10 @@ int rt2x00usb_probe(struct usb_interface *usb_intf,
 	rt2x00dev->anchor = devm_kmalloc(&usb_dev->dev,
 					sizeof(struct usb_anchor),
 					GFP_KERNEL);
-	if (!rt2x00dev->anchor)
+	if (!rt2x00dev->anchor) {
+		retval = -ENOMEM;
 		goto exit_free_reg;
+	}
 
 	init_usb_anchor(rt2x00dev->anchor);
 	return 0;
-- 
2.7.4


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

