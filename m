From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Mar 2017 20:43:05 +0000
Subject: [PATCH] raid5-ppl: silence a misleading warning message
Message-Id: <20170321204305.GC22118@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shli@kernel.org>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>
Cc: linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

The "need_cache_flush" variable is never set to false.  When the
variable is true that means we print a warning message at the end of
the function.

Fixes: 3418d036c81d ("raid5-ppl: Partial Parity Log write logging implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index 27bad3e2d7ce..86ea9addb51a 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -1070,7 +1070,7 @@ int ppl_init_log(struct r5conf *conf)
 	struct mddev *mddev = conf->mddev;
 	int ret = 0;
 	int i;
-	bool need_cache_flush;
+	bool need_cache_flush = false;
 
 	pr_debug("md/raid:%s: enabling distributed Partial Parity Log\n",
 		 mdname(conf->mddev));
