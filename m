From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:58 +0000
Subject: [PATCH 9/20] staging: lustre: lmv: remove unneeded null test before free
Message-Id: <1430509086-22132-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/lmv/lmv_obd.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lmv/lmv_obd.c b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
index 59b8fac..8e05852 100644
--- a/drivers/staging/lustre/lustre/lmv/lmv_obd.c
+++ b/drivers/staging/lustre/lustre/lmv/lmv_obd.c
@@ -504,8 +504,7 @@ static int lmv_add_target(struct obd_device *obd, struct obd_uuid *uuidp,
 		lmv->tgts = newtgts;
 		lmv->tgts_size = newsize;
 		smp_rmb();
-		if (old)
-			kfree(old);
+		kfree(old);
 
 		CDEBUG(D_CONFIG, "tgts: %p size: %d\n", lmv->tgts,
 		       lmv->tgts_size);
@@ -780,8 +779,7 @@ repeat_fid2path:
 	goto repeat_fid2path;
 
 out_fid2path:
-	if (remote_gf != NULL)
-		kfree(remote_gf);
+	kfree(remote_gf);
 	return rc;
 }
 

