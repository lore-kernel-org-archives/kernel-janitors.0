From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Apr 2013 06:23:39 +0000
Subject: [patch 1/2 -next] dma-buf: double unlock in debugfs code
Message-Id: <20130411062339.GA7603@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Airlie <airlied@redhat.com>, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

We unlock here when we failed to take the lock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is in linux-next, and I think the debugfs code is only in Sumit's
tree.

diff --git a/drivers/base/dma-buf.c b/drivers/base/dma-buf.c
index 466476f..174cd2c 100644
--- a/drivers/base/dma-buf.c
+++ b/drivers/base/dma-buf.c
@@ -593,7 +593,7 @@ static int dma_buf_describe(struct seq_file *s)
 		if (ret) {
 			seq_printf(s,
 				  "\tERROR locking buffer object: skipping\n");
-			goto skip_buffer;
+			continue;
 		}
 
 		seq_printf(s, "\t");
@@ -618,7 +618,6 @@ static int dma_buf_describe(struct seq_file *s)
 
 		count++;
 		size += buf_obj->size;
-skip_buffer:
 		mutex_unlock(&buf_obj->lock);
 	}

