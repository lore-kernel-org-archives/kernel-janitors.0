From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:55:33 +0000
Subject: [PATCH 7/9] drivers/rtc: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281755000.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: p_gortmaker@yahoo.com, a.zummo@towertech.it, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

This code is not executed before ds1307->rtc has been successfully
initialized to the result of calling rtc_device_register.  Thus the test
that ds1307->rtc is not NULL is always true.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@match exists@
expression x, E;
statement S1, S2;
@@

x = rtc_device_register(...)
... when != x = E
(
*  if (x = NULL || ...) S1 else S2
|
*  if (x = NULL && ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/rtc/rtc-ds1307.c            |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 47a93c0..eb99ee4 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -896,8 +896,7 @@ read_rtc:
 	return 0;
 
 exit_irq:
-	if (ds1307->rtc)
-		rtc_device_unregister(ds1307->rtc);
+	rtc_device_unregister(ds1307->rtc);
 exit_free:
 	kfree(ds1307);
 	return err;
