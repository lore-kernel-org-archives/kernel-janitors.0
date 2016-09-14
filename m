From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 14:08:13 +0000
Subject: [PATCH 09/11] virtio_console: Rename a jump label in __send_to_port()
Message-Id: <30bfb090-db1c-6515-2d13-0acd6e67d1c2@users.sourceforge.net>
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
Date: Wed, 14 Sep 2016 15:15:06 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/virtio_console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index babc812..69c6718 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -634,14 +634,14 @@ static ssize_t __send_to_port(struct port *port, struct scatterlist *sg,
 
 	if (err) {
 		in_count = 0;
-		goto done;
+		goto unlock;
 	}
 
 	if (out_vq->num_free = 0)
 		port->outvq_full = true;
 
 	if (nonblock)
-		goto done;
+		goto unlock;
 
 	/*
 	 * Wait till the host acknowledges it pushed out the data we
@@ -655,7 +655,7 @@ static ssize_t __send_to_port(struct port *port, struct scatterlist *sg,
 	while (!virtqueue_get_buf(out_vq, &len)
 		&& !virtqueue_is_broken(out_vq))
 		cpu_relax();
-done:
+ unlock:
 	spin_unlock_irqrestore(&port->outvq_lock, flags);
 
 	port->stats.bytes_sent += in_count;
-- 
2.10.0

