From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Feb 2008 20:45:31 +0000
Subject: [PATCH 7/9] drivers/serial/m32r_sio.c: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0802262144320.18200@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: takata@linux-m32r.org, linux-m32r@ml.linux-m32r.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
involved converting !x & y to !(x & y).  The code below shows the same
pattern, and thus should perhaps be fixed in the same way.

This is not tested and clearly changes the semantics, so it is only
something to consider.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1,E2; @@
(
  !E1 & !E2
|
- !E1 & E2
+ !(E1 & E2)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/serial/m32r_sio.c b/drivers/serial/m32r_sio.c
--- a/drivers/serial/m32r_sio.c 2007-10-22 11:25:24.000000000 +0200
+++ b/drivers/serial/m32r_sio.c 2008-02-26 08:12:18.000000000 +0100
@@ -421,7 +421,7 @@ static void transmit_chars(struct uart_s
 		up->port.icount.tx++;
 		if (uart_circ_empty(xmit))
 			break;
-		while (!serial_in(up, UART_LSR) & UART_LSR_THRE);
+		while (!(serial_in(up, UART_LSR) & UART_LSR_THRE));
 
 	} while (--count > 0);
 
