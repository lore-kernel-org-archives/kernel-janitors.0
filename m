From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Apr 2019 09:46:27 +0000
Subject: [PATCH v3 resend] media: davinci/vpbe: array underflow in vpbe_enum_outputs()
Message-Id: <20190424094627.GB15818@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180517090550.GB4250@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

In vpbe_enum_outputs() we check if (temp_index >= cfg->num_outputs) but
the problem is that "temp_index" can be negative.  This patch changes
the types to unsigned to address this array underflow bug.

Fixes: 66715cdc3224 ("[media] davinci vpbe: VPBE display driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
---
I sent this patch last May but somehow the spam filters on the lists
must have eaten it.  I didn't get a copy from the kernel-janitors list.
The only trace I have of my original patch is that the maintainer Acked
it.  Resending.

v2: In the first version, I clamped output->index to 0-INT_MAX for every
    driver.  In v2, I only changed the vpbe.h driver header file.
v3: In v3 I changed the header and the .c file (All three versions of
    patch "worked", they just had philosophical and style issues).

 drivers/media/platform/davinci/vpbe.c | 2 +-
 include/media/davinci/vpbe.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index 8339163a5231..4e24f5d781f4 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -104,7 +104,7 @@ static int vpbe_enum_outputs(struct vpbe_device *vpbe_dev,
 			     struct v4l2_output *output)
 {
 	struct vpbe_config *cfg = vpbe_dev->cfg;
-	int temp_index = output->index;
+	unsigned int temp_index = output->index;
 
 	if (temp_index >= cfg->num_outputs)
 		return -EINVAL;
diff --git a/include/media/davinci/vpbe.h b/include/media/davinci/vpbe.h
index 5c31a7682492..f76d2f25a824 100644
--- a/include/media/davinci/vpbe.h
+++ b/include/media/davinci/vpbe.h
@@ -92,7 +92,7 @@ struct vpbe_config {
 	struct encoder_config_info *ext_encoders;
 	/* amplifier information goes here */
 	struct amp_config_info *amp;
-	int num_outputs;
+	unsigned int num_outputs;
 	/* Order is venc outputs followed by LCD and then external encoders */
 	struct vpbe_output *outputs;
 };
-- 
2.18.0
