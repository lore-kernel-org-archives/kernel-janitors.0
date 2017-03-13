From: Colin King <colin.king@canonical.com>
Date: Mon, 13 Mar 2017 17:55:12 +0000
Subject: [PATCH] staging/atomisp: remove redundant null check on frame
Message-Id: <20170313175512.18756-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is no need to perform a null check on frame as there is an earlier
null check check and return hence making the null check redundant.
Remove it.

Detected by CoverityScan, CID#1416563 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../media/atomisp/pci/atomisp2/css2400/runtime/frame/src/frame.c       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/frame/src/frame.c
index 25e9d88..604bde6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/frame/src/frame.c
@@ -159,8 +159,7 @@ enum ia_css_err ia_css_frame_allocate(struct ia_css_frame **frame,
 
 #ifndef ISP2401
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-		      "ia_css_frame_allocate() leave: frame=%p\n",
-		      frame ? *frame : (void *)-1);
+		      "ia_css_frame_allocate() leave: frame=%p\n", *frame);
 #else
 	if ((*frame != NULL) && err = IA_CSS_SUCCESS)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-- 
2.10.2

