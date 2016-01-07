From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jan 2016 09:40:01 +0000
Subject: [patch] MAINTAINERS: fix MIC maintainers entry
Message-Id: <20160107094001.GE27186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

There were some missing colons so we stop parsing the MIC maintainers
entry early.  It means that:

    ./scripts/get_maintainer.pl -f drivers/misc/mic/card/mic_virtio.c

doesn't work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 248828d..070346d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5749,11 +5749,11 @@ F:	include/linux/mic_bus.h
 F:	include/linux/scif.h
 F:	include/uapi/linux/mic_common.h
 F: 	include/uapi/linux/mic_ioctl.h
-F	include/uapi/linux/scif_ioctl.h
+F:	include/uapi/linux/scif_ioctl.h
 F:	drivers/misc/mic/
 F:	drivers/dma/mic_x100_dma.c
 F:	drivers/dma/mic_x100_dma.h
-F	Documentation/mic/
+F:	Documentation/mic/
 
 INTEL PMC/P-Unit IPC DRIVER
 M:	Zha Qipeng<qipeng.zha@intel.com>
