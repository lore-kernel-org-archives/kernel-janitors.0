From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Jun 2018 13:19:39 +0000
Subject: [PATCH] firmware-gsmi: make structure gsmi_dev static
Message-Id: <20180601131939.4959-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure gsmi_dev is local to the source and does not need to be
in global scope, so make it static.

Cleans up sparse warning:
drivers/firmware/google/gsmi.c:96:3: warning: symbol 'gsmi_dev' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/firmware/google/gsmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index c8f169bf2e27..734146eec1b9 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -84,7 +84,7 @@ struct gsmi_buf {
 	u32 address;			/* physical address of buffer */
 };
 
-struct gsmi_device {
+static struct gsmi_device {
 	struct platform_device *pdev;	/* platform device */
 	struct gsmi_buf *name_buf;	/* variable name buffer */
 	struct gsmi_buf *data_buf;	/* generic data buffer */
-- 
2.17.0

