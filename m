From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:56:44 +0000
Subject: [PATCH] staging: atomicsp: fix a loop timeout
Message-Id: <20170314075644.GB6274@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

It's a post-op loop so we timeout with "max_wait" set to -1, not 0.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c
index 46cdb0f3f993..49f6d18a068b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c
@@ -418,7 +418,7 @@ void punit_ddr_dvfs_enable(bool enable)
 		}
 	}
 
-	if (max_wait = 0)
+	if (max_wait = -1)
 		pr_info("DDR DVFS, door bell is not cleared within 3ms\n");
 }
 
