From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:05 +0000
Subject: [PATCH 07/12] staging: lustre: mdc: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

!x is more normal for kzalloc failure in the kernel.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
statement S1, S2;
@@

x = kzalloc(...);
if (
- x = NULL
+ !x
 ) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/mdc/mdc_request.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/mdc/mdc_request.c b/drivers/staging/lustre/lustre/mdc/mdc_request.c
--- a/drivers/staging/lustre/lustre/mdc/mdc_request.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_request.c
@@ -1202,7 +1202,7 @@ static int mdc_ioc_fid2path(struct obd_e
 	/* Key is KEY_FID2PATH + getinfo_fid2path description */
 	keylen = cfs_size_round(sizeof(KEY_FID2PATH)) + sizeof(*gf);
 	key = kzalloc(keylen, GFP_NOFS);
-	if (key = NULL)
+	if (!key)
 		return -ENOMEM;
 	memcpy(key, KEY_FID2PATH, sizeof(KEY_FID2PATH));
 	memcpy(key + cfs_size_round(sizeof(KEY_FID2PATH)), gf, sizeof(*gf));
@@ -1605,7 +1605,7 @@ static int mdc_changelog_send_thread(voi
 	       cs->cs_fp, cs->cs_startrec);
 
 	cs->cs_buf = kzalloc(KUC_CHANGELOG_MSG_MAXSIZE, GFP_NOFS);
-	if (cs->cs_buf = NULL) {
+	if (!cs->cs_buf) {
 		rc = -ENOMEM;
 		goto out;
 	}
@@ -1934,7 +1934,7 @@ static int mdc_iocontrol(unsigned int cm
 		struct obd_quotactl *oqctl;
 
 		oqctl = kzalloc(sizeof(*oqctl), GFP_NOFS);
-		if (oqctl = NULL) {
+		if (!oqctl) {
 			rc = -ENOMEM;
 			goto out;
 		}

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
