From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 11:56:56 +0000
Subject: [PATCH] tty: n_gsm: remove redundant pointer gsm
Message-Id: <20171107115656.23272-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer gsm is assigned a value that is never read, hence it is
redundant and can be removed. Cleans up clang warning:

drivers/tty/n_gsm.c:2979:2: warning: Value stored to 'gsm' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/n_gsm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
index 33530d8cb81d..e56426c91416 100644
--- a/drivers/tty/n_gsm.c
+++ b/drivers/tty/n_gsm.c
@@ -2967,7 +2967,6 @@ static int gsmtty_open(struct tty_struct *tty, struct file *filp)
 static void gsmtty_close(struct tty_struct *tty, struct file *filp)
 {
 	struct gsm_dlci *dlci = tty->driver_data;
-	struct gsm_mux *gsm;
 
 	if (dlci = NULL)
 		return;
@@ -2976,7 +2975,6 @@ static void gsmtty_close(struct tty_struct *tty, struct file *filp)
 	mutex_lock(&dlci->mutex);
 	gsm_destroy_network(dlci);
 	mutex_unlock(&dlci->mutex);
-	gsm = dlci->gsm;
 	if (tty_port_close_start(&dlci->port, tty, filp) = 0)
 		return;
 	gsm_dlci_begin_close(dlci);
-- 
2.14.1

