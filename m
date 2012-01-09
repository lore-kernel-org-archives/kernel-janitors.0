From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:32 +0000
Subject: [PATCH 13/16] Staging: quickstart: Use %u for printing button id
Message-Id: <1326147815-11451-14-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Button id is of unsigned int type.

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 486b973..f830360 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -80,7 +80,7 @@ static ssize_t quickstart_buttons_show(struct device *dev,
 		return snprintf(buf, PAGE_SIZE, "none");
 
 	list_for_each_entry(b, &buttons, list) {
-		count += snprintf(buf + count, PAGE_SIZE - count, "%d\t%s\n",
+		count += snprintf(buf + count, PAGE_SIZE - count, "%u\t%s\n",
 							b->id, b->name);
 
 		if (count = PAGE_SIZE)
-- 
1.7.8.2


