From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Mar 2018 09:31:00 +0000
Subject: [PATCH] media: em28xx-cards: fix em28xx_duplicate_dev()
Message-Id: <20180308093100.GA16525@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Brad Love <brad@nextdimension.cc>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a double sizeof() typo here so we don't duplicate the struct
properly.

Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 6e8247849c4f..6e0e67d23876 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3515,7 +3515,7 @@ static int em28xx_duplicate_dev(struct em28xx *dev)
 		dev->dev_next = NULL;
 		return -ENOMEM;
 	}
-	memcpy(sec_dev, dev, sizeof(sizeof(*sec_dev)));
+	memcpy(sec_dev, dev, sizeof(*sec_dev));
 	/* Check to see next free device and mark as used */
 	do {
 		nr = find_first_zero_bit(em28xx_devused, EM28XX_MAXBOARDS);
