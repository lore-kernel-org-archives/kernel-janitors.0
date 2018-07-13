From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 15:10:17 +0000
Subject: [PATCH v2] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180713151017.lxbv4eljvd6olziq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"dcbuf" is a union that is "size" bytes large.  We ensure that "nbytes"
is large enough to hold the smallest member of the union, but the
problem is that we might try to use a larger member.  If "nbytes" is
set to sizeof(struct coda_out_hdr) that would cause a problem in
coda_downcall() when we try to access &out->coda_zapdir.CodaFid;

The union is quite small so we can allocate enough space so everything
fits.  The CODA_ALLOC() macro calls kzalloc() which means the extra
memory is just zeroed and it's fine.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I forgot to update CODA_FREE() in my first patch.

diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
index c5234c21b539..7ed698bc5f73 100644
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
@@ -134,7 +134,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 		/* what downcall errors does Venus handle ? */
 		error = coda_downcall(vcp, hdr.opcode, dcbuf);
 
-		CODA_FREE(dcbuf, nbytes);
+		CODA_FREE(dcbuf, size);
 		if (error) {
 			pr_warn("%s: coda_downcall error: %d\n",
 				__func__, error);
