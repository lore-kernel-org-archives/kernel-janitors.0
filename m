From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jun 2015 12:05:56 +0000
Subject: [PATCH] fs-DLM: Delete unnecessary checks before the function call "kfree"
Message-Id: <558D4024.60003@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <5479FBA2.5020405@users.sourceforge.net>
In-Reply-To: <5479FBA2.5020405@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jun 2015 14:00:06 +0200

The kfree() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/lockspace.c | 6 ++----
 fs/dlm/memory.c    | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index f3e7278..41c53b3 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -673,10 +673,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	kfree(ls->ls_recover_buf);
  out_lkbidr:
 	idr_destroy(&ls->ls_lkbidr);
-	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++) {
-		if (ls->ls_remove_names[i])
-			kfree(ls->ls_remove_names[i]);
-	}
+	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++)
+		kfree(ls->ls_remove_names[i]);
  out_rsbtbl:
 	vfree(ls->ls_rsbtbl);
  out_lsfree:
diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 7cd24bc..2d2eaa0 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -86,8 +86,7 @@ void dlm_free_lkb(struct dlm_lkb *lkb)
 		struct dlm_user_args *ua;
 		ua = lkb->lkb_ua;
 		if (ua) {
-			if (ua->lksb.sb_lvbptr)
-				kfree(ua->lksb.sb_lvbptr);
+			kfree(ua->lksb.sb_lvbptr);
 			kfree(ua);
 		}
 	}
-- 
2.4.4

