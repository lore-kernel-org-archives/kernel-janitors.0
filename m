From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:10:46 +0000
Subject: [patch] [media] davinci: vpfe: dm365: remove duplicate RSZ_LPF_INT_MASK
Message-Id: <20140609151046.GE9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The RSZ_LPF_INT_MASK define is cut and pasted twice so we can remove the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
index 010fdb2..81176fb 100644
--- a/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
+++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe_hw.h
@@ -479,7 +479,6 @@
 #define RSZ_TYP_Y_SHIFT			0
 #define RSZ_TYP_C_SHIFT			1
 #define RSZ_LPF_INT_MASK		0x3f
-#define RSZ_LPF_INT_MASK		0x3f
 #define RSZ_LPF_INT_C_SHIFT		6
 #define RSZ_H_PHS_MASK			0x3fff
 #define RSZ_H_DIF_MASK			0x3fff
