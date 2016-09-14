From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:06:05 +0000
Subject: [PATCH 07/11] virtio_console: Rename a jump label in port_fops_splice_write()
Message-Id: <cb8e64ec-5917-ce0d-cc95-845f8ce0fa34@users.sourceforge.net>
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
Date: Wed, 14 Sep 2016 15:01:51 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 99dc659..d8681d9 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -947,17 +947,17 @@ static ssize_t port_fops_splice_write(struct pipe_inode_info *pipe,
 	pipe_lock(pipe);
 	if (!pipe->nrbufs) {
 		ret = 0;
-		goto error_out;
+		goto unlock;
 	}
 
 	ret = wait_port_writable(port, filp->f_flags & O_NONBLOCK);
 	if (ret < 0)
-		goto error_out;
+		goto unlock;
 
 	buf = alloc_buf(port->out_vq, 0, pipe->nrbufs);
 	if (!buf) {
 		ret = -ENOMEM;
-		goto error_out;
+		goto unlock;
 	}
 
 	sgl.n = 0;
@@ -973,8 +973,7 @@ static ssize_t port_fops_splice_write(struct pipe_inode_info *pipe,
 	if (unlikely(ret <= 0))
 		free_buf(buf, true);
 	return ret;
-
-error_out:
+ unlock:
 	pipe_unlock(pipe);
 	return ret;
 }
-- 
2.10.0

