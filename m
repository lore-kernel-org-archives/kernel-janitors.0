From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:23 +0000
Subject: [PATCH 05/16] media: isif: constify copied structure
Message-Id: <1577864614-5543-6-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The isif_config_defaults structure is only copied into another
structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/davinci/isif.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
index b49378b18e5d..c98edb67cfb2 100644
--- a/drivers/media/platform/davinci/isif.c
+++ b/drivers/media/platform/davinci/isif.c
@@ -29,7 +29,7 @@
 #include "ccdc_hw_device.h"
 
 /* Defaults for module configuration parameters */
-static struct isif_config_params_raw isif_config_defaults = {
+static const struct isif_config_params_raw isif_config_defaults = {
 	.linearize = {
 		.en = 0,
 		.corr_shft = ISIF_NO_SHIFT,
