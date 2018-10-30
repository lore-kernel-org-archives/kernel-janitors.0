From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:17:20 +0000
Subject: [PATCH] staging: xgifb: clean an indentation issue
Message-Id: <20181030111720.5118-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaud Patard <arnaud.patard@rtp-net.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/xgifb/XGI_main_26.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/xgifb/XGI_main_26.c b/drivers/staging/xgifb/XGI_main_26.c
index eca0b50f0df6..217c6bb82c0d 100644
--- a/drivers/staging/xgifb/XGI_main_26.c
+++ b/drivers/staging/xgifb/XGI_main_26.c
@@ -923,8 +923,9 @@ static int XGIfb_do_set_var(struct fb_var_screeninfo *var, int isactive,
 	if (!htotal || !vtotal) {
 		pr_debug("Invalid 'var' information\n");
 		return -EINVAL;
-	} pr_debug("var->pixclock=%d, htotal=%d, vtotal=%d\n",
-			var->pixclock, htotal, vtotal);
+	}
+	pr_debug("var->pixclock=%d, htotal=%d, vtotal=%d\n",
+		 var->pixclock, htotal, vtotal);
 
 	if (var->pixclock) {
 		drate = 1000000000 / var->pixclock;
-- 
2.19.1
