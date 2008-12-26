From: Julia Lawall <julia@diku.dk>
Date: Fri, 26 Dec 2008 07:29:19 +0000
Subject: [PATCH 7/7] drivers/usb/serial: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0812260829000.25450@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/).

// <smpl>
@disable is_null@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (E = NULL) S
  f(...,E->fld,...);
- if (E = NULL) S

@@
identifier f;
expression E;
identifier fld;
statement S;
@@

+ if (!E) S
  f(...,E->fld,...);
- if (!E) S
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/serial/usb-serial.c     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 080ade2..45f8ce8 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -509,11 +509,11 @@ static void usb_serial_port_work(struct work_struct *work)
 		container_of(work, struct usb_serial_port, work);
 	struct tty_struct *tty;
 
-	dbg("%s - port %d", __func__, port->number);
-
 	if (!port)
 		return;
 
+	dbg("%s - port %d", __func__, port->number);
+
 	tty = tty_port_tty_get(&port->port);
 	if (!tty)
 		return;
