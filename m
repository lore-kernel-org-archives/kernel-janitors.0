From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2014 20:01:30 +0000
Subject: [patch] drm/radeon: delete a stray tab
Message-Id: <20140217200130.GA22453@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerome Glisse <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org

Static checkers complain that probably curly braces were intended here,
but actually it makes more sense to remove the extra tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index f2b9e21ce4da..5623e7542d99 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -1680,7 +1680,7 @@ bool evergreen_hpd_sense(struct radeon_device *rdev, enum radeon_hpd_id hpd)
 	case RADEON_HPD_6:
 		if (RREG32(DC_HPD6_INT_STATUS) & DC_HPDx_SENSE)
 			connected = true;
-			break;
+		break;
 	default:
 		break;
 	}
