From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:29 +0000
Subject: [PATCH 10/16] Staging: quickstart: Remove unused defines
Message-Id: <1326147815-11451-11-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 17e57c0..9d827f2 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -43,9 +43,6 @@ MODULE_LICENSE("GPL");
 
 #define QUICKSTART_PF_DRIVER_NAME	"quickstart"
 #define QUICKSTART_PF_DEVICE_NAME	"quickstart"
-#define QUICKSTART_PF_DEVATTR_NAME	"pressed_button"
-
-#define QUICKSTART_MAX_BTN_NAME_LEN	16
 
 /*
  * There will be two events:
-- 
1.7.8.2


