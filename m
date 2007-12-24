From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:30:11 +0000
Subject: [PATCH 17/38] drivers/media/dvb: Use time_before, time_before_eq,
Message-Id: <Pine.LNX.4.64.0712241529400.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v4l-dvb-maintainer@linuxtv.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The functions time_before, time_before_eq, time_after, and time_after_eq
are more robust for comparing jiffies against other values.

A simplified version of the semantic patch making this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ change_compare_np @
expression E;
@@

(
- jiffies <= E
+ time_before_eq(jiffies,E)
|
- jiffies >= E
+ time_after_eq(jiffies,E)
|
- jiffies < E
+ time_before(jiffies,E)
|
- jiffies > E
+ time_after(jiffies,E)
)

@ include depends on change_compare_np @
@@

#include <linux/jiffies.h>

@ no_include depends on !include && change_compare_np @
@@

  #include <linux/...>
+ #include <linux/jiffies.h>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -r -u -p a/drivers/media/dvb/frontends/stv0299.c b/drivers/media/dvb/frontends/stv0299.c
--- a/drivers/media/dvb/frontends/stv0299.c	2007-10-22 11:25:10.000000000 +0200
+++ b/drivers/media/dvb/frontends/stv0299.c	2007-12-23 20:30:39.000000000 +0100
@@ -192,7 +192,7 @@ static int stv0299_wait_diseqc_fifo (str
 	dprintk ("%s\n", __FUNCTION__);
 
 	while (stv0299_readreg(state, 0x0a) & 1) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
@@ -209,7 +209,7 @@ static int stv0299_wait_diseqc_idle (str
 	dprintk ("%s\n", __FUNCTION__);
 
 	while ((stv0299_readreg(state, 0x0a) & 3) != 2 ) {
-		if (jiffies - start > timeout) {
+		if (time_after(jiffies, start + timeout)) {
 			dprintk ("%s: timeout!!\n", __FUNCTION__);
 			return -ETIMEDOUT;
 		}
diff -r -u -p a/drivers/media/dvb/frontends/tda8083.c b/drivers/media/dvb/frontends/tda8083.c
--- a/drivers/media/dvb/frontends/tda8083.c	2007-10-22 11:25:10.000000000 +0200
+++ b/drivers/media/dvb/frontends/tda8083.c	2007-12-23 20:30:39.000000000 +0100
@@ -171,7 +171,7 @@ static void tda8083_wait_diseqc_fifo (st
 {
 	unsigned long start = jiffies;
 
-	while (jiffies - start < timeout &&
+	while (time_before(jiffies, start + timeout) &&
 	       !(tda8083_readreg(state, 0x02) & 0x80))
 	{
 		msleep(50);
