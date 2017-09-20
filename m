From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 17:00:00 +0000
Subject: [PATCH 3/5] [media] s2255drv: Improve two size determinations in s2255_probe()
Message-Id: <4d151c18-662f-aabf-7f03-9c3cbb05b1ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55718a41-d76f-36bf-7197-db92014dcd3c@users.sourceforge.net>
In-Reply-To: <55718a41-d76f-36bf-7197-db92014dcd3c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 16:56:20 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/s2255/s2255drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index aee83bf6fa94..29bc73ad7d8a 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2237,4 +2237,4 @@ static int s2255_probe(struct usb_interface *interface,
 	/* allocate memory for our device state and initialize it to zero */
-	dev = kzalloc(sizeof(struct s2255_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
@@ -2247,4 +2247,4 @@ static int s2255_probe(struct usb_interface *interface,
 	dev->pid = id->idProduct;
-	dev->fw_data = kzalloc(sizeof(struct s2255_fw), GFP_KERNEL);
+	dev->fw_data = kzalloc(sizeof(*dev->fw_data), GFP_KERNEL);
 	if (!dev->fw_data)
 		goto errorFWDATA1;
-- 
2.14.1

