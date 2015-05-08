From: Mike Shuey <shuey@purdue.edu>
Date: Fri, 08 May 2015 12:00:58 +0000
Subject: [PATCH v2 6/8] staging: lustre: lnet: lnet: Module is LNet, not Portals
Message-Id: <1431086460-22455-14-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
In-Reply-To: <1431086460-22455-9-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

Fix the module version to match upstream development.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/module.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/module.c b/drivers/staging/lustre/lnet/lnet/module.c
index ff3f831..f73d644 100644
--- a/drivers/staging/lustre/lnet/lnet/module.c
+++ b/drivers/staging/lustre/lnet/lnet/module.c
@@ -147,7 +147,7 @@ fini_lnet(void)
 }
 
 MODULE_AUTHOR("Peter J. Braam <braam@clusterfs.com>");
-MODULE_DESCRIPTION("Portals v3.1");
+MODULE_DESCRIPTION("LNet v3.1");
 MODULE_LICENSE("GPL");
 MODULE_VERSION("1.0.0");
 
-- 
1.7.1

