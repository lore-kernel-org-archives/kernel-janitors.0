From: Dan Carpenter <error27@gmail.com>
Date: Thu, 15 Jul 2010 08:23:10 +0000
Subject: [patch] orinoco_usb: potential null dereference
Message-Id: <20100715082309.GE5164@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Roskin <proski@gnu.org>
Cc: David Gibson <hermes@gibson.dropbear.id.au>, "John W. Linville" <linville@tuxdriver.com>, David Kilroy <kilroyd@googlemail.com>, linux-wireless@vger.kernel.org, orinoco-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

Smatch complains that "upriv->read_urb" gets dereferenced before
checking for NULL.  It turns out that it's possible for
"upriv->read_urb" to be NULL so I added checks around the dereferences.

Also I remove an "if (upriv->bap_buf != NULL)" check because
"kfree(NULL) is OK.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/orinoco/orinoco_usb.c b/drivers/net/wireless/orinoco/orinoco_usb.c
index 78f089b..11d5ec2 100644
--- a/drivers/net/wireless/orinoco/orinoco_usb.c
+++ b/drivers/net/wireless/orinoco/orinoco_usb.c
@@ -1504,16 +1504,16 @@ static inline void ezusb_delete(struct ezusb_priv *upriv)
 	    ezusb_ctx_complete(list_entry(item,
 					  struct request_context, list));
 
-	if (upriv->read_urb->status = -EINPROGRESS)
+	if (upriv->read_urb && upriv->read_urb->status = -EINPROGRESS)
 		printk(KERN_ERR PFX "Some URB in progress\n");
 
 	mutex_unlock(&upriv->mtx);
 
-	kfree(upriv->read_urb->transfer_buffer);
-	if (upriv->bap_buf != NULL)
-		kfree(upriv->bap_buf);
-	if (upriv->read_urb != NULL)
+	if (upriv->read_urb) {
+		kfree(upriv->read_urb->transfer_buffer);
 		usb_free_urb(upriv->read_urb);
+	}
+	kfree(upriv->bap_buf);
 	if (upriv->dev) {
 		struct orinoco_private *priv = ndev_priv(upriv->dev);
 		orinoco_if_del(priv);
