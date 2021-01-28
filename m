From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 16:59:11 +0000
Subject: [PATCH] media: drxj: remove redundant assignments to variable image_to_select
Message-Id: <20210128165911.644307-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable image_to_select is being initialized with a value that
is never read and it is being updated later with a new value.  The
initialization is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 37b32d9b398d..bf9e4ef35684 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -4775,7 +4775,7 @@ set_frequency(struct drx_demod_instance *demod,
 	bool select_pos_image = false;
 	bool rf_mirror;
 	bool tuner_mirror;
-	bool image_to_select = true;
+	bool image_to_select;
 	s32 fm_frequency_shift = 0;
 
 	rf_mirror = (ext_attr->mirror = DRX_MIRROR_YES) ? true : false;
-- 
2.29.2
