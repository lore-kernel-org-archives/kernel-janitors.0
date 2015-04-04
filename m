From: Andreas Theodosiou <andreasabu@gmail.com>
Date: Sat, 04 Apr 2015 00:23:19 +0000
Subject: [PATCH] staging: fbtft: 80 characters per line in fb_ili9163.c
Message-Id: <1428106999-10067-1-git-send-email-andreasabu@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas.petazzoni@free-electrons.com, noralf@tronnes.org, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andreas Theodosiou <andreasabu@gmail.com>

This is a patch to the fb_ili9163.c file that inserts a line break in
line #92 to make the line fit into the 80 character limit.

Signed-off-by: Andreas Theodosiou <andreasabu@gmail.com>
---
 drivers/staging/fbtft/fb_ili9163.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/staging/fbtft/fb_ili9163.c
index ed92a64..fc7568b 100644
--- a/drivers/staging/fbtft/fb_ili9163.c
+++ b/drivers/staging/fbtft/fb_ili9163.c
@@ -89,7 +89,8 @@
 
 /*
 This display:
-http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-Color-TFT-LCD-Display-Module-/271422122271
+http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-
+Color-TFT-LCD-Display-Module-/271422122271
 This particular display has a design error! The controller has 3 pins to
 configure to constrain the memory and resolution to a fixed dimension (in
 that case 128x128) but they leaved those pins configured for 128x160 so
-- 
2.3.5

