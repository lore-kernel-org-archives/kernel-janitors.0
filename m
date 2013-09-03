From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Sep 2013 09:02:32 +0000
Subject: [patch] caif: add a sanity check to the tty name
Message-Id: <20130903090232.GA4351@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"tty->name" and "name" are a 64 character buffers.  My static checker
complains because we add the "cf" on the front so it look like we are
copying a 66 character string into a 64 character buffer.

Also if the name is larger than IFNAMSIZ (16) it triggers a BUG_ON()
inside the call to alloc_netdev().

This is all under CAP_SYS_ADMIN so it's not a security fix, it just adds
a little robustness.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
index 34dea95..88a6a58 100644
--- a/drivers/net/caif/caif_serial.c
+++ b/drivers/net/caif/caif_serial.c
@@ -347,7 +347,9 @@ static int ldisc_open(struct tty_struct *tty)
 	/* release devices to avoid name collision */
 	ser_release(NULL);
 
-	sprintf(name, "cf%s", tty->name);
+	result = snprintf(name, sizeof(name), "cf%s", tty->name);
+	if (result >= IFNAMSIZ)
+		return -EINVAL;
 	dev = alloc_netdev(sizeof(*ser), name, caifdev_setup);
 	if (!dev)
 		return -ENOMEM;
