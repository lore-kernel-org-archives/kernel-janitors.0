From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 16:42:16 +0000
Subject: [PATCH 14/18] [media] RedRat3: Rename a jump label in redrat3_init_rc_dev()
Message-Id: <172b54fe-559b-44a4-9902-96abece75a7f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
In-Reply-To: <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Oct 2016 15:00:12 +0200

Adjust a jump label according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/rc/redrat3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 74d93dd..055f214 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -890,12 +890,11 @@ static struct rc_dev *redrat3_init_rc_dev(struct redrat3_dev *rr3)
 	ret = rc_register_device(rc);
 	if (ret < 0) {
 		dev_err(rr3->dev, "remote dev registration failed\n");
-		goto out;
+		goto free_device;
 	}
 
 	return rc;
-
-out:
+free_device:
 	rc_free_device(rc);
 	return NULL;
 }
-- 
2.10.1

