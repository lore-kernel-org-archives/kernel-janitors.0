From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Oct 2017 22:05:25 +0000
Subject: [PATCH] input: synaptics-rmi4: make array rmi_f54_report_type_names static
Message-Id: <20171002220525.11339-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Andrew Duggan <aduggan@synaptics.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array rmi_f54_report_type_names is local to the source and does
not need to be in global scope, so make it static. Also make the array
const char * const

Cleans up sparse warning:
symbol 'rmi_f54_report_type_names' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/rmi4/rmi_f54.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index f5206e2c767e..70f6310f1d15 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -73,7 +73,7 @@ enum rmi_f54_report_type {
 	F54_MAX_REPORT_TYPE,
 };
 
-const char *rmi_f54_report_type_names[] = {
+static const char * const rmi_f54_report_type_names[] = {
 	[F54_REPORT_NONE]		= "Unknown",
 	[F54_8BIT_IMAGE]		= "Normalized 8-Bit Image",
 	[F54_16BIT_IMAGE]		= "Normalized 16-Bit Image",
-- 
2.14.1

