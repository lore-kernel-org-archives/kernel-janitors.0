From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:11:19 +0000
Subject: [patch] dsp56k: prevent a harmless underflow
Message-Id: <20160713101119.GF29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a mistake here where we don't allow "len" to be zero but we
allow negative lengths.  It's basically harmless in this case, but the
underflow makes my static checker complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/dsp56k.c b/drivers/char/dsp56k.c
index 8bf70e8..50aa9ba 100644
--- a/drivers/char/dsp56k.c
+++ b/drivers/char/dsp56k.c
@@ -325,7 +325,7 @@ static long dsp56k_ioctl(struct file *file, unsigned int cmd,
 			if(get_user(bin, &binary->bin) < 0)
 				return -EFAULT;
 		
-			if (len = 0) {
+			if (len <= 0) {
 				return -EINVAL;      /* nothing to upload?!? */
 			}
 			if (len > DSP56K_MAX_BINARY_LENGTH) {
