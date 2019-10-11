From: Colin King <colin.king@canonical.com>
Date: Fri, 11 Oct 2019 13:29:40 +0000
Subject: [PATCH][next] media: ti-vpe: vpe: use r2y instead of y2r, copy-paste error
Message-Id: <20191011132940.8995-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There appears to be a copy-paste error on the access of
csc_coeffs.y2r.r601.full.coeff, I believe csc_coeffs.2yr.r601.full.coeff
should be used instead. This is a moot point as the code is never
reached, but at least use the correct structure element.

Addresses-Coverity: ("Copy-paste error")
Fixes: 3ff3a712a9ea ("media: ti-vpe: vpe: don't rely on colorspace member for conversion")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/ti-vpe/csc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index bd923bee4a31..834114a4eebe 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -238,7 +238,7 @@ void csc_set_coeff(struct csc_data *csc, u32 *csc_reg0,
 				coeff = csc_coeffs.r2y.r709.limited.coeff;
 		} else {
 			/* Should never reach this, but it keeps gcc happy */
-			coeff = csc_coeffs.y2r.r601.full.coeff;
+			coeff = csc_coeffs.r2y.r601.full.coeff;
 		}
 	} else {
 		*csc_reg5 |= CSC_BYPASS;
-- 
2.20.1
