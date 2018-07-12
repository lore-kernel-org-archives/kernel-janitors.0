From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 12:32:56 +0000
Subject: [PATCH] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Harkes <jaharkes@cs.cmu.edu>
Cc: coda@cs.cmu.edu, codalist@telemann.coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

"dcbuf" is a union that is "size" bytes large.  We ensure that "nbytes"
is large enough to hold the smallest member of the union, but if we
require a larger union member then then we could access beyond the end
of the allocated memory in coda_downcall().

The union is quite small so we can allocate enough space so everything
fits.  The CODA_ALLOC() macro calls kzalloc() which means the extra
memory is just zeroed and it's fine.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
index c5234c21b539..910d57e576e2 100644
--- a/fs/coda/psdev.c
+++ b/fs/coda/psdev.c
@@ -124,7 +124,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 				hdr.opcode, hdr.unique);
 		        nbytes = size;
 		}
-		CODA_ALLOC(dcbuf, union outputArgs *, nbytes);
+		CODA_ALLOC(dcbuf, union outputArgs *, size);
 		if (copy_from_user(dcbuf, buf, nbytes)) {
 			CODA_FREE(dcbuf, nbytes);
 			retval = -EFAULT;
