From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Feb 2010 07:18:07 +0000
Subject: [patch] splice: comparing unsigned int < 0
Message-Id: <20100225071807.GB4912@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Aravind Srinivasan <raa.aars@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" needs to be signed or the error handling for splice_to_pipe() won't work
correctly.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/relay.c b/kernel/relay.c
index c705a41..3d97f28 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -1215,14 +1215,14 @@ static void relay_page_release(struct splice_pipe_desc *spd, unsigned int i)
 /*
  *	subbuf_splice_actor - splice up to one subbuf's worth of data
  */
-static int subbuf_splice_actor(struct file *in,
+static ssize_t subbuf_splice_actor(struct file *in,
 			       loff_t *ppos,
 			       struct pipe_inode_info *pipe,
 			       size_t len,
 			       unsigned int flags,
 			       int *nonpad_ret)
 {
-	unsigned int pidx, poff, total_len, subbuf_pages, nr_pages, ret;
+	unsigned int pidx, poff, total_len, subbuf_pages, nr_pages;
 	struct rchan_buf *rbuf = in->private_data;
 	unsigned int subbuf_size = rbuf->chan->subbuf_size;
 	uint64_t pos = (uint64_t) *ppos;
@@ -1241,6 +1241,7 @@ static int subbuf_splice_actor(struct file *in,
 		.ops = &relay_pipe_buf_ops,
 		.spd_release = relay_page_release,
 	};
+	ssize_t ret;
 
 	if (rbuf->subbufs_produced = rbuf->subbufs_consumed)
 		return 0;
