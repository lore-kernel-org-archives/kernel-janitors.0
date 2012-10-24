From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 24 Oct 2012 14:42:26 +0000
Subject: [PATCH] drivers/gpu/drm/radeon/evergreen_cs.c: Remove unnecessary semicolon
Message-Id: <1351089746-5552-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: airlied@redhat.com, alexander.deucher@amd.com, maraeo@gmail.com, jglisse@redhat.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r1@
statement S;
position p,p1;
@@
S@p1;@p

@script:python r2@
p << r1.p;
p1 << r1.p1;
@@
if p[0].line != p1[0].line_end:
        cocci.include_match(False)
@@
position r1.p;
@@
-;@p
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---

The full version of the semantic patch can be found at:
http://www.mail-archive.com/cocci@systeme.lip6.fr/msg00014.html

 drivers/gpu/drm/radeon/evergreen_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index 573ed1b..5daf0c5 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -264,7 +264,7 @@ static int evergreen_surface_check_2d(struct radeon_cs_parser *p,
 	/* macro tile width & height */
 	palign = (8 * surf->bankw * track->npipes) * surf->mtilea;
 	halign = (8 * surf->bankh * surf->nbanks) / surf->mtilea;
-	mtileb = (palign / 8) * (halign / 8) * tileb;;
+	mtileb = (palign / 8) * (halign / 8) * tileb;
 	mtile_pr = surf->nbx / palign;
 	mtile_ps = (mtile_pr * surf->nby) / halign;
 	surf->layer_size = mtile_ps * mtileb * slice_pt;
-- 
1.7.11.7

