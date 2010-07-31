From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 17:40:07 +0000
Subject: [PATCH 7/7] usb: adutux: fix misuse of return value of copy_to_user()
Message-Id: <1280598008-8605-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Mauro Carvalho Chehab <mchehab@redhat.com>, Joe Perches <joe@perches.com>, =?UTF-8?q?N=C3=A9meth=20M=C3=A1rton?= <nm127@freemail.hu>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

copy_to_user() returns number of not copied bytes, not error code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/misc/adutux.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index d240de0..801324a 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -439,7 +439,7 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 			/* drain secondary buffer */
 			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
 			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
-			if (i < 0) {
+			if (i) {
 				retval = -EFAULT;
 				goto exit;
 			}
-- 
1.7.0.4

