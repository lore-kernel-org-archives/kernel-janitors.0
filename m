From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 16:59:01 +0000
Subject: [PATCH 03/12] staging: lustre: lclient: Use !x to check for kzalloc failure
Message-Id: <1434819550-3193-4-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/lclient/lcommon_cl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/lustre/lustre/lclient/lcommon_cl.c b/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
--- a/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
+++ b/drivers/staging/lustre/lustre/lclient/lcommon_cl.c
@@ -203,7 +203,7 @@ struct lu_device *ccc_device_alloc(const
 	int rc;
 
 	vdv = kzalloc(sizeof(*vdv), GFP_NOFS);
-	if (vdv = NULL)
+	if (!vdv)
 		return ERR_PTR(-ENOMEM);
 
 	lud = &vdv->cdv_cl.cd_lu_dev;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
