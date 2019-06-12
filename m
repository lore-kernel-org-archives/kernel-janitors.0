From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Jun 2019 14:42:18 +0000
Subject: [PATCH][next] staging: media: meson: remove redundant initialization of mpeg12
Message-Id: <20190612144218.26149-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Jourdan <mjourdan@baylibre.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, linux-media@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer mpeg12 is being initialized however that value is never
read and mpeg12 is being re-assigned almost immediately afterwards.
Remove the redundant initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 5398fbf7ce20..48869cc3d973 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -63,7 +63,7 @@ static void codec_mpeg12_recycle(struct amvdec_core *core, u32 buf_idx)
 static int codec_mpeg12_start(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
-	struct codec_mpeg12 *mpeg12 = sess->priv;
+	struct codec_mpeg12 *mpeg12;
 	int ret;
 
 	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
-- 
2.20.1
