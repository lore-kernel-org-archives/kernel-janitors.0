From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 13:32:45 +0000
Subject: [patch] tty: save newly allocated buffer in tty_free_termios()
Message-Id: <20120720133245.GD22245@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We're trying to save the termios state and we need to allocate a buffer
to do it.  Smatch complains that the buffer is leaked at the end of the
function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index be18d60..58a1bdd 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -1450,6 +1450,7 @@ void tty_free_termios(struct tty_struct *tty)
 			pr_warn("tty: no memory to save termios state.\n");
 			return;
 		}
+		tty->driver->termios[idx] = tp;
 	}
 	*tp = tty->termios;
 }
