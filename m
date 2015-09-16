From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:21:42 +0000
Subject: [patch] IB/hfi1: info leak in get_ctxt_info()
Message-Id: <20150916062142.GB21542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The cinfo struct has a hole after the last struct member so we need to
zero it out.  Otherwise we don't disclose some uninitialized stack data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rdma/hfi1/file_ops.c b/drivers/staging/rdma/hfi1/file_ops.c
index 4698617..2c43ca5 100644
--- a/drivers/staging/rdma/hfi1/file_ops.c
+++ b/drivers/staging/rdma/hfi1/file_ops.c
@@ -1181,6 +1181,7 @@ static int get_ctxt_info(struct file *fp, void __user *ubase, __u32 len)
 	struct hfi1_filedata *fd = fp->private_data;
 	int ret = 0;
 
+	memset(&cinfo, 0, sizeof(cinfo));
 	ret = hfi1_get_base_kinfo(uctxt, &cinfo);
 	if (ret < 0)
 		goto done;
