From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:47:42 +0000
Subject: [patch] misc: mic: silence uninitialized variable warning
Message-Id: <20160413064742.GI8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Jacek Lawrynowicz <jacek.lawrynowicz@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikhil Rao <nikhil.rao@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that we still use "mark" even when the
_scif_fence_mark() call fails so it can be uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/scif/scif_fence.c b/drivers/misc/mic/scif/scif_fence.c
index 7f2c96f..cac3bcc 100644
--- a/drivers/misc/mic/scif/scif_fence.c
+++ b/drivers/misc/mic/scif/scif_fence.c
@@ -27,7 +27,8 @@
 void scif_recv_mark(struct scif_dev *scifdev, struct scifmsg *msg)
 {
 	struct scif_endpt *ep = (struct scif_endpt *)msg->payload[0];
-	int mark, err;
+	int mark = 0;
+	int err;
 
 	err = _scif_fence_mark(ep, &mark);
 	if (err)
