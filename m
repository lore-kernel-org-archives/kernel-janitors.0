From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 20:10:07 +0000
Subject: [PATCH 3/3] GPU-DRM-Radeon: Use seq_puts() in r100_debugfs_cp_csq_fifo()
Message-Id: <c80a0c58-2da4-2531-fdd6-677c7a9638cb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
In-Reply-To: <74d2df52-f509-e6d2-5b35-e25b7cbd1fbe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 21:54:49 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/radeon/r100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index c31e660e35db..09b88738aa07 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -2992,19 +2992,19 @@ static int r100_debugfs_cp_csq_fifo(struct seq_file *m, void *data)
 	seq_printf(m, "Indirect2 wptr %u\n", ib2_wptr);
 	/* FIXME: 0, 128, 640 depends on fifo setup see cp_init_kms
 	 * 128 = indirect1_start * 8 & 640 = indirect2_start * 8 */
-	seq_printf(m, "Ring fifo:\n");
+	seq_puts(m, "Ring fifo:\n");
 	for (i = 0; i < 256; i++) {
 		WREG32(RADEON_CP_CSQ_ADDR, i << 2);
 		tmp = RREG32(RADEON_CP_CSQ_DATA);
 		seq_printf(m, "rfifo[%04d]=0x%08X\n", i, tmp);
 	}
-	seq_printf(m, "Indirect1 fifo:\n");
+	seq_puts(m, "Indirect1 fifo:\n");
 	for (i = 256; i <= 512; i++) {
 		WREG32(RADEON_CP_CSQ_ADDR, i << 2);
 		tmp = RREG32(RADEON_CP_CSQ_DATA);
 		seq_printf(m, "ib1fifo[%04d]=0x%08X\n", i, tmp);
 	}
-	seq_printf(m, "Indirect2 fifo:\n");
+	seq_puts(m, "Indirect2 fifo:\n");
 	for (i = 640; i < ib1_wptr; i++) {
 		WREG32(RADEON_CP_CSQ_ADDR, i << 2);
 		tmp = RREG32(RADEON_CP_CSQ_DATA);
-- 
2.12.2

