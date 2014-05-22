From: Gengis Dave <root@gengisdave.org>
Date: Thu, 22 May 2014 23:07:13 +0000
Subject: [PATCH 2/2] staging: gdm72xx: return values cleanup
Message-Id: <3522339.SasczoGKlN@mayhem>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Return values cleanup

Signed-off-by: Davide Gianforte <davide@gengisdave.org>
---

 drivers/staging/gdm72xx/gdm_wimax.c | 3 +--
 drivers/staging/gdm72xx/usb_boot.c  | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gdm72xx/gdm_wimax.c 
b/drivers/staging/gdm72xx/gdm_wimax.c
index 245fdea..e5e5115 100644
--- a/drivers/staging/gdm72xx/gdm_wimax.c
+++ b/drivers/staging/gdm72xx/gdm_wimax.c
@@ -167,7 +167,6 @@ static inline int gdm_wimax_header(struct sk_buff **pskb)
 {
 	u16 buf[HCI_HEADER_SIZE / sizeof(u16)];
 	struct sk_buff *skb = *pskb;
-	int ret = 0;
 
 	if (unlikely(skb_headroom(skb) < HCI_HEADER_SIZE)) {
 		struct sk_buff *skb2;
@@ -187,7 +186,7 @@ static inline int gdm_wimax_header(struct sk_buff **pskb)
 	memcpy(skb->data, buf, HCI_HEADER_SIZE);
 
 	*pskb = skb;
-	return ret;
+	return 0;
 }
 
 static void gdm_wimax_event_rcv(struct net_device *dev, u16 type, void *msg,
diff --git a/drivers/staging/gdm72xx/usb_boot.c 
b/drivers/staging/gdm72xx/usb_boot.c
index 998af04..d59bac8 100644
--- a/drivers/staging/gdm72xx/usb_boot.c
+++ b/drivers/staging/gdm72xx/usb_boot.c
@@ -333,11 +333,8 @@ out:
 
 static int em_fw_reset(struct usb_device *usbdev)
 {
-	int ret;
-
 	/*Send ZLP*/
-	ret = gdm_wibro_send(usbdev, NULL, 0);
-	return ret;
+	return gdm_wibro_send(usbdev, NULL, 0);
 }
 
 int usb_emergency(struct usb_device *usbdev)

