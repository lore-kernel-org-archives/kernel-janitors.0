From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:12:53 +0000
Subject: [PATCH 2/12] drivers/char: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271812340.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dc was tested for NULL at the beginning of the function, in which case the
function returns.  dc does not seem to be updated in the meantime, so the
second test is unnecessary.  I have assumed that the comment, "notify
card" goes with the code below it.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
@@

if (x@ = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/nozomi.c               |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/char/nozomi.c b/drivers/char/nozomi.c
index ec58d8c..9322fec 100644
--- a/drivers/char/nozomi.c
+++ b/drivers/char/nozomi.c
@@ -1675,11 +1675,6 @@ static int ntty_write(struct tty_struct *tty, const unsigned char *buffer,
 	rval = __kfifo_put(port->fifo_ul, (unsigned char *)buffer, count);
 
 	/* notify card */
-	if (unlikely(dc = NULL)) {
-		DBG1("No device context?");
-		goto exit;
-	}
-
 	spin_lock_irqsave(&dc->spin_mutex, flags);
 	/* CTS is only valid on the modem channel */
 	if (port = &(dc->port[PORT_MDM])) {
