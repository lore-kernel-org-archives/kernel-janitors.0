From: Julia Lawall <julia@diku.dk>
Date: Mon, 14 Mar 2011 20:58:31 +0000
Subject: [PATCH] drivers/rtc/rtc-mrst.c: Use release_mem_region after request_mem_region
Message-Id: <1300136425-3311-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: kernel-janitors@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

The memory allocated using request_mem_region should be released using
release_mem_region, not release_region.

The semantic patch that fixes part of this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E1,E2,E3;
@@

request_mem_region(E1,E2,E3)
...
?- release_region(E1,E2)
+ release_mem_region(E1,E2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/rtc/rtc-mrst.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mrst.c b/drivers/rtc/rtc-mrst.c
index b86bc32..558dd7d 100644
--- a/drivers/rtc/rtc-mrst.c
+++ b/drivers/rtc/rtc-mrst.c
@@ -379,7 +379,7 @@ cleanup1:
 	mrst_rtc.dev = NULL;
 	rtc_device_unregister(mrst_rtc.rtc);
 cleanup0:
-	release_region(iomem->start, iomem->end + 1 - iomem->start);
+	release_mem_region(iomem->start, iomem->end + 1 - iomem->start);
 	dev_err(dev, "rtc-mrst: unable to initialise\n");
 	return retval;
 }
@@ -405,7 +405,7 @@ static void __exit rtc_mrst_do_remove(struct device *dev)
 	mrst->rtc = NULL;
 
 	iomem = mrst->iomem;
-	release_region(iomem->start, iomem->end + 1 - iomem->start);
+	release_mem_region(iomem->start, iomem->end + 1 - iomem->start);
 	mrst->iomem = NULL;
 
 	mrst->dev = NULL;

