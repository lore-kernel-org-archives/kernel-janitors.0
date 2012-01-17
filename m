From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 07:31:13 +0000
Subject: [patch] Staging: comedi: logical || vs bitwise |
Message-Id: <20120117073112.GC11358@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These are bitfields and the intend was to OR them together.  A logical
OR here is simply 1.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/dt9812.c b/drivers/staging/comedi/drivers/dt9812.c
index 32d9c42..e86ab58 100644
--- a/drivers/staging/comedi/drivers/dt9812.c
+++ b/drivers/staging/comedi/drivers/dt9812.c
@@ -527,7 +527,7 @@ static void dt9812_configure_gain(struct usb_dt9812 *dev,
 		 * 11x -> Gain =  0.5
 		 */
 	case DT9812_GAIN_0PT5:
-		rmw->or_value = F020_MASK_ADC0CF_AMP0GN2 ||
+		rmw->or_value = F020_MASK_ADC0CF_AMP0GN2 |
 		    F020_MASK_ADC0CF_AMP0GN1;
 		break;
 	case DT9812_GAIN_1:
@@ -540,7 +540,7 @@ static void dt9812_configure_gain(struct usb_dt9812 *dev,
 		rmw->or_value = F020_MASK_ADC0CF_AMP0GN1;
 		break;
 	case DT9812_GAIN_8:
-		rmw->or_value = F020_MASK_ADC0CF_AMP0GN1 ||
+		rmw->or_value = F020_MASK_ADC0CF_AMP0GN1 |
 		    F020_MASK_ADC0CF_AMP0GN0;
 		break;
 	case DT9812_GAIN_16:
