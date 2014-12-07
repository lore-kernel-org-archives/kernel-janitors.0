From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:20:48 +0000
Subject: [PATCH 6/20] TTY: fix misspelling of current function in string
Message-Id: <1417980062-25151-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org

Replace the last argument of serial_paranoia_check by the actual function
name.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/tty/amiserial.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index d9f85f9..b2d7600 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -931,7 +931,7 @@ static void rs_send_xchar(struct tty_struct *tty, char ch)
 	struct serial_state *info = tty->driver_data;
         unsigned long flags;
 
-	if (serial_paranoia_check(info, tty->name, "rs_send_char"))
+	if (serial_paranoia_check(info, tty->name, "rs_send_xchar"))
 		return;
 
 	info->x_char = ch;

