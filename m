From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Feb 2012 07:30:25 +0000
Subject: [patch] hso: memsetting wrong data in hso_get_count()
Message-Id: <20120222073024.GA7389@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Dumon <j.dumon@option.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

The intent was to clear out the icount struct here, but we accidentally
clear stack memory instead.  It probably will lead to a NULL dereference
right away.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 304fe78..e1324b4 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -1632,7 +1632,7 @@ static int hso_get_count(struct tty_struct *tty,
 	struct hso_serial *serial = get_serial_by_tty(tty);
 	struct hso_tiocmget  *tiocmget = serial->tiocmget;
 
-	memset(&icount, 0, sizeof(struct serial_icounter_struct));
+	memset(icount, 0, sizeof(struct serial_icounter_struct));
 
 	if (!tiocmget)
 		 return -ENOENT;
