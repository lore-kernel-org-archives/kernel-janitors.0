From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 07:57:43 +0000
Subject: [PATCH 7/9] [media] tm6000: Improve a size determination in dvb_init()
Message-Id: <77a3eba4-aeba-6747-dcce-e545802882d6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
In-Reply-To: <2aade468-5dfd-76ee-f59f-c25864930f61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Sean Young <sean@mess.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Sep 2017 07:33:24 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/tm6000/tm6000-dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/tm6000/tm6000-dvb.c b/drivers/media/usb/tm6000/tm6000-dvb.c
index 2bc584f75f87..855874134fcf 100644
--- a/drivers/media/usb/tm6000/tm6000-dvb.c
+++ b/drivers/media/usb/tm6000/tm6000-dvb.c
@@ -398,7 +398,7 @@ static int dvb_init(struct tm6000_core *dev)
 		return 0;
 	}
 
-	dvb = kzalloc(sizeof(struct tm6000_dvb), GFP_KERNEL);
+	dvb = kzalloc(sizeof(*dvb), GFP_KERNEL);
 	if (!dvb)
 		return -ENOMEM;
 
-- 
2.14.1

