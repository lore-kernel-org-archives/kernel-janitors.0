From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jul 2019 15:03:14 +0000
Subject: [PATCH] tty/isicom: remove redundant assignment to variable word_count
Message-Id: <20190723150314.14513-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable word_count is being assigned a value that is never read before
a return, the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/isicom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/isicom.c b/drivers/tty/isicom.c
index e04a43e89f6b..fc38f96475bf 100644
--- a/drivers/tty/isicom.c
+++ b/drivers/tty/isicom.c
@@ -553,7 +553,6 @@ static irqreturn_t isicom_interrupt(int irq, void *dev_id)
 
 	tty = tty_port_tty_get(&port->port);
 	if (tty = NULL) {
-		word_count = byte_count >> 1;
 		while (byte_count > 1) {
 			inw(base);
 			byte_count -= 2;
-- 
2.20.1
