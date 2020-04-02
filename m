From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Apr 2020 11:04:11 +0000
Subject: [PATCH][next] rtc: class: remove redundant assignment to variable err
Message-Id: <20200402110411.508534-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 03d6516941a8..7c88d190c51f 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -48,7 +48,7 @@ int rtc_hctosys_ret = -ENODEV;
 
 static void rtc_hctosys(struct rtc_device *rtc)
 {
-	int err = -ENODEV;
+	int err;
 	struct rtc_time tm;
 	struct timespec64 tv64 = {
 		.tv_nsec = NSEC_PER_SEC >> 1,
-- 
2.25.1
