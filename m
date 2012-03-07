From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Mar 2012 10:05:00 +0000
Subject: [patch] tty: moxa: fix bit test in moxa_start()
Message-Id: <20120307100500.GD25452@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to be doing a shift before the comparison instead of
just doing a bitwise AND directly.  The current code means the start()
just returns without doing anything.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index d15a071..0174d2d 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -1331,7 +1331,7 @@ static void moxa_start(struct tty_struct *tty)
 	if (ch = NULL)
 		return;
 
-	if (!(ch->statusflags & TXSTOPPED))
+	if (!test_bit(TXSTOPPED, &ch->statusflags))
 		return;
 
 	MoxaPortTxEnable(ch);
