From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 16:33:07 +0000
Subject: [PATCH 04/24] use IS_ENABLED() macro
Message-Id: <1358613206-4274-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: corbet@lwn.net
Cc: mchehab@redhat.com, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

replace:
 #if defined(CONFIG_VIDEOBUF2_VMALLOC) || \
     defined(CONFIG_VIDEOBUF2_VMALLOC_MODULE)
with:
 #if IS_ENABLED(CONFIG_VIDEOBUF2_VMALLOC)

This change was made for: CONFIG_VIDEOBUF2_VMALLOC,
CONFIG_VIDEOBUF2_DMA_CONTIG, CONFIG_VIDEOBUF2_DMA_SG

Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/media/platform/marvell-ccic/mcam-core.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.h b/drivers/media/platform/marvell-ccic/mcam-core.h
index 5e802c6..6c53ac9 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.h
+++ b/drivers/media/platform/marvell-ccic/mcam-core.h
@@ -15,15 +15,15 @@
  * Create our own symbols for the supported buffer modes, but, for now,
  * base them entirely on which videobuf2 options have been selected.
  */
-#if defined(CONFIG_VIDEOBUF2_VMALLOC) || defined(CONFIG_VIDEOBUF2_VMALLOC_MODULE)
+#if IS_ENABLED(CONFIG_VIDEOBUF2_VMALLOC)
 #define MCAM_MODE_VMALLOC 1
 #endif
 
-#if defined(CONFIG_VIDEOBUF2_DMA_CONTIG) || defined(CONFIG_VIDEOBUF2_DMA_CONTIG_MODULE)
+#if IS_ENABLED(CONFIG_VIDEOBUF2_DMA_CONTIG)
 #define MCAM_MODE_DMA_CONTIG 1
 #endif
 
-#if defined(CONFIG_VIDEOBUF2_DMA_SG) || defined(CONFIG_VIDEOBUF2_DMA_SG_MODULE)
+#if IS_ENABLED(CONFIG_VIDEOBUF2_DMA_SG)
 #define MCAM_MODE_DMA_SG 1
 #endif
 
-- 
1.7.11.7

