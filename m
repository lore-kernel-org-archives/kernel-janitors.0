From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:33 +0000
Subject: [PATCH 15/16] drm: bridge: dw-hdmi: constify copied structure
Message-Id: <1577864614-5543-16-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

The dw_hdmi_hw structure is only copied into another structure,
so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index 2b7539701b42..dd56996fe9c7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -291,7 +291,7 @@ static irqreturn_t snd_dw_hdmi_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct snd_pcm_hardware dw_hdmi_hw = {
+static const struct snd_pcm_hardware dw_hdmi_hw = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_MMAP |
