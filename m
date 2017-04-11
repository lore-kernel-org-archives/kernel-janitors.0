From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 17:02:42 +0000
Subject: [PATCH 2/2] tty-ehv_bytechan: Fix a typo in two comment lines
Message-Id: <2fe7eb2e-b476-8f68-86d4-6d2c0564c28a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4666b729-217c-ab28-4a3c-25ef703054dd@users.sourceforge.net>
In-Reply-To: <4666b729-217c-ab28-4a3c-25ef703054dd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, trivial@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 11 Apr 2017 18:40:37 +0200

Add a missing character in function descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/ehv_bytechan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
index e17b7c765466..3dcd59cfffe9 100644
--- a/drivers/tty/ehv_bytechan.c
+++ b/drivers/tty/ehv_bytechan.c
@@ -328,7 +328,7 @@ console_initcall(ehv_bc_console_init);
 /******************************** TTY DRIVER ********************************/
 
 /*
- * byte channel receive interupt handler
+ * byte channel receive interrupt handler
  *
  * This ISR is called whenever data is available on a byte channel.
  */
@@ -428,7 +428,7 @@ static void ehv_bc_tx_dequeue(struct ehv_bc_data *bc)
 }
 
 /*
- * byte channel transmit interupt handler
+ * byte channel transmit interrupt handler
  *
  * This ISR is called whenever space becomes available for transmitting
  * characters on a byte channel.
-- 
2.12.2

