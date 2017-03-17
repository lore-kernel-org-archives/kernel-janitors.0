From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 20:45:05 +0000
Subject: [PATCH] Staging: atomisp: fix an uninitialized variable bug
Message-Id: <20170317204505.GC16505@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

There are some error paths in atomisp_css_frame_allocate() which don't
initialize "res" so it could lead us to try release random memory.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index d9a5c24633cb..0f01047cdf8e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -4733,7 +4733,7 @@ static int
 atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 					 struct atomisp_css_frame **result)
 {
-	struct atomisp_css_frame *res;
+	struct atomisp_css_frame *res = NULL;
 	unsigned int padded_width;
 	enum atomisp_css_frame_format sh_format;
 	char *tmp_buf = NULL;
