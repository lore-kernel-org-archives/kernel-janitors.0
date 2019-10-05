From: Colin King <colin.king@canonical.com>
Date: Sat, 05 Oct 2019 17:58:08 +0000
Subject: [PATCH] drm/amdkfd: add missing void argument to function kgd2kfd_init
Message-Id: <20191005175808.32018-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function kgd2kfd_init is missing a void argument, add it
to clean up the non-ANSI function declaration.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_module.c b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
index 986ff52d5750..f4b7f7e6c40e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_module.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_module.c
@@ -82,7 +82,7 @@ static void kfd_exit(void)
 	kfd_chardev_exit();
 }
 
-int kgd2kfd_init()
+int kgd2kfd_init(void)
 {
 	return kfd_init();
 }
-- 
2.20.1
