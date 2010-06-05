From: Richard Weinberger <richard@nod.at>
Date: Sat, 05 Jun 2010 20:58:10 +0000
Subject: [PATCH] char: Remove unused variable
Message-Id: <1275771490-15190-1-git-send-email-richard@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: jirislaby@gmail.com, alan@linux.intel.com, akpm@linux-foundation.org, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Richard Weinberger <richard@nod.at>

card is never used within isicom_open().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/char/isicom.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/char/isicom.c b/drivers/char/isicom.c
index 98310e1..50e4265 100644
--- a/drivers/char/isicom.c
+++ b/drivers/char/isicom.c
@@ -872,7 +872,6 @@ static struct tty_port *isicom_find_port(struct tty_struct *tty)
 static int isicom_open(struct tty_struct *tty, struct file *filp)
 {
 	struct isi_port *port;
-	struct isi_board *card;
 	struct tty_port *tport;
 
 	tport = isicom_find_port(tty);
-- 
1.6.6.1

