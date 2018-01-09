From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:31:17 +0000
Subject: [PATCH 3/5] misc/pti: Improve a size determination in two functions
Message-Id: <0b51421a-4fd6-7ea5-ae23-88b98e7cee48@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
In-Reply-To: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 18:28:44 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pti.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 8292e8098cc8..8ae79b286573 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -243,10 +243,9 @@ static struct pti_masterchannel *get_id(u8 *id_array,
 					int base_id,
 					const char *thread_name)
 {
-	struct pti_masterchannel *mc;
 	int i, j, mask;
+	struct pti_masterchannel *mc = kmalloc(sizeof(*mc), GFP_KERNEL);
 
-	mc = kmalloc(sizeof(struct pti_masterchannel), GFP_KERNEL);
 	if (mc = NULL)
 		return NULL;
 
@@ -465,7 +464,7 @@ static int pti_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 	int ret = tty_standard_install(driver, tty);
 
 	if (ret = 0) {
-		pti_tty_data = kmalloc(sizeof(struct pti_tty), GFP_KERNEL);
+		pti_tty_data = kmalloc(sizeof(*pti_tty_data), GFP_KERNEL);
 		if (pti_tty_data = NULL)
 			return -ENOMEM;
 
-- 
2.15.1

