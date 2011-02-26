From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 01:48:18 +0000
Subject: [patch] drm/radeon/r600_cs: off by one errors
Message-Id: <20110226014818.GB18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

There are a bunch of off by one errors in the sanity checks here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 79ac676..41da786 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -159,7 +159,7 @@ static const struct gpu_formats color_formats_table[] = {
 
 static inline bool fmt_is_valid_color(u32 format)
 {
-	if (format > ARRAY_SIZE(color_formats_table))
+	if (format >= ARRAY_SIZE(color_formats_table))
 		return false;
 	
 	if (color_formats_table[format].valid_color)
@@ -170,7 +170,7 @@ static inline bool fmt_is_valid_color(u32 format)
 
 static inline bool fmt_is_valid_texture(u32 format)
 {
-	if (format > ARRAY_SIZE(color_formats_table))
+	if (format >= ARRAY_SIZE(color_formats_table))
 		return false;
 	
 	if (color_formats_table[format].blockwidth > 0)
@@ -181,7 +181,7 @@ static inline bool fmt_is_valid_texture(u32 format)
 
 static inline int fmt_get_blocksize(u32 format)
 {
-	if (format > ARRAY_SIZE(color_formats_table))
+	if (format >= ARRAY_SIZE(color_formats_table))
 		return 0;
 
 	return color_formats_table[format].blocksize;
@@ -190,7 +190,8 @@ static inline int fmt_get_blocksize(u32 format)
 static inline int fmt_get_nblocksx(u32 format, u32 w)
 {
 	unsigned bw;
-	if (format > ARRAY_SIZE(color_formats_table))
+
+	if (format >= ARRAY_SIZE(color_formats_table))
 		return 0;
 
 	bw = color_formats_table[format].blockwidth;
@@ -203,7 +204,8 @@ static inline int fmt_get_nblocksx(u32 format, u32 w)
 static inline int fmt_get_nblocksy(u32 format, u32 h)
 {
 	unsigned bh;
-	if (format > ARRAY_SIZE(color_formats_table))
+
+	if (format >= ARRAY_SIZE(color_formats_table))
 		return 0;
 
 	bh = color_formats_table[format].blockheight;
@@ -216,7 +218,8 @@ static inline int fmt_get_nblocksy(u32 format, u32 h)
 static inline int r600_bpe_from_format(u32 *bpe, u32 format)
 {
  	unsigned res;
-	if (format > ARRAY_SIZE(color_formats_table))
+
+	if (format >= ARRAY_SIZE(color_formats_table))
 		goto fail;
 
 	res = color_formats_table[format].blocksize;
