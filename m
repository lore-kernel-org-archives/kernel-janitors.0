From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 11:02:04 +0000
Subject: [patch] storvsc: fix typo in MODULE_PARM_DESC
Message-Id: <20160108110204.GH32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, "James E.J. Bottomley" <JBottomley@odin.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@linuxdriverproject.org

The module_param is "storvsc_vcpus_per_sub_channel" so we need to use
that for MODULE_PARM_DESC() as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index c41f674..5c6233a 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -390,7 +390,7 @@ module_param(storvsc_ringbuffer_size, int, S_IRUGO);
 MODULE_PARM_DESC(storvsc_ringbuffer_size, "Ring buffer size (bytes)");
 
 module_param(storvsc_vcpus_per_sub_channel, int, S_IRUGO);
-MODULE_PARM_DESC(vcpus_per_sub_channel, "Ratio of VCPUs to subchannels");
+MODULE_PARM_DESC(storvsc_vcpus_per_sub_channel, "Ratio of VCPUs to subchannels");
 /*
  * Timeout in seconds for all devices managed by this driver.
  */
