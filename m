From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Nov 2010 05:36:57 +0000
Subject: [patch] [media] saa7164: poll mask set incorrectly
Message-Id: <20101124053656.GO1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Steven Toth <stoth@kernellabs.com>, Gavin Hurlbut <gjhurlbu@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

list_first_entry() always returns non-null here.  I think the intent was
to test whether there were any entries in the used list.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have this hardware so I can't test this.  Please check
carefully.

diff --git a/drivers/media/video/saa7164/saa7164-encoder.c b/drivers/media/video/saa7164/saa7164-encoder.c
index cbb53d0..f4b8ac7 100644
--- a/drivers/media/video/saa7164/saa7164-encoder.c
+++ b/drivers/media/video/saa7164/saa7164-encoder.c
@@ -1238,7 +1238,6 @@ static unsigned int fops_poll(struct file *file, poll_table *wait)
 {
 	struct saa7164_encoder_fh *fh = (struct saa7164_encoder_fh *)file->private_data;
 	struct saa7164_port *port = fh->port;
-	struct saa7164_user_buffer *ubuf;
 	unsigned int mask = 0;
 
 	port->last_poll_msecs_diff = port->last_poll_msecs;
@@ -1271,10 +1270,7 @@ static unsigned int fops_poll(struct file *file, poll_table *wait)
 	}
 
 	/* Pull the first buffer from the used list */
-	ubuf = list_first_entry(&port->list_buf_used.list,
-		struct saa7164_user_buffer, list);
-
-	if (ubuf)
+	if (!list_empty(&port->list_buf_used.list))
 		mask |= POLLIN | POLLRDNORM;
 
 	return mask;
diff --git a/drivers/media/video/saa7164/saa7164-vbi.c b/drivers/media/video/saa7164/saa7164-vbi.c
index 323c7cd..8025631 100644
--- a/drivers/media/video/saa7164/saa7164-vbi.c
+++ b/drivers/media/video/saa7164/saa7164-vbi.c
@@ -1186,7 +1186,6 @@ static unsigned int fops_poll(struct file *file, poll_table *wait)
 {
 	struct saa7164_vbi_fh *fh = (struct saa7164_vbi_fh *)file->private_data;
 	struct saa7164_port *port = fh->port;
-	struct saa7164_user_buffer *ubuf;
 	unsigned int mask = 0;
 
 	port->last_poll_msecs_diff = port->last_poll_msecs;
@@ -1219,10 +1218,7 @@ static unsigned int fops_poll(struct file *file, poll_table *wait)
 	}
 
 	/* Pull the first buffer from the used list */
-	ubuf = list_first_entry(&port->list_buf_used.list,
-		struct saa7164_user_buffer, list);
-
-	if (ubuf)
+	if (!list_empty(&port->list_buf_used.list))
 		mask |= POLLIN | POLLRDNORM;
 
 	return mask;
