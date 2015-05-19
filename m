From: Mike Shuey <shuey@purdue.edu>
Date: Tue, 19 May 2015 14:14:33 +0000
Subject: [PATCH v3 2/8] staging: lustre: lnet: dead code - remove lnet_fini_locks
Message-Id: <1432044879-28923-3-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432044879-28923-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432044879-28923-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, Mike Shuey <shuey@purdue.edu>

lnet_fini_locks() does nothing.  Remove.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/api-ni.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 6910f56..1adc481 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -98,12 +98,6 @@ lnet_init_locks(void)
 	mutex_init(&the_lnet.ln_api_mutex);
 }
 
-static void
-lnet_fini_locks(void)
-{
-}
-
-
 static int
 lnet_create_remote_nets_table(void)
 {
@@ -153,8 +147,6 @@ lnet_destroy_locks(void)
 		cfs_percpt_lock_free(the_lnet.ln_net_lock);
 		the_lnet.ln_net_lock = NULL;
 	}
-
-	lnet_fini_locks();
 }
 
 static int
-- 
1.7.1

