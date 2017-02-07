From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:16:04 +0000
Subject: [patch] drm/radeon: remove some dead code
Message-Id: <20170207131604.GA27416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

If "rdev->bios" is NULL then we don't need to free it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index 00cfb5d2875f..04c0ed41374f 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -638,10 +638,8 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
 					     vhdr->ImageLength,
 					     GFP_KERNEL);
 
-			if (!rdev->bios) {
-				kfree(rdev->bios);
+			if (!rdev->bios)
 				return false;
-			}
 			return true;
 		}
 	}
