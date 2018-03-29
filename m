From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2018 09:14:40 +0000
Subject: [PATCH] ANDROID: binder: re-order some conditions
Message-Id: <20180329091440.GC17927@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It doesn't make any difference to runtime but I've switched these two
checks to make my static checker happy.

The problem is that "buffer->data_size" is user controlled and if it's
less than "sizeo(*hdr)" then that means "offset" can be more than
"buffer->data_size".  It's just cleaner to check it in the other order.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 764b63a5aade..00322b146469 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -2058,8 +2058,8 @@ static size_t binder_validate_object(struct binder_buffer *buffer, u64 offset)
 	struct binder_object_header *hdr;
 	size_t object_size = 0;
 
-	if (offset > buffer->data_size - sizeof(*hdr) ||
-	    buffer->data_size < sizeof(*hdr) ||
+	if (buffer->data_size < sizeof(*hdr) ||
+	    offset > buffer->data_size - sizeof(*hdr) ||
 	    !IS_ALIGNED(offset, sizeof(u32)))
 		return 0;
 
