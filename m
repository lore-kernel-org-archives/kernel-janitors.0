From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 20 Aug 2020 08:50:05 +0000
Subject: [PATCH 1/6] staging: wfx/main.h: fix a spelling and grammar mistake
Message-Id: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jerome.pouiller@silabs.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix spelling mistake "extention" => "extension".
And correct the statement in passive-voice by adding "be".

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/wfx/main.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/main.h b/drivers/staging/wfx/main.h
index c59d375dd3ad..2457cb595b0f 100644
--- a/drivers/staging/wfx/main.h
+++ b/drivers/staging/wfx/main.h
@@ -19,7 +19,7 @@ struct wfx_dev;
 struct hwbus_ops;
 
 struct wfx_platform_data {
-	/* Keyset and ".sec" extention will appended to this string */
+	/* Keyset and ".sec" extension will be appended to this string */
 	const char *file_fw;
 	const char *file_pds;
 	struct gpio_desc *gpio_wakeup;
-- 
2.17.1
