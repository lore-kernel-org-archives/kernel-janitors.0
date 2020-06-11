From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Jun 2020 14:08:31 +0000
Subject: [PATCH] media: atomisp: make const arrays static, makes object smaller
Message-Id: <20200611140831.924488-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const arrays on the stack but instead make them
static. Makes the object code smaller by 150 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 111083	  23692	     64	 134839	  20eb7	atomisp/pci/atomisp_compat_css20.o

After:
   text	   data	    bss	    dec	    hex	filename
 110773	  23852	     64	 134689	  20e21	atomisp/pci/atomisp_compat_css20.o

After:

(gcc version 9.3.0, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 71914d364ad9..9498aecf3be7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2410,13 +2410,13 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 	struct ia_css_resolution  *effective_res  		    &stream_config->input_config.effective_res;
 
-	const struct bayer_ds_factor bds_fct[] = {{2, 1}, {3, 2}, {5, 4} };
+	static const struct bayer_ds_factor bds_fct[] = {{2, 1}, {3, 2}, {5, 4} };
 	/*
 	 * BZ201033: YUV decimation factor of 4 causes couple of rightmost
 	 * columns to be shaded. Remove this factor to work around the CSS bug.
 	 * const unsigned int yuv_dec_fct[] = {4, 2};
 	 */
-	const unsigned int yuv_dec_fct[] = { 2 };
+	static const unsigned int yuv_dec_fct[] = { 2 };
 	unsigned int i;
 
 	if (width = 0 && height = 0)
@@ -2536,7 +2536,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	struct ia_css_resolution  *effective_res  		    &stream_config->input_config.effective_res;
 
-	const struct bayer_ds_factor bds_factors[] = {
+	static const struct bayer_ds_factor bds_factors[] = {
 		{8, 1}, {6, 1}, {4, 1}, {3, 1}, {2, 1}, {3, 2}
 	};
 	unsigned int i;
-- 
2.27.0.rc0
