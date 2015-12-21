From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 19:13:18 +0000
Subject: [PATCH v2 4/4] staging: lustre: Fix a jump label position in osc_get_info()
Message-Id: <56784F4E.3070808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <56784D83.7080108@users.sourceforge.net>
In-Reply-To: <56784D83.7080108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 19:30:42 +0100

The script "checkpatch.pl" pointed out that labels should not be indented.
Thus delete a horizontal tab before the jump label "out"
in the function "osc_get_info".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/lustre/lustre/osc/osc_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/osc/osc_request.c b/drivers/staging/lustre/lustre/osc/osc_request.c
index d6c1447..85ab180 100644
--- a/drivers/staging/lustre/lustre/osc/osc_request.c
+++ b/drivers/staging/lustre/lustre/osc/osc_request.c
@@ -2727,7 +2727,7 @@ static int osc_get_info(const struct lu_env *env, struct obd_export *exp,
 		}
 
 		*((u64 *)val) = *reply;
-	out:
+out:
 		ptlrpc_req_finished(req);
 		return rc;
 	} else if (KEY_IS(KEY_FIEMAP)) {
-- 
2.6.3

