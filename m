From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Dec 2015 19:10:25 +0000
Subject: [PATCH v2 2/4] staging: lustre: Delete an unnecessary variable initialisation in mgc_process_recover
Message-Id: <56784EA1.3090407@users.sourceforge.net>
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
Date: Mon, 21 Dec 2015 18:24:45 +0100

The variable "mne_swab" will eventually be set to an appropriate value
from a call of the ptlrpc_rep_need_swab() function.
Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/lustre/lustre/mgc/mgc_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/lustre/lustre/mgc/mgc_request.c b/drivers/staging/lustre/lustre/mgc/mgc_request.c
index 2c48847..da130f4 100644
--- a/drivers/staging/lustre/lustre/mgc/mgc_request.c
+++ b/drivers/staging/lustre/lustre/mgc/mgc_request.c
@@ -1293,7 +1293,7 @@ static int mgc_process_recover_log(struct obd_device *obd,
 	struct page **pages;
 	int nrpages;
 	bool eof = true;
-	bool mne_swab = false;
+	bool mne_swab;
 	int i;
 	int ealen;
 	int rc;
-- 
2.6.3

