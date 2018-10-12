From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:37:17 +0000
Subject: [PATCH] media: em28xx: fix spelling mistake, "Cinnergy" -> "Cinergy"
Message-Id: <20181012153717.22252-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix name of the Hybrid T USB XS em28xx card, should be Cinergy.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/media/v4l-drivers/em28xx-cardlist.rst | 2 +-
 drivers/media/usb/em28xx/em28xx-cards.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/v4l-drivers/em28xx-cardlist.rst b/Documentation/media/v4l-drivers/em28xx-cardlist.rst
index dfe882ca945f..4332da0ac8da 100644
--- a/Documentation/media/v4l-drivers/em28xx-cardlist.rst
+++ b/Documentation/media/v4l-drivers/em28xx-cardlist.rst
@@ -233,7 +233,7 @@ EM28xx cards list
      - em2882
      - eb1a:e323
    * - 55
-     - Terratec Cinnergy Hybrid T USB XS (em2882)
+     - Terratec Cinergy Hybrid T USB XS (em2882)
      - em2882
      - 0ccd:005e, 0ccd:0042
    * - 56
diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 87b887b7604e..1283c7ca9ad5 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -1958,7 +1958,7 @@ const struct em28xx_board em28xx_boards[] = {
 		} },
 	},
 	[EM2882_BOARD_TERRATEC_HYBRID_XS] = {
-		.name         = "Terratec Cinnergy Hybrid T USB XS (em2882)",
+		.name         = "Terratec Cinergy Hybrid T USB XS (em2882)",
 		.tuner_type   = TUNER_XC2028,
 		.tuner_gpio   = default_tuner_gpio,
 		.mts_firmware = 1,
-- 
2.17.1
