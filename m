From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:53 +0000
Subject: [PATCH 2/7] lustre: lmv: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace uses of OBD_ALLOC_LARGE by libcfs_kvzalloc and OBD_FREE_LARGE by
kvfree.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,size;
@@

- OBD_ALLOC_LARGE(ptr,size)
+ ptr = libcfs_kvzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_FREE_LARGE(ptr, size);
+ kvfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lmv/lmv_obd.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lmv/lmv_obd.c b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
index aca686a..ac5053c 100644
--- a/drivers/staging/lustre/lustre/lmv/lmv_obd.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
@@ -1045,7 +1045,7 @@ static int lmv_iocontrol(unsigned int cmd, struct obd_export *exp,
 				reqlen = offsetof(typeof(*hur),
 						  hur_user_item[nr])
 					 + hur->hur_request.hr_data_len;
-				OBD_ALLOC_LARGE(req, reqlen);
+				req = libcfs_kvzalloc(reqlen, GFP_NOFS);
 				if (req = NULL)
 					return -ENOMEM;
 
@@ -1055,7 +1055,7 @@ static int lmv_iocontrol(unsigned int cmd, struct obd_export *exp,
 						    reqlen, req, uarg);
 				if (rc1 != 0 && rc = 0)
 					rc = rc1;
-				OBD_FREE_LARGE(req, reqlen);
+				kvfree(req);
 			}
 		}
 		break;
@@ -2400,13 +2400,13 @@ static int lmv_packmd(struct obd_export *exp, struct lov_mds_md **lmmp,
 		return mea_size;
 
 	if (*lmmp && !lsm) {
-		OBD_FREE_LARGE(*lmmp, mea_size);
+		kvfree(*lmmp);
 		*lmmp = NULL;
 		return 0;
 	}
 
 	if (*lmmp = NULL) {
-		OBD_ALLOC_LARGE(*lmmp, mea_size);
+		*lmmp = libcfs_kvzalloc(mea_size, GFP_NOFS);
 		if (*lmmp = NULL)
 			return -ENOMEM;
 	}
@@ -2449,14 +2449,14 @@ static int lmv_unpackmd(struct obd_export *exp, struct lov_stripe_md **lsmp,
 		return mea_size;
 
 	if (*lsmp != NULL && lmm = NULL) {
-		OBD_FREE_LARGE(*tmea, mea_size);
+		kvfree(*tmea);
 		*lsmp = NULL;
 		return 0;
 	}
 
 	LASSERT(mea_size = lmm_size);
 
-	OBD_ALLOC_LARGE(*tmea, mea_size);
+	*tmea = libcfs_kvzalloc(mea_size, GFP_NOFS);
 	if (*tmea = NULL)
 		return -ENOMEM;
 

