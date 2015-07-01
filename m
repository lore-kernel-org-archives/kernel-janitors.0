From: DingXiang <dingxiang@huawei.com>
Date: Wed, 01 Jul 2015 08:02:17 +0000
Subject: [PATCH] Staging:dgnc:Fix spelling errors in comments
Message-Id: <1435737737-14411-1-git-send-email-dingxiang@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Correct the spelling errors in comments

Signed-off-by: DingXiang <dingxiang@huawei.com>
---
 dgnc_driver.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dgnc_driver.c b/dgnc_driver.c
index 7546aff..1b0005a 100644
--- a/dgnc_driver.c
+++ b/dgnc_driver.c
@@ -216,12 +216,12 @@ static int dgnc_start(void)
 	unsigned long flags;
 	struct device *dev;
 
-	/* make sure that the globals are init'd before we do anything else */
+	/* make sure that the globals are init'ed before we do anything else */
 	dgnc_init_globals();
 
 	/*
 	 * Register our base character device into the kernel.
-	 * This allows the download daemon to connect to the downld device
+	 * This allows the download daemon to connect to the download device
 	 * before any of the boards are init'ed.
 	 *
 	 * Register management/dpa devices
-- 
1.7.1

