From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 27 Jan 2013 19:40:40 +0000
Subject: [patch] TTY: synclink, small cleanup in dtr_rts()
Message-Id: <20130127194039.GA18787@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Paul Fulghum <paulkf@microgate.com>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a kind of precedence problem here, but it doesn't affect how
the code works because ->serial_signals is unsigned char.  We want to
clear two flags here.

#define SerialSignal_RTS            0x20     /* Request to Send */
#define SerialSignal_DTR            0x80     /* Data Terminal Ready */

Without the parenthesis then it does:

	info->serial_signals &= 0x5f;

With the parenthesis it does:

	info->serial_signals &= 0xffffff5f;

info->serial_signals is an unsigned char so the two statements are
equivalent, but it's cleaner to add the parenthesis.  In other dtr_rts()
functions the parenthesis are there so this makes it more consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/synclink_cs.c
index 34e52ed..749fc05 100644
--- a/drivers/char/pcmcia/synclink_cs.c
+++ b/drivers/char/pcmcia/synclink_cs.c
@@ -2466,7 +2466,7 @@ static void dtr_rts(struct tty_port *port, int onoff)
 	if (onoff)
 		info->serial_signals |= SerialSignal_RTS + SerialSignal_DTR;
 	else
-		info->serial_signals &= ~SerialSignal_RTS + SerialSignal_DTR;
+		info->serial_signals &= ~(SerialSignal_RTS + SerialSignal_DTR);
 	set_signals(info);
 	spin_unlock_irqrestore(&info->lock,flags);
 }
