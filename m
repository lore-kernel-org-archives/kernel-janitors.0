From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:07:07 +0000
Subject: [PATCH 08/11] virtio_console: Rename jump labels in port_fops_write()
Message-Id: <ff122e8a-0789-a5e8-4d9f-6fd342bfd82d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
In-Reply-To: <020438b9-a7f8-0050-04c1-43382ba60b75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: virtualization@lists.linux-foundation.org, Amit Shah <amit.shah@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 15:07:42 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index d8681d9..babc812 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -842,7 +842,7 @@ static ssize_t port_fops_write(struct file *filp, const char __user *ubuf,
 	ret = copy_from_user(buf->buf, ubuf, count);
 	if (ret) {
 		ret = -EFAULT;
-		goto free_buf;
+		goto free_buffer;
 	}
 
 	/*
@@ -857,11 +857,10 @@ static ssize_t port_fops_write(struct file *filp, const char __user *ubuf,
 	ret = __send_to_port(port, sg, 1, count, buf, nonblock);
 
 	if (nonblock && ret > 0)
-		goto out;
-
-free_buf:
+		goto exit;
+ free_buffer:
 	free_buf(buf, true);
-out:
+ exit:
 	return ret;
 }
 
-- 
2.10.0

