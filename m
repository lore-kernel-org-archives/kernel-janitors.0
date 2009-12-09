From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:24:09 +0000
Subject: [PATCH 6/12] drivers/rtc: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092023500.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Paul Gortmaker <p_gortmaker@yahoo.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/rtc/rtc-at91sam9.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -161,7 +161,7 @@ static int at91_rtc_readalarm(struct dev
 	if (offset = 0)
 		return -EILSEQ;
 
-	memset(alrm, 0, sizeof(alrm));
+	memset(alrm, 0, sizeof(*alrm));
 	if (alarm != ALARM_DISABLED && offset != 0) {
 		rtc_time_to_tm(offset + alarm, tm);
 
