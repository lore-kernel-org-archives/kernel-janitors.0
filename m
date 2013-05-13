From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 May 2013 15:00:42 +0000
Subject: [patch] MAINTAINERS: update NVM EXPRESS DRIVER file list
Message-Id: <20130513150042.GB21239@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <100D68C7BA14664A8938383216E40DE027F80EAB@fmsmsx111.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There isn't an nvme.c file any more.  It has been split into multiple
files.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f190f5..97ec343 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5747,7 +5747,7 @@ M:	Matthew Wilcox <willy@linux.intel.com>
 L:	linux-nvme@lists.infradead.org
 T:	git git://git.infradead.org/users/willy/linux-nvme.git
 S:	Supported
-F:	drivers/block/nvme.c
+F:	drivers/block/nvme*
 F:	include/linux/nvme.h
 
 OMAP SUPPORT
