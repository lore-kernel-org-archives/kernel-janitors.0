From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 12:07:56 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_staging=3a_vt6656=3a_Delete_an_unnecessary_ch?= =?UTF-8?B?ZWNrIGJlZm9yZSB0aGUg
Message-Id: <ff6e12fb-f144-351b-25e9-a864b58d7acf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 13:56:35 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/vt6656/main_usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index 856ba97aec4f..f57e890659aa 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -422,8 +422,7 @@ static void vnt_free_rx_bufs(struct vnt_private *priv)
 		}

 		/* deallocate skb */
-		if (rcb->skb)
-			dev_kfree_skb(rcb->skb);
+		dev_kfree_skb(rcb->skb);

 		kfree(rcb);
 	}
--
2.23.0
