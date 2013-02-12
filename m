From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 12 Feb 2013 04:01:49 +0000
Subject: [PATCH 1/5] radeon: Remove redundant NULL check before radeon_i2c_destroy().
Message-Id: <1360641713-24895-2-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1360641713-24895-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>, airlied@linux.ie, alexander.deucher@amd.com, paulmck@linux.vnet.ibm.com, dhowells@redhat.com, mattst88@gmail.com, dri-devel@lists.freedesktop.org

radeon_i2c_destroy on a NULL pointer is a no-op.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_i2c.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
index fc60b74..850df44 100644
--- a/drivers/gpu/drm/radeon/radeon_i2c.c
+++ b/drivers/gpu/drm/radeon/radeon_i2c.c
@@ -1032,10 +1032,8 @@ void radeon_i2c_fini(struct radeon_device *rdev)
 	int i;
 
 	for (i = 0; i < RADEON_MAX_I2C_BUS; i++) {
-		if (rdev->i2c_bus[i]) {
-			radeon_i2c_destroy(rdev->i2c_bus[i]);
-			rdev->i2c_bus[i] = NULL;
-		}
+		radeon_i2c_destroy(rdev->i2c_bus[i]);
+		rdev->i2c_bus[i] = NULL;
 	}
 }
 
-- 
1.7.10.4

