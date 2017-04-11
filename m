From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:30:13 +0000
Subject: [PATCH 2/2] tty-goldfish: Adjust five checks for null pointers
Message-Id: <dc16bfba-ba55-c478-aada-7bed4c3ece51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53ab1654-e0ef-1227-cef2-32dbedcdc124@users.sourceforge.net>
In-Reply-To: <53ab1654-e0ef-1227-cef2-32dbedcdc124@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 20:15:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/goldfish.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/goldfish.c b/drivers/tty/goldfish.c
index b92c3312ecd2..a07e5b01c279 100644
--- a/drivers/tty/goldfish.c
+++ b/drivers/tty/goldfish.c
@@ -182,12 +182,12 @@ static int goldfish_tty_create_driver(void)
 
 	goldfish_ttys = kcalloc(goldfish_tty_line_count, sizeof(*goldfish_ttys),
 				GFP_KERNEL);
-	if (goldfish_ttys = NULL) {
+	if (!goldfish_ttys) {
 		ret = -ENOMEM;
 		goto err_alloc_goldfish_ttys_failed;
 	}
 	tty = alloc_tty_driver(goldfish_tty_line_count);
-	if (tty = NULL) {
+	if (!tty) {
 		ret = -ENOMEM;
 		goto err_alloc_tty_driver_failed;
 	}
@@ -235,15 +235,15 @@ static int goldfish_tty_probe(struct platform_device *pdev)
 	unsigned int line;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (r = NULL)
+	if (!r)
 		return -EINVAL;
 
 	base = ioremap(r->start, 0x1000);
-	if (base = NULL)
+	if (!base)
 		pr_err("goldfish_tty: unable to remap base\n");
 
 	r = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (r = NULL)
+	if (!r)
 		goto err_unmap;
 
 	irq = r->start;
-- 
2.12.2

