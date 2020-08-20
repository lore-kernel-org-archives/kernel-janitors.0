From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Aug 2020 07:51:36 +0000
Subject: [PATCH][next] staging: spmi: hisi-spmi-controller: fix spelling mistake "controlller" -> "controller
Message-Id: <20200820075136.186199-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the MODULE_ALIAS, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/hikey9xx/hisi-spmi-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
index 66a0b296e06f..b132b2a5d939 100644
--- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
+++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
@@ -354,4 +354,4 @@ module_exit(spmi_controller_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_VERSION("1.0");
-MODULE_ALIAS("platform:spmi_controlller");
+MODULE_ALIAS("platform:spmi_controller");
-- 
2.27.0
