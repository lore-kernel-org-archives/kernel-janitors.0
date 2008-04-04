From: Dan Noe <dpn@isomerica.net>
Date: Fri, 04 Apr 2008 13:21:53 +0000
Subject: [PATCH] cxgb3: Fix __must_check warning from call to sysfs_create_group.
Message-Id: <120731531392-git-send-email-dpn@isomerica.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Dan Noe <dpn@isomerica.net>

Fix the warning:
drivers/net/cxgb3/cxgb3_main.c: In function ‘offload_open’:
drivers/net/cxgb3/cxgb3_main.c:936: warning: ignoring return value of
 ‘sysfs_create_group’, declared with attribute warn_unused_result

Now the return value is checked; if sysfs_create_group() returns failure,
a warning is printed using dev_dbg, and the code continues as before.  Use
of dev_dbg ensures printk is not needlessly included unless desired for
debugging.  The original driver code chose to ignore failure of
sysfs_create_group, and this has not been changed beyond a warning when
DEBUG is enabled.

Signed-off-by: Dan Noe <dpn@isomerica.net>
---
 drivers/net/cxgb3/cxgb3_main.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Applies against linux-2.6.git.

diff --git a/drivers/net/cxgb3/cxgb3_main.c b/drivers/net/cxgb3/cxgb3_main.c
index fd2e05b..05e5f59 100644
--- a/drivers/net/cxgb3/cxgb3_main.c
+++ b/drivers/net/cxgb3/cxgb3_main.c
@@ -1014,8 +1014,8 @@ static int offload_open(struct net_device *dev)
 		     adapter->port[0]->mtu : 0xffff);
 	init_smt(adapter);
 
-	/* Never mind if the next step fails */
-	sysfs_create_group(&tdev->lldev->dev.kobj, &offload_attr_group);
+	if (sysfs_create_group(&tdev->lldev->dev.kobj, &offload_attr_group))
+		dev_dbg(&dev->dev, "cannot create sysfs group\n");
 
 	/* Call back all registered clients */
 	cxgb3_add_clients(tdev);
-- 
1.5.2.5

