From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 22:22:54 +0000
Subject: [PATCH v2 17/17] Staging: quickstart: Bump driver version to 1.04
Message-Id: <1326320574-11220-20-git-send-email-szymon@janc.net.pl>
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
index b5ce1cc..dd60796 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -23,7 +23,7 @@
  *
  */
 
-#define QUICKSTART_VERSION "1.03"
+#define QUICKSTART_VERSION "1.04"
 
 #define pr_fmt(fmt) KBUILD_MODNAME": " fmt
 
-- 
1.7.8.3


