From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 15:13:52 +0000
Subject: [PATCH] drivers/misc: ti-st: remove redundant assignment to variable i
Message-Id: <20191202151352.55139-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable i is being initialized with a value that is never
read and it is being updated later with a new value in a for-loop.
The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/ti-st/st_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/st_core.c b/drivers/misc/ti-st/st_core.c
index 2ae9948a91e1..6255d9b88122 100644
--- a/drivers/misc/ti-st/st_core.c
+++ b/drivers/misc/ti-st/st_core.c
@@ -736,7 +736,7 @@ static int st_tty_open(struct tty_struct *tty)
 
 static void st_tty_close(struct tty_struct *tty)
 {
-	unsigned char i = ST_MAX_CHANNELS;
+	unsigned char i;
 	unsigned long flags = 0;
 	struct	st_data_s *st_gdata = tty->disc_data;
 
-- 
2.24.0
