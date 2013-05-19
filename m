From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 May 2013 12:59:50 +0000
Subject: [patch] gru: fix a sanity test in gru_set_context_option()
Message-Id: <20130519125950.GA17651@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitri Sivanich <sivanich@sgi.com>
Cc: Robin Holt <holt@sgi.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"req.val1 = -1" is valid but it doesn't make sense to check
gru_base[-1].  gru_base[] is a global array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index c4acac7..e7c37b2 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -876,7 +876,8 @@ int gru_set_context_option(unsigned long arg)
 	switch (req.op) {
 	case sco_blade_chiplet:
 		/* Select blade/chiplet for GRU context */
-		if (req.val1 < -1 || req.val1 >= GRU_MAX_BLADES || !gru_base[req.val1] ||
+		if (req.val1 < -1 || req.val1 >= GRU_MAX_BLADES ||
+		    (req.val1 != -1 && !gru_base[req.val1]) ||
 		    req.val0 < -1 || req.val0 >= GRU_CHIPLETS_PER_HUB) {
 			ret = -EINVAL;
 		} else {
