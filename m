From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:24:32 +0000
Subject: [PATCH 25/42] drivers/gpu/drm/radeon: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052224130.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/radeon/evergreen.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index 957d506..1a2797c 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -136,7 +136,7 @@ bool evergreen_hpd_sense(struct radeon_device *rdev, enum radeon_hpd_id hpd)
 	case RADEON_HPD_6:
 		if (RREG32(DC_HPD6_INT_STATUS) & DC_HPDx_SENSE)
 			connected = true;
-			break;
+		break;
 	default:
 		break;
 	}
