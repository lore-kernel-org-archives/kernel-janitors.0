From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2012 07:16:14 +0000
Subject: [patch] nfs: check for integer overflow in decode_devicenotify_args()
Message-Id: <20120112071614.GC2975@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On 32 bit, if n is too large then "n * sizeof(*args->devs)" could
overflow and args->devs would be smaller than expected.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.  I haven't tested this.  Sorry for that.

diff --git a/fs/nfs/callback_xdr.c b/fs/nfs/callback_xdr.c
index 726e59a..d50b274 100644
--- a/fs/nfs/callback_xdr.c
+++ b/fs/nfs/callback_xdr.c
@@ -305,6 +305,10 @@ __be32 decode_devicenotify_args(struct svc_rqst *rqstp,
 	n = ntohl(*p++);
 	if (n <= 0)
 		goto out;
+	if (n > ULONG_MAX / sizeof(*args->devs)) {
+		status = htonl(NFS4ERR_BADXDR);
+		goto out;
+	}
 
 	args->devs = kmalloc(n * sizeof(*args->devs), GFP_KERNEL);
 	if (!args->devs) {
