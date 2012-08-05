From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 05 Aug 2012 12:34:26 +0000
Subject: [PATCH] [media] gspca: dubious one-bit signed bitfield
Message-Id: <1344170066-19727-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hdegoede@redhat.com, mchehab@infradead.org
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch changes some signed integers to unsigned because
they are not intended for negative values and sparse
is making noise about it.

Sparse gives eight of these errors:
drivers/media/video/gspca/ov519.c:144:29: error: dubious one-bit signed bitfield

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/media/video/gspca/ov519.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/video/gspca/ov519.c b/drivers/media/video/gspca/ov519.c
index bfc7cef..c1a21bf 100644
--- a/drivers/media/video/gspca/ov519.c
+++ b/drivers/media/video/gspca/ov519.c
@@ -141,14 +141,14 @@ enum sensors {
 
 /* table of the disabled controls */
 struct ctrl_valid {
-	int has_brightness:1;
-	int has_contrast:1;
-	int has_exposure:1;
-	int has_autogain:1;
-	int has_sat:1;
-	int has_hvflip:1;
-	int has_autobright:1;
-	int has_freq:1;
+	unsigned int has_brightness:1;
+	unsigned int has_contrast:1;
+	unsigned int has_exposure:1;
+	unsigned int has_autogain:1;
+	unsigned int has_sat:1;
+	unsigned int has_hvflip:1;
+	unsigned int has_autobright:1;
+	unsigned int has_freq:1;
 };
 
 static const struct ctrl_valid valid_controls[] = {
-- 
1.7.10.4

