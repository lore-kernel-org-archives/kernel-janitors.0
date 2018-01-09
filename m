From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:32:29 +0000
Subject: [PATCH 4/5] misc/pti: Adjust 11 checks for null pointers
Message-Id: <a558f623-724f-6c7b-0cdd-0de3ea41256a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
In-Reply-To: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 18:48:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pti.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 8ae79b286573..11d92c3f43ba 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -246,7 +246,7 @@ static struct pti_masterchannel *get_id(u8 *id_array,
 	int i, j, mask;
 	struct pti_masterchannel *mc = kmalloc(sizeof(*mc), GFP_KERNEL);
 
-	if (mc = NULL)
+	if (!mc)
 		return NULL;
 
 	/* look for a byte with a free bit */
@@ -386,5 +386,5 @@ void pti_writedata(struct pti_masterchannel *mc, u8 *buf, int count)
 	 * API function, thus, all parameters should
 	 * be checked for validity.
 	 */
-	if ((mc != NULL) && (buf != NULL) && (count > 0))
+	if (mc && buf && count > 0)
 		pti_write_to_aperture(mc, buf, count);
@@ -465,7 +465,7 @@ static int pti_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 
 	if (ret = 0) {
 		pti_tty_data = kmalloc(sizeof(*pti_tty_data), GFP_KERNEL);
-		if (pti_tty_data = NULL)
+		if (!pti_tty_data)
 			return -ENOMEM;
 
 		if (idx = PTITTY_MINOR_START)
@@ -473,7 +473,7 @@ static int pti_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 		else
 			pti_tty_data->mc = pti_request_masterchannel(2, NULL);
 
-		if (pti_tty_data->mc = NULL) {
+		if (!pti_tty_data->mc) {
 			kfree(pti_tty_data);
 			return -ENXIO;
 		}
@@ -492,7 +492,8 @@ static int pti_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 static void pti_tty_cleanup(struct tty_struct *tty)
 {
 	struct pti_tty *pti_tty_data = tty->driver_data;
-	if (pti_tty_data = NULL)
+
+	if (!pti_tty_data)
 		return;
 	pti_release_masterchannel(pti_tty_data->mc);
 	kfree(pti_tty_data);
@@ -516,7 +517,8 @@ static int pti_tty_driver_write(struct tty_struct *tty,
 	const unsigned char *buf, int len)
 {
 	struct pti_tty *pti_tty_data = tty->driver_data;
-	if ((pti_tty_data != NULL) && (pti_tty_data->mc != NULL)) {
+
+	if (pti_tty_data && pti_tty_data->mc) {
 		pti_write_to_aperture(pti_tty_data->mc, (u8 *)buf, len);
 		return len;
 	}
@@ -561,7 +563,7 @@ static int pti_char_open(struct inode *inode, struct file *filp)
 	 * Slightly easier to debug if this driver needs debugging.
 	 */
 	mc = pti_request_masterchannel(0, NULL);
-	if (mc = NULL)
+	if (!mc)
 		return -ENOMEM;
 	filp->private_data = mc;
 	return 0;
@@ -820,7 +822,7 @@ static int pti_pci_probe(struct pci_dev *pdev,
 	}
 
 	drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
-	if (drv_data = NULL) {
+	if (!drv_data) {
 		retval = -ENOMEM;
 		goto err_disable_pci;
 	}
@@ -916,7 +918,7 @@ static int __init pti_init(void)
 	/* First register module as tty device */
 
 	pti_tty_driver = alloc_tty_driver(PTITTY_MINOR_NUM);
-	if (pti_tty_driver = NULL) {
+	if (!pti_tty_driver) {
 		pr_err("%s(%d): Memory allocation failed for ptiTTY driver\n",
 			__func__, __LINE__);
 		return -ENOMEM;
-- 
2.15.1

