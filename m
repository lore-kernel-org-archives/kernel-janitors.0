From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:37:06 +0000
Subject: [PATCH 12/15] ptp: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RO for read only attributes.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/ptp/ptp_sysfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 302e626..53d4395 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -28,7 +28,7 @@ static ssize_t clock_name_show(struct device *dev,
 	struct ptp_clock *ptp = dev_get_drvdata(dev);
 	return snprintf(page, PAGE_SIZE-1, "%s\n", ptp->info->name);
 }
-static DEVICE_ATTR(clock_name, 0444, clock_name_show, NULL);
+static DEVICE_ATTR_RO(clock_name);
 
 #define PTP_SHOW_INT(name, var)						\
 static ssize_t var##_show(struct device *dev,				\

