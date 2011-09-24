From: Zic Rim <zicrim@gmail.com>
Date: Sat, 24 Sep 2011 10:12:56 +0000
Subject: [patch] Add static keyword to drivers/rtc/rtc-pm8xxx.c
Message-Id: <CAMvewQ+upPy6tPy57G8AqWDmLdtES7uF1knvO5mjgWkEJKj5Vw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

M it static like all the other drivers do SIMPLE_DEV_PM_OPS
.pm8xxx_rtc_pm_ops is not used outside this file.

Signed-off-by: Navin P <zicrim@gmail.com>

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index d420e9d..c9c5ee1 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -520,7 +520,7 @@ static int pm8xxx_rtc_suspend(struct device *dev)
 }
 #endif

-SIMPLE_DEV_PM_OPS(pm8xxx_rtc_pm_ops, pm8xxx_rtc_suspend, pm8xxx_rtc_resume);
+static SIMPLE_DEV_PM_OPS(pm8xxx_rtc_pm_ops, pm8xxx_rtc_suspend,
pm8xxx_rtc_resume);

 static struct platform_driver pm8xxx_rtc_driver = {
        .probe          = pm8xxx_rtc_probe,
