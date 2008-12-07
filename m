From: Julia Lawall <julia@diku.dk>
Date: Sun, 07 Dec 2008 22:15:33 +0000
Subject: [PATCH 2/2] drivers/rtc: correct an error test
Message-Id: <Pine.LNX.4.64.0812072314590.7130@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vapier.adi@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

rtc is clearly does not satisfy IS_ERR at the point where it is tested, so
I have changed the test to consider the just initialized rtc->rtc_dev.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match exists@
expression x, E;
identifier fld;
position p1,p2;
@@

(
x = E;
|
x = E
|
x@p1->fld
... when != x = E
IS_ERR(x@p2)
... when any
)

@other_match exists@
expression match.x, E1, E2;
position match.p1,match.p2;
@@

x = E1
... when != x = E2
    when != x@p1
x@p2

@ script:python depends on !other_match@
p1 << match.p1;
p2 << match.p2;
@@

print "* file %s dereference %s test %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/rtc/rtc-bfin.c              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-bfin.c b/drivers/rtc/rtc-bfin.c
index 34439ce..aafd3e6 100644
--- a/drivers/rtc/rtc-bfin.c
+++ b/drivers/rtc/rtc-bfin.c
@@ -390,7 +390,7 @@ static int __devinit bfin_rtc_probe(struct platform_device *pdev)
 
 	/* Register our RTC with the RTC framework */
 	rtc->rtc_dev = rtc_device_register(pdev->name, dev, &bfin_rtc_ops, THIS_MODULE);
-	if (unlikely(IS_ERR(rtc))) {
+	if (unlikely(IS_ERR(rtc->rtc_dev))) {
 		ret = PTR_ERR(rtc->rtc_dev);
 		goto err_irq;
 	}
