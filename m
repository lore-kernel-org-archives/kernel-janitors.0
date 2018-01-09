From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:29:44 +0000
Subject: [PATCH 2/5] misc/pti: Fix a typo in five comment lines
Message-Id: <0691f343-8160-02dd-0cac-83250bac4de4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
In-Reply-To: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 18:18:15 +0100

Adjust words in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pti.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 92a1a20839c8..8292e8098cc8 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -378,7 +378,7 @@ EXPORT_SYMBOL_GPL(pti_release_masterchannel);
  * @buf:   Trace debuging data to write to the PTI HW.
  *         Null value will return with no write occurring.
  * @count: Size of buf. Value of 0 or a negative number will
- *         return with no write occuring.
+ *         return with no write occurring.
  */
 void pti_writedata(struct pti_masterchannel *mc, u8 *buf, int count)
 {
@@ -403,7 +403,7 @@ EXPORT_SYMBOL_GPL(pti_writedata);
  * ID to the PTI device via tty device.
  *
  * @tty: tty interface.
- * @filp: filp interface pased to tty_port_open() call.
+ * @filp: filp interface passed to tty_port_open() call.
  *
  * Returns:
  *	int, 0 for success
@@ -435,7 +435,7 @@ static int pti_tty_driver_open(struct tty_struct *tty, struct file *filp)
  * master, channel aperture ID to the PTI device via tty device.
  *
  * @tty: tty interface.
- * @filp: filp interface pased to tty_port_close() call.
+ * @filp: filp interface passed to tty_port_close() call.
  *
  * The main purpose of using the tty device interface is to route
  * syslog daemon messages to the PTI HW and out of the handheld platform
@@ -572,7 +572,7 @@ static int pti_char_open(struct inode *inode, struct file *filp)
  * pti_char_release()-  Close a char channel to the PTI device. Part
  * of the misc device implementation.
  *
- * @inode: Not used in this implementaiton.
+ * @inode: Not used in this implementation.
  * @filp:  Contains private_data that contains the master, channel
  *         ID to be released by the PTI device.
  *
@@ -668,7 +668,7 @@ static struct miscdevice pti_char_driver = {
 /**
  * pti_console_write()-  Write to the console that has been acquired.
  *
- * @c:   Not used in this implementaiton.
+ * @c:   Not used in this implementation.
  * @buf: Data to be written.
  * @len: Length of buf.
  */
-- 
2.15.1

