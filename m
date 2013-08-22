From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2013 17:07:17 +0000
Subject: [patch] [media] snd_tea575x: precedence bug in fmr2_tea575x_get_pins()
Message-Id: <20130822170717.GA21447@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "|" operation has higher precedence that "?:" so this couldn't
return both flags set at once as intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.

diff --git a/drivers/media/radio/radio-sf16fmr2.c b/drivers/media/radio/radio-sf16fmr2.c
index 9c09904..72af59d 100644
--- a/drivers/media/radio/radio-sf16fmr2.c
+++ b/drivers/media/radio/radio-sf16fmr2.c
@@ -74,8 +74,8 @@ static u8 fmr2_tea575x_get_pins(struct snd_tea575x *tea)
 	struct fmr2 *fmr2 = tea->private_data;
 	u8 bits = inb(fmr2->io);
 
-	return  (bits & STR_DATA) ? TEA575X_DATA : 0 |
-		(bits & STR_MOST) ? TEA575X_MOST : 0;
+	return  ((bits & STR_DATA) ? TEA575X_DATA : 0) |
+		((bits & STR_MOST) ? TEA575X_MOST : 0);
 }
 
 static void fmr2_tea575x_set_direction(struct snd_tea575x *tea, bool output)
