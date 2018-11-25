From: Colin King <colin.king@canonical.com>
Date: Sun, 25 Nov 2018 23:25:24 +0000
Subject: [PATCH] drm/i915/gvt: fix spelling mistake "Interupts" -> "Interrupts"
Message-Id: <20181125232524.14672-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gvt/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 5daa23ae566b..6b9d1354ff29 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -126,7 +126,7 @@ static const char * const irq_name[INTEL_GVT_EVENT_MAX] = {
 	[FDI_RX_INTERRUPTS_TRANSCODER_C] = "FDI RX Interrupts Combined C",
 	[AUDIO_CP_CHANGE_TRANSCODER_C] = "Audio CP Change Transcoder C",
 	[AUDIO_CP_REQUEST_TRANSCODER_C] = "Audio CP Request Transcoder C",
-	[ERR_AND_DBG] = "South Error and Debug Interupts Combined",
+	[ERR_AND_DBG] = "South Error and Debug Interrupts Combined",
 	[GMBUS] = "Gmbus",
 	[SDVO_B_HOTPLUG] = "SDVO B hotplug",
 	[CRT_HOTPLUG] = "CRT Hotplug",
-- 
2.19.1
