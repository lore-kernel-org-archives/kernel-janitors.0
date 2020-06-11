From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 15:31:08 +0000
Subject: [PATCH] ttyprintk: remove redundant initialization of variable ret
Message-Id: <20200611153108.927614-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ttyprintk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ttyprintk.c b/drivers/char/ttyprintk.c
index 56db949a7b70..6a0059e508e3 100644
--- a/drivers/char/ttyprintk.c
+++ b/drivers/char/ttyprintk.c
@@ -172,7 +172,7 @@ static struct tty_driver *ttyprintk_driver;
 
 static int __init ttyprintk_init(void)
 {
-	int ret = -ENOMEM;
+	int ret;
 
 	spin_lock_init(&tpk_port.spinlock);
 
-- 
2.27.0.rc0
