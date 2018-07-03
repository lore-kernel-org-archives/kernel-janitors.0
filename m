From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 07:04:00 +0000
Subject: [PATCH] eeprom: idt_89hpesx: remove redundant variable csrval_len
Message-Id: <20180703070400.28165-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable csrval_len is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'csrval_len' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/eeprom/idt_89hpesx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 59dc24bb70ec..119eb05a5a91 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -938,7 +938,7 @@ static ssize_t idt_dbgfs_csr_write(struct file *filep, const char __user *ubuf,
 {
 	struct idt_89hpesx_dev *pdev = filep->private_data;
 	char *colon_ch, *csraddr_str, *csrval_str;
-	int ret, csraddr_len, csrval_len;
+	int ret, csraddr_len;
 	u32 csraddr, csrval;
 	char *buf;
 
@@ -974,12 +974,10 @@ static ssize_t idt_dbgfs_csr_write(struct file *filep, const char __user *ubuf,
 		csraddr_str[csraddr_len] = '\0';
 		/* Register value must follow the colon */
 		csrval_str = colon_ch + 1;
-		csrval_len = strnlen(csrval_str, count - csraddr_len);
 	} else /* if (str_colon = NULL) */ {
 		csraddr_str = (char *)buf; /* Just to shut warning up */
 		csraddr_len = strnlen(csraddr_str, count);
 		csrval_str = NULL;
-		csrval_len = 0;
 	}
 
 	/* Convert CSR address to u32 value */
-- 
2.17.1

