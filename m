From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 19:37:53 +0000
Subject: [PATCH 14/20] staging: lustre: obdclass: obd_config: remove unneeded null test before free
Message-Id: <1430509086-22132-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430509086-22132-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Kfree can cope with a null argument, so drop null tests.

The semantic patch that identifies this issue is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression ptr; @@

- if (ptr != NULL)
  kfree(ptr);
// </smpl>

The first part of the patch introduces new labels to avoid unnecessary
calls to kfree.  In addition, lprof->lp_md is always null in the cleanup
code at the end of the function, so that kfree is just dropped.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/obd_config.c |   24 ++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/obd_config.c b/drivers/staging/lustre/lustre/obdclass/obd_config.c
index 687fbbd..0bda9c5 100644
--- a/drivers/staging/lustre/lustre/obdclass/obd_config.c
+++ b/drivers/staging/lustre/lustre/obdclass/obd_config.c
@@ -869,7 +869,7 @@ int class_add_profile(int proflen, char *prof, int osclen, char *osc,
 	lprof->lp_profile = kzalloc(proflen, GFP_NOFS);
 	if (lprof->lp_profile = NULL) {
 		err = -ENOMEM;
-		goto out;
+		goto free_lprof;
 	}
 	memcpy(lprof->lp_profile, prof, proflen);
 
@@ -877,7 +877,7 @@ int class_add_profile(int proflen, char *prof, int osclen, char *osc,
 	lprof->lp_dt = kzalloc(osclen, GFP_NOFS);
 	if (lprof->lp_dt = NULL) {
 		err = -ENOMEM;
-		goto out;
+		goto free_lp_profile;
 	}
 	memcpy(lprof->lp_dt, osc, osclen);
 
@@ -886,7 +886,7 @@ int class_add_profile(int proflen, char *prof, int osclen, char *osc,
 		lprof->lp_md = kzalloc(mdclen, GFP_NOFS);
 		if (lprof->lp_md = NULL) {
 			err = -ENOMEM;
-			goto out;
+			goto free_lp_dt;
 		}
 		memcpy(lprof->lp_md, mdc, mdclen);
 	}
@@ -894,13 +894,11 @@ int class_add_profile(int proflen, char *prof, int osclen, char *osc,
 	list_add(&lprof->lp_list, &lustre_profile_list);
 	return err;
 
-out:
-	if (lprof->lp_md)
-		kfree(lprof->lp_md);
-	if (lprof->lp_dt)
-		kfree(lprof->lp_dt);
-	if (lprof->lp_profile)
-		kfree(lprof->lp_profile);
+free_lp_dt:
+	kfree(lprof->lp_dt);
+free_lp_profile:
+	kfree(lprof->lp_profile);
+free_lprof:
 	kfree(lprof);
 	return err;
 }
@@ -916,8 +914,7 @@ void class_del_profile(const char *prof)
 		list_del(&lprof->lp_list);
 		kfree(lprof->lp_profile);
 		kfree(lprof->lp_dt);
-		if (lprof->lp_md)
-			kfree(lprof->lp_md);
+		kfree(lprof->lp_md);
 		kfree(lprof);
 	}
 }
@@ -932,8 +929,7 @@ void class_del_profiles(void)
 		list_del(&lprof->lp_list);
 		kfree(lprof->lp_profile);
 		kfree(lprof->lp_dt);
-		if (lprof->lp_md)
-			kfree(lprof->lp_md);
+		kfree(lprof->lp_md);
 		kfree(lprof);
 	}
 }

