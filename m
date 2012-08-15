From: Jonathan Brett <jonbrett.dev@gmail.com>
Date: Wed, 15 Aug 2012 19:47:33 +0000
Subject: [PATCH 2/2] staging: asus_oled add MODULE_VERSION
Message-Id: <1345060053-14917-2-git-send-email-jonbrett.dev@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Moved version string from MODULE_DESCRIPTION to MODULE_VERSION

Signed-off-by: Jonathan Brett <jonbrett.dev@gmail.com>
---
 drivers/staging/asus_oled/asus_oled.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/asus_oled/asus_oled.c b/drivers/staging/asus_oled/asus_oled.c
index 9a8843f..42a5e7a 100644
--- a/drivers/staging/asus_oled/asus_oled.c
+++ b/drivers/staging/asus_oled/asus_oled.c
@@ -55,8 +55,9 @@
 #define USB_DEVICE_ID_ASUS_LCM2     0x175b
 
 MODULE_AUTHOR("Jakub Schmidtke, sjakub@gmail.com");
-MODULE_DESCRIPTION("Asus OLED Driver v" ASUS_OLED_VERSION);
+MODULE_DESCRIPTION("Asus OLED Driver");
 MODULE_LICENSE("GPL");
+MODULE_VERSION(ASUS_OLED_VERSION);
 
 static struct class *oled_class;
 static int oled_num;
-- 
1.7.9.5

