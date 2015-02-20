From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Feb 2015 10:53:02 +0000
Subject: [patch] w1: small cleanup in w1_family_notify()
Message-Id: <20150220105302.GB7895@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"sl->family->fops" and "fops" are the same thing, but it's nicer to use
"fops" everywhere.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 181f41c..59f932f 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -649,7 +649,7 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
 		if (fops->remove_slave)
-			sl->family->fops->remove_slave(sl);
+			fops->remove_slave(sl);
 		if (fops->groups)
 			sysfs_remove_groups(&sl->dev.kobj, fops->groups);
 		break;
