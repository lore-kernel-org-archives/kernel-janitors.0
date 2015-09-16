From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 06:42:25 +0000
Subject: [patch v2] IB/hfi1: info leak in get_ctxt_info()
Message-Id: <20150916064225.GI5004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1509160824370.2049@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1509160824370.2049@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath@intel.com>
Cc: devel@driverdev.osuosl.org, linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

The cinfo struct has a hole after the last struct member so we need to
zero it out.  Otherwise we disclose some uninitialized stack data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: typo in changelog

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

