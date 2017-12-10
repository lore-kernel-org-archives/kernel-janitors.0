From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 15:32:31 +0000
Subject: [PATCH 2/2] tty: moxa: Return directly after a failed kcalloc() in moxa_init_board()
Message-Id: <385897ca-48ec-770a-8217-844fe65285f3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d1badbd-8bb1-4109-5c40-1ba1f226a2b1@users.sourceforge.net>
In-Reply-To: <7d1badbd-8bb1-4109-5c40-1ba1f226a2b1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 16:15:41 +0100

* Return directly after a call of the function "kcalloc" failed
  at the beginning.

* Delete the jump label "err" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/moxa.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index a74caf05cf57..571c8456056c 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -835,10 +835,8 @@ static int moxa_init_board(struct moxa_board_conf *brd, struct device *dev)
 
 	brd->ports = kcalloc(MAX_PORTS_PER_BOARD, sizeof(*brd->ports),
 			GFP_KERNEL);
-	if (brd->ports = NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!brd->ports)
+		return -ENOMEM;
 
 	for (i = 0, p = brd->ports; i < MAX_PORTS_PER_BOARD; i++, p++) {
 		tty_port_init(&p->port);
@@ -892,7 +890,6 @@ static int moxa_init_board(struct moxa_board_conf *brd, struct device *dev)
 	for (i = 0; i < MAX_PORTS_PER_BOARD; i++)
 		tty_port_destroy(&brd->ports[i].port);
 	kfree(brd->ports);
-err:
 	return ret;
 }
 
-- 
2.15.1

