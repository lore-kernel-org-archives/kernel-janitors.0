From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:23 +0000
Subject: [PATCH 04/16] Staging: quickstart: Make quickstart_input static
Message-Id: <1326147815-11451-5-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 6617761..7b0deb6 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -71,7 +71,7 @@ static struct quickstart_driver_data {
 	struct quickstart_btn *pressed;
 } quickstart_data;
 
-struct input_dev *quickstart_input;
+static struct input_dev *quickstart_input;
 
 /* Platform driver functions */
 static ssize_t quickstart_buttons_show(struct device *dev,
-- 
1.7.8.2


