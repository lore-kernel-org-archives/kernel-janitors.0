From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Nov 2008 16:54:40 +0000
Subject: [PATCH 2/8] drivers/isdn/mISDN: use ARRAY_SIZE
Message-Id: <Pine.LNX.4.64.0811091754170.32509@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kkeil@suse.de, isdn4linux@listserv.isdn4linux.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ARRAY_SIZE is more concise to use when the size of an array is divided by
the size of its type or the size of its first element.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(T))
+ ARRAY_SIZE(E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/isdn/mISDN/dsp_hwec.c     |    2 +-
 drivers/isdn/mISDN/dsp_pipeline.c |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/isdn/mISDN/dsp_hwec.c b/drivers/isdn/mISDN/dsp_hwec.c
index eb892d9..806a997 100644
--- a/drivers/isdn/mISDN/dsp_hwec.c
+++ b/drivers/isdn/mISDN/dsp_hwec.c
@@ -43,7 +43,7 @@ static struct mISDN_dsp_element dsp_hwec_p = {
 	.free = NULL,
 	.process_tx = NULL,
 	.process_rx = NULL,
-	.num_args = sizeof(args) / sizeof(struct mISDN_dsp_element_arg),
+	.num_args = ARRAY_SIZE(args),
 	.args = args,
 };
 struct mISDN_dsp_element *dsp_hwec = &dsp_hwec_p;
diff --git a/drivers/isdn/mISDN/dsp_pipeline.c b/drivers/isdn/mISDN/dsp_pipeline.c
index 850260a..45bff0a 100644
--- a/drivers/isdn/mISDN/dsp_pipeline.c
+++ b/drivers/isdn/mISDN/dsp_pipeline.c
@@ -99,8 +99,7 @@ int mISDN_dsp_element_register(struct mISDN_dsp_element *elem)
 		goto err1;
 	}
 
-	for (i = 0; i < (sizeof(element_attributes)
-		/ sizeof(struct device_attribute)); ++i)
+	for (i = 0; i < ARRAY_SIZE(element_attributes); ++i)
 		ret = device_create_file(&entry->dev,
 				&element_attributes[i]);
 		if (ret) {
