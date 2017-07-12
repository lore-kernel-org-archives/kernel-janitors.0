From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:26:34 +0000
Subject: [PATCH] dm bufio: Fix error code in dm_bufio_write_dirty_buffers()
Message-Id: <20170712072634.qtm4tq7xlnp572hs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com, Shaohua Li <shli@kernel.org>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be returning normal negative error codes here.  The "a"
variables comes from &c->async_write_error which is a blk_status_t
converted to a regular error code.

In the current code, the blk_status_t gets propogated back to
pool_create() and eventually results in an Oops.

Fixes: 4e4cbee93d56 ("block: switch bios to blk_status_t")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 850ff6c67994..44f4a8ac95bd 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1258,8 +1258,7 @@ EXPORT_SYMBOL_GPL(dm_bufio_write_dirty_buffers_async);
  */
 int dm_bufio_write_dirty_buffers(struct dm_bufio_client *c)
 {
-	blk_status_t a;
-	int f;
+	int a, f;
 	unsigned long buffers_processed = 0;
 	struct dm_buffer *b, *tmp;
 
