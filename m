From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:28:37 +0000
Subject: [PATCH 1/2] tty-goldfish: Use kcalloc() in goldfish_tty_create_driver()
Message-Id: <3778b45c-f58c-b38a-51c3-5acb6bc55f68@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53ab1654-e0ef-1227-cef2-32dbedcdc124@users.sourceforge.net>
In-Reply-To: <53ab1654-e0ef-1227-cef2-32dbedcdc124@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 20:00:23 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/goldfish.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/goldfish.c b/drivers/tty/goldfish.c
index 996bd473dd03..b92c3312ecd2 100644
--- a/drivers/tty/goldfish.c
+++ b/drivers/tty/goldfish.c
@@ -180,8 +180,8 @@ static int goldfish_tty_create_driver(void)
 	int ret;
 	struct tty_driver *tty;
 
-	goldfish_ttys = kzalloc(sizeof(*goldfish_ttys) *
-				goldfish_tty_line_count, GFP_KERNEL);
+	goldfish_ttys = kcalloc(goldfish_tty_line_count, sizeof(*goldfish_ttys),
+				GFP_KERNEL);
 	if (goldfish_ttys = NULL) {
 		ret = -ENOMEM;
 		goto err_alloc_goldfish_ttys_failed;
-- 
2.12.2

