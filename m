From: Luca Tettamanti <kronos.it@gmail.com>
Date: Wed, 03 Oct 2012 13:03:15 +0000
Subject: Re: [drm:drm-next 169/234] drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu' expects
Message-Id: <20121003130315.GA27943@growl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ibTvN161/egqYuK8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003011822.GD8750@localhost>
In-Reply-To: <20121003011822.GD8750@localhost>
To: kernel-janitors@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 03, 2012 at 09:18:22AM +0800, Fengguang Wu wrote:
> All warnings:
> 
> drivers/gpu/drm/radeon/radeon_acpi.c: In function 'radeon_atif_verify_interface':
> drivers/gpu/drm/radeon/radeon_acpi.c:128:3: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' [-Wformat]

Yup, %lu is wrong on 32bit. There's also another occurence in that file,
attached patch agains drm-next fixes both.

Luca

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-drm-radeon-use-zu-for-formatting-size_t.patch"

From d0c3d0f858d3f2cdae2bbf63aac0303d4c14aa9a Mon Sep 17 00:00:00 2001
From: Luca Tettamanti <kronos.it@gmail.com>
Date: Wed, 3 Oct 2012 15:00:19 +0200
Subject: [PATCH] drm/radeon: use %zu for formatting size_t

Fixes compiler warnings on 32bit.

Signed-off-by: Luca Tettamanti <kronos.it@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_acpi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index c3976eb..faf1ed5 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -203,7 +203,7 @@ static int radeon_atif_verify_interface(acpi_handle handle,
 
 	size = *(u16 *) info->buffer.pointer;
 	if (size < 12) {
-		DRM_INFO("ATIF buffer is too small: %lu\n", size);
+		DRM_INFO("ATIF buffer is too small: %zu\n", size);
 		err = -EINVAL;
 		goto out;
 	}
@@ -487,7 +487,7 @@ static int radeon_atcs_verify_interface(acpi_handle handle,
 
 	size = *(u16 *) info->buffer.pointer;
 	if (size < 8) {
-		DRM_INFO("ATCS buffer is too small: %lu\n", size);
+		DRM_INFO("ATCS buffer is too small: %zu\n", size);
 		err = -EINVAL;
 		goto out;
 	}
-- 
1.7.10.4


--ibTvN161/egqYuK8--
