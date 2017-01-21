From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Jan 2017 05:04:45 +0000
Subject: [patch] orangefs: silence harmless integer overflow warning
Message-Id: <20170121050445.GG15269@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The issue here is that in orangefs_bufmap_alloc() we do:

	bufmap->buffer_index_array 		kzalloc(DIV_ROUND_UP(bufmap->desc_count, BITS_PER_LONG), GFP_KERNEL);

If we choose a bufmap->desc_count like -31 then it means the
DIV_ROUND_UP ends up having an integer overflow.   The result is that
kzalloc() returns the ZERO_SIZE_PTR and there is a static checker
warning.

But this bug is harmless because on the next lines we use ->desc_count
to do a kcalloc().  That has integer overflow checking built in so the
kcalloc() fails and we return an error code.

Anyway, it doesn't make sense to talk about negative sizes and blocking
them silences the static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/orangefs/orangefs-bufmap.c b/fs/orangefs/orangefs-bufmap.c
index 75375e9..6333cbb 100644
--- a/fs/orangefs/orangefs-bufmap.c
+++ b/fs/orangefs/orangefs-bufmap.c
@@ -344,6 +344,11 @@ int orangefs_bufmap_initialize(struct ORANGEFS_dev_map_desc *user_desc)
 		     user_desc->size,
 		     user_desc->count);
 
+	if (user_desc->total_size < 0 ||
+	    user_desc->size < 0 ||
+	    user_desc->count < 0)
+		goto out;
+
 	/*
 	 * sanity check alignment and size of buffer that caller wants to
 	 * work with
