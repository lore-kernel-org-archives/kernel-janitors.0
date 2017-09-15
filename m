From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 07:53:39 +0000
Subject: [PATCH 5/9] [media] tm6000: Delete an unnecessary variable initialisation in tm6000_usb_probe()
Message-Id: <9c547e6f-8a78-ec7b-2054-dd64708d5823@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
In-Reply-To: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Sean Young <sean@mess.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Sep 2017 16:13:56 +0200

The local variable "rc" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
index 77347541904d..72dd6b80394f 100644
--- a/drivers/media/usb/tm6000/tm6000-cards.c
+++ b/drivers/media/usb/tm6000/tm6000-cards.c
@@ -1185,7 +1185,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
 {
 	struct usb_device *usbdev;
 	struct tm6000_core *dev;
-	int i, rc = 0;
+	int i, rc;
 	int nr = 0;
 	char *speed;
 
-- 
2.14.1

