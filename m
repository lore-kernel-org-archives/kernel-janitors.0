From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 20:33:52 +0000
Subject: [PATCH] PM / Domains: Use seq_putc() in pm_genpd_summary_one()
Message-Id: <32253f14-d602-7036-0256-6ca9439fcf23@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 22:26:19 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/power/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index da49a8383dc3..b971fbb404be 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2266,7 +2266,7 @@ static int pm_genpd_summary_one(struct seq_file *s,
 		kfree(kobj_path);
 	}
 
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 exit:
 	genpd_unlock(genpd);
 
-- 
2.12.2

