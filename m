From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 17 Jun 2019 12:10:10 +0000
Subject: [PATCH] drm/amd/display: Delete a redundant memory setting in amdgpu_dm_irq_register_interrupt()
Message-Id: <3900e9c8-4905-1704-686d-90ccf3b00a88@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Mario Kleiner <mario.kleiner.de@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Jun 2019 13:56:39 +0200

The memory was set to zero already by a call of the function “kzalloc”.
Thus remove an extra call of the function “memset” for this purpose.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 1b59d3d42f7b..fa5d503d379c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -277,8 +277,6 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 		return DAL_INVALID_IRQ_HANDLER_IDX;
 	}

-	memset(handler_data, 0, sizeof(*handler_data));
-
 	init_handler_common_data(handler_data, ih, handler_args, &adev->dm);

 	irq_source = int_params->irq_source;
--
2.22.0
