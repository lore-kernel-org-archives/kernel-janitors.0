From: Julia Lawall <julia@diku.dk>
Date: Wed, 02 Feb 2011 17:56:23 +0000
Subject: [PATCH] drivers/char/specialix.c: Convert func_enter to func_exit
Message-Id: <1296669383-4386-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roger Wolff <R.E.Wolff@BitWizard.nl>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Convert calls to func_enter on leaving a function to func_exit.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- func_enter();
+ func_exit();
  return...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/specialix.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -u -p a/drivers/char/specialix.c b/drivers/char/specialix.c
--- a/drivers/char/specialix.c
+++ b/drivers/char/specialix.c
@@ -1416,7 +1416,7 @@ static int sx_open(struct tty_struct *tt
 				 board, bp, port, SX_PORT(tty->index));
 
 	if (sx_paranoia_check(port, tty->name, "sx_open")) {
-		func_enter();
+		func_exit();
 		return -ENODEV;
 	}
 
@@ -1435,13 +1435,13 @@ static int sx_open(struct tty_struct *tt
 
 	error = sx_setup_port(bp, port);
 	if (error) {
-		func_enter();
+		func_exit();
 		return error;
 	}
 
 	error = block_til_ready(tty, filp, port);
 	if (error) {
-		func_enter();
+		func_exit();
 		return error;
 	}
 
@@ -1860,7 +1860,7 @@ static int sx_set_serial_info(struct spe
 	func_enter();
 
 	if (copy_from_user(&tmp, newinfo, sizeof(tmp))) {
-		func_enter();
+		func_exit();
 		return -EFAULT;
 	}
 

