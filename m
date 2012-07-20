From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 11:17:00 +0000
Subject: [patch] drm/radeon: check for allocation failure in radeon_ring_backup()
Message-Id: <20120720111700.GB22245@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>, Jerome Glisse <jglisse@redhat.com>, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

Static checkers complain if this we don't check for allocation failure.
Also we can use the new kmalloc_array() function here as a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeon/radeon_ring.c
index 75cbe46..5a0ef24 100644
--- a/drivers/gpu/drm/radeon/radeon_ring.c
+++ b/drivers/gpu/drm/radeon/radeon_ring.c
@@ -402,7 +402,11 @@ unsigned radeon_ring_backup(struct radeon_device *rdev, struct radeon_ring *ring
 	}
 
 	/* and then save the content of the ring */
-	*data = kmalloc(size * 4, GFP_KERNEL);
+	*data = kmalloc_array(size, sizeof(uint32_t), GFP_KERNEL);
+	if (!*data) {
+		mutex_unlock(&rdev->ring_lock);
+		return 0;
+	}
 	for (i = 0; i < size; ++i) {
 		(*data)[i] = ring->ring[ptr++];
 		ptr &= ring->ptr_mask;
