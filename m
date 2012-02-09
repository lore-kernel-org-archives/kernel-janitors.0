From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Feb 2012 10:44:33 +0000
Subject: [patch] relay: prevent integer overflow in relay_open()
Message-Id: <20120209104433.GA5540@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <4F323388.7040902@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"subbuf_size" and "n_subbufs" come from the user and they need to be
capped to prevent an integer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/relay.c b/kernel/relay.c
index 4335e1d..ab56a17 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -164,10 +164,14 @@ depopulate:
  */
 static struct rchan_buf *relay_create_buf(struct rchan *chan)
 {
-	struct rchan_buf *buf = kzalloc(sizeof(struct rchan_buf), GFP_KERNEL);
-	if (!buf)
+	struct rchan_buf *buf;
+
+	if (chan->n_subbufs > UINT_MAX / sizeof(size_t *))
 		return NULL;
 
+	buf = kzalloc(sizeof(struct rchan_buf), GFP_KERNEL);
+	if (!buf)
+		return NULL;
 	buf->padding = kmalloc(chan->n_subbufs * sizeof(size_t *), GFP_KERNEL);
 	if (!buf->padding)
 		goto free_buf;
@@ -574,6 +578,8 @@ struct rchan *relay_open(const char *base_filename,
 
 	if (!(subbuf_size && n_subbufs))
 		return NULL;
+	if (subbuf_size > UINT_MAX / n_subbufs)
+		return NULL;
 
 	chan = kzalloc(sizeof(struct rchan), GFP_KERNEL);
 	if (!chan)
