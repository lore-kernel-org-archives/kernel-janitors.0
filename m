From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Mar 2018 14:14:51 +0000
Subject: [PATCH] ipmi: use ARRAY_SIZE for poweroff_functions array sizing calculation
Message-Id: <20180302141451.656-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use the ARRAY_SIZE macro on a array poweroff_functions to determine
size of the array. Improvement suggested by Coccinelle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_poweroff.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 07fa366bc8f0..fccb1e9fd3b7 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -519,8 +519,7 @@ static struct poweroff_function poweroff_functions[] = {
 	  .detect		= ipmi_chassis_detect,
 	  .poweroff_func	= ipmi_poweroff_chassis },
 };
-#define NUM_PO_FUNCS (sizeof(poweroff_functions) \
-		      / sizeof(struct poweroff_function))
+#define NUM_PO_FUNCS ARRAY_SIZE(poweroff_functions)
 
 
 /* Called on a powerdown request. */
-- 
2.15.1

