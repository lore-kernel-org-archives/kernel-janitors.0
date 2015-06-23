From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Jun 2015 11:51:48 +0000
Subject: [patch -next] drm/radeon: missing break statement
Message-Id: <20150623115148.GA6302@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org

There was a merge problem in linux-next 4598d330d29e ('Merge
remote-tracking branch 'drm/drm-next'').  We need to add a break
statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index b4b457d..4a119c2 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -578,6 +578,7 @@ static int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 		break;
 	case RADEON_INFO_VA_UNMAP_WORKING:
 		*value = true;
+		break;
 	case RADEON_INFO_GPU_RESET_COUNTER:
 		*value = atomic_read(&rdev->gpu_reset_counter);
 		break;
