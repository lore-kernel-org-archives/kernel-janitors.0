From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:09 +0000
Subject: [PATCH 11/12] staging: lustre: osc: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-12-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/osc/osc_dev.c     |    2 +-
 drivers/staging/lustre/lustre/osc/osc_request.c |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/osc/osc_request.c b/drivers/staging/lustre/lustre/osc/osc_request.c
--- a/drivers/staging/lustre/lustre/osc/osc_request.c
+++ b/drivers/staging/lustre/lustre/osc/osc_request.c
@@ -119,7 +119,7 @@ static int osc_packmd(struct obd_export
 
 	if (*lmmp = NULL) {
 		*lmmp = kzalloc(lmm_size, GFP_NOFS);
-		if (*lmmp = NULL)
+		if (!*lmmp)
 			return -ENOMEM;
 	}
 
@@ -1909,7 +1909,7 @@ int osc_build_rpc(const struct lu_env *e
 		mpflag = cfs_memory_pressure_get_and_set();
 
 	crattr = kzalloc(sizeof(*crattr), GFP_NOFS);
-	if (crattr = NULL) {
+	if (!crattr) {
 		rc = -ENOMEM;
 		goto out;
 	}
diff -u -p a/drivers/staging/lustre/lustre/osc/osc_dev.c b/drivers/staging/lustre/lustre/osc/osc_dev.c
--- a/drivers/staging/lustre/lustre/osc/osc_dev.c
+++ b/drivers/staging/lustre/lustre/osc/osc_dev.c
@@ -218,7 +218,7 @@ static struct lu_device *osc_device_allo
 	int rc;
 
 	od = kzalloc(sizeof(*od), GFP_NOFS);
-	if (od = NULL)
+	if (!od)
 		return ERR_PTR(-ENOMEM);
 
 	cl_device_init(&od->od_cl, t);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
