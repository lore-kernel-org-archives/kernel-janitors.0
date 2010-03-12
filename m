From: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 12 Mar 2010 07:03:51 +0000
Subject: [PATCH 3/3] drivers/rtc: init dynamic bin_attribute structures
Message-Id: <1268377431-11671-4-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Wolfram Sang <w.sang@pengutronix.de>, Paul Gortmaker <p_gortmaker@yahoo.com>, Alessandro Zummo <a.zummo@towertech.it>, "Eric W. Biederman" <ebiederm@xmission.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this requirement.
Found with coccinelle, but fixed manually. Compile tested on X86 where
possible.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Paul Gortmaker <p_gortmaker@yahoo.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Eric W. Biederman <ebiederm@xmission.com>
---
 drivers/rtc/rtc-ds1742.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index a127336..cad9ceb 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -184,6 +184,7 @@ static int __devinit ds1742_rtc_probe(struct platform_device *pdev)
 	pdata->size_nvram = pdata->size - RTC_SIZE;
 	pdata->ioaddr_rtc = ioaddr + pdata->size_nvram;
 
+	sysfs_bin_attr_init(&pdata->nvram_attr);
 	pdata->nvram_attr.attr.name = "nvram";
 	pdata->nvram_attr.attr.mode = S_IRUGO | S_IWUSR;
 	pdata->nvram_attr.read = ds1742_nvram_read;
-- 
1.7.0

