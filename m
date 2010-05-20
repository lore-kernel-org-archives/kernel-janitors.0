From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:36:28 +0000
Subject: [PATCH 06/11] V4L/DVB: omap_vout: Storage class should be before const qualifier
Message-Id: <1274344588-9034-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/media/video/omap/omap_vout.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/omap/omap_vout.c b/drivers/media/video/omap/omap_vout.c
index 4c0ab49..d6a2ae1 100644
--- a/drivers/media/video/omap/omap_vout.c
+++ b/drivers/media/video/omap/omap_vout.c
@@ -128,7 +128,7 @@ module_param(debug, bool, S_IRUGO);
 MODULE_PARM_DESC(debug, "Debug level (0-1)");
 
 /* list of image formats supported by OMAP2 video pipelines */
-const static struct v4l2_fmtdesc omap_formats[] = {
+static const struct v4l2_fmtdesc omap_formats[] = {
 	{
 		/* Note:  V4L2 defines RGB565 as:
 		 *
-- 
1.6.3.3

